package com.n11.sportshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.n11.sportshop.domain.User;

@Controller
public class UserController {
    @GetMapping("/admin/user")
    public String getUserPage() {
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getUserCreatePage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }
}
