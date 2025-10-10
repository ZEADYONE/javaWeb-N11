package com.n11.sportshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/user/create")
    public String getUserCreatePage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String postCreateUser(@ModelAttribute("newUser") User user) {
        this.userService.saveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user")
    public String getUserList(Model model) {
        List<User> users = this.userService.getUserList();
        model.addAttribute("users", users);
        model.addAttribute("newUser", new User());
        return "admin/user/show";
    }

    // Delete-User
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable int id) {
        User user = new User();
        user.setId(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postMethodName(Model model, @ModelAttribute("user") User user) {
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";
    }

    // Detail-User
    @GetMapping("/admin/user/detail/{id}")
    public String getUserDetailPage(Model model, @PathVariable int id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    // Upate-User
    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable int id) {
        User user = this.userService.getUserByID(id);
        model.addAttribute("newUser", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUserPage(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserByID(user.getId());

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
        if (user.getRole() != null) {
            currentUser.setRole(user.getRole());
        }

        this.userService.handelSaveUser(currentUser);
        return "redirect:/admin/user";
    }
}
