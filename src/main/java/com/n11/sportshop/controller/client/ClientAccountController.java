package com.n11.sportshop.controller.client;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.UserService;

@Controller
public class ClientAccountController {

    private final UserService userService;

    public ClientAccountController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String viewProfile(Authentication authentication, Model model) {
        String username = authentication.getName();
        User user = this.userService.getUserByUsername(username);
        model.addAttribute("user", user);
        return "client/user/show";
    }
}
