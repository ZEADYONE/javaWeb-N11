package com.n11.sportshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.n11.sportshop.domain.dto.RegisterDTO;

@Controller
public class HomepageController {

    @GetMapping("/")
    public String autoDirectHomePage() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String getHomePage(Model model) {
        return "client/homepage/show";
    }

    @GetMapping("/products")
    public String getAllProductPage() {
        return "client/product/show";
    }

    @GetMapping("/products/{id}")
    public String getDetailProductPage() {
        return "client/product/detail";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegistrationPage() {
        return "client/auth/register";
    }

}
