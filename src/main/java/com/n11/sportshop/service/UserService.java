package com.n11.sportshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveUser(User user) {
        this.userRepository.save(user);
    }

    public List<User> getUserList() {
        return this.userRepository.findAll();
    }

    public void deleteUser(int id) {
        this.userRepository.deleteById(id);
    }

    public User getUserByID(int id) {
        return this.userRepository.findFirstById(id);
    }

    public User handelSaveUser(User user) {
        return this.userRepository.save(user);
    }
}
