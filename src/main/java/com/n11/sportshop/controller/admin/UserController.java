package com.n11.sportshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.n11.sportshop.domain.Role;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.ImageService;
import com.n11.sportshop.service.RoleService;
import com.n11.sportshop.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {
    private final UserService userService;
    private final RoleService roleService;
    private final ImageService imageService;
    private final PasswordEncoder passwordEncoder;


    

    public UserController(UserService userService, RoleService roleService, ImageService imageService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.imageService = imageService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/create")
    public String getUserCreatePage(Model model) {
        model.addAttribute("role", new Role());
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/create")
    public String postCreateUser(@ModelAttribute("newUser") User user, @RequestParam("images") MultipartFile file) {
        // @RequestParam("images") MultipartFile file dùng để lấy file từ client đây về

        // User có Role {id : null, name = "..."} -> về RoleRepo để tìm id và lưu lại.
        // Không được để id trống !!!
        // Nhớ thêm ADMIN, USER và database
        Role roleInDataBase = this.roleService.getRoleByName(user.getRole().getName());
        user.setRole(roleInDataBase);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        
        String imageName;
        if (file != null && !file.isEmpty()) {
            // Nếu người dùng có upload ảnh
            imageName = this.imageService.handelImage(file, "avatar");
        } else {
            // Nếu không upload, dùng ảnh mặc định
            imageName = "defaultavatar.jpg";
        }
        user.setImage(imageName);

        this.userService.saveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping
    public String getUserList(Model model) {
        List<User> users = this.userService.getUserList();
        model.addAttribute("users", users);
        model.addAttribute("newUser", new User());
        return "admin/user/show";
    }

    // Delete-User
    @GetMapping("/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable int id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    @PostMapping("/delete")
    public String postMethodName(Model model, @ModelAttribute("user") User user) {
        // Chỉ xóa ảnh nếu KHÔNG phải ảnh mặc định
        if (user.getImage() != null && !user.getImage().equals("defaultavatar.jpg")) {
            imageService.deleteImage(user.getImage(), "avatar");
        }
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";
    }

    // Detail-User
    @GetMapping("/detail/{id}")
    public String getUserDetailPage(Model model, @PathVariable("id") int id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    // Upate-User
    @GetMapping("/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable("id") int id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("newUser", user);
        return "admin/user/update";
    }

    @PostMapping("/update")
    public String updateUserPage(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("images") MultipartFile file) {
        // @RequestParam("images") MultipartFile file dùng để lấy file từ client đây về

        User currentUser = this.userService.getUserByID(user.getId());

        currentUser.setRole(this.roleService.getRoleByName(user.getRole().getName()));

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
        this.userService.handelSaveUser(currentUser);
        return "redirect:/admin/user";

    }
}
