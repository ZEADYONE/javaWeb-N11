package com.n11.sportshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.UserService;


@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/user")
    public String getUserPage() {
        return "admin/user/show";
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

    @GetMapping("/admin/user/show")
    public String getUserList(Model model) {
        List<User> users = this.userService.getUserList();
        model.addAttribute("users", users);
        return "admin/user/show";
    }
    

}
