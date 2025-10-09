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


    public void saveUser (User user) {
        this.userRepository.save(user);
    }

    public List<User> getUserList() {
        return this.userRepository.findAll(); 
    }
}
