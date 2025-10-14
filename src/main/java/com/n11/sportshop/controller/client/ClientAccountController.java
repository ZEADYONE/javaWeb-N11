package com.n11.sportshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.n11.sportshop.service.UserService;

@Controller
public class ClientAccountController {
    private final UserService userService;

    public ClientAccountController(UserService userService) {
        this.userService = userService;
    }
    
     @GetMapping("/account")
    public String getAccountPage() {
        return new String();
    }
}
