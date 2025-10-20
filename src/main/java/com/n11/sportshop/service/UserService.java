package com.n11.sportshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.n11.sportshop.domain.Role;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.dto.RegisterDTO;
import com.n11.sportshop.repository.RoleRepository;
import com.n11.sportshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ImageService imageService;
    private final PasswordEncoder passwordEncoder;

    public UserService(
            UserRepository userRepository,
            RoleRepository roleRepository,
            ImageService imageService,
            PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.imageService = imageService;
        this.passwordEncoder = passwordEncoder;
    }

    public void createUserByClient(RegisterDTO userDTO) {
        User user = new User();
        user.setFullName(userDTO.getFirstName() + " " + userDTO.getLastName());
        user.setUsername(userDTO.getUsername());
        user.setEmail(userDTO.getEmail());
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        user.setRole(this.roleRepository.findByName("USER"));
        String imageName = "defaultavatar.jpg";
        user.setImage(imageName);

        this.userRepository.save(user);
    }

    public void createUserByAdmin(User user, MultipartFile file) {
        Role roleInDataBase = this.roleRepository.findByName(user.getRole().getName());
        user.setRole(roleInDataBase);
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        String imageName = "defaultavatar.jpg";
        if (file != null && !file.isEmpty()) {
            // Nếu người dùng có upload ảnh
            imageName = this.imageService.handelImage(file, "avatar");
        }
        user.setImage(imageName);
        this.userRepository.save(user);
    }

    public void updateUser(User user, MultipartFile file) {
        User currentUser = this.userRepository.findById(user.getId()).get();

        currentUser.setRole(this.roleRepository.findByName(user.getRole().getName()));

        if (user.getPhoneNumber() != null && !user.getPhoneNumber().isEmpty()) {
            currentUser.setPhoneNumber(user.getPhoneNumber());
        }
        if (user.getFullName() != null && !user.getFullName().isEmpty()) {
            currentUser.setFullName(user.getFullName());
        }
        if (user.getAddress() != null && !user.getAddress().isEmpty()) {
            currentUser.setAddress(user.getAddress());
        }
        if (user.getUsername() != null && !user.getUsername().isEmpty()) {
            currentUser.setUsername(user.getUsername());
        }
        // Kiểm tra xem người dùng có cập nhật ảnh không nếu có thì cập nhật
        String updateImage = this.imageService.handelImage(file, "avatar");
        if (updateImage != null && !updateImage.isEmpty()) {
            // Kiểm tra xem người dùng hiện tại có ảnh và KHÔNG phải ảnh mặc định thì mới
            // xóa
            if (currentUser.getImage() != null
                    && !currentUser.getImage().isEmpty()
                    && !currentUser.getImage().equals("defaultavatar.jpg")) {
                this.imageService.deleteImage(currentUser.getImage(), "avatar");
            }
            currentUser.setImage(updateImage);
        }
        this.userRepository.save(currentUser);
    }

    public List<User> getUserList() {
        return this.userRepository.findAll();
    }

    public void deleteUser(User user) {
        if (user.getImage() != null && !user.getImage().equals("defaultavatar.jpg")) {
            imageService.deleteImage(user.getImage(), "avatar");
        }
        this.userRepository.deleteById(user.getId());
    }

    public User getUserByID(int id) {
        return this.userRepository.findFirstById(id);
    }

    public User handelSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User getUserByUsername(String username) {
        return this.userRepository.findByUsername(username);
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public Page<User> fetchUsers(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }
}
