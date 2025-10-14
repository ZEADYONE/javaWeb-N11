package com.n11.sportshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.dto.RegisterDTO;
import com.n11.sportshop.service.ImageService;
import com.n11.sportshop.service.UserService;

@Controller
public class HomepageController {

    private final PasswordEncoder passwordEncoder;
    private final UserService userService;
    private final ImageService imageService;

    @GetMapping("/")
    public String autoDirectHomePage() {
        return "redirect:/home";
    }

    public HomepageController(PasswordEncoder passwordEncoder, UserService userService, ImageService imageService) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
        this.imageService = imageService;
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
        model.addAttribute("registerUser", new User());
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegistrationPage(Model model) {
        model.addAttribute("newUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String postCreateAccount(@ModelAttribute("newUser") RegisterDTO newUser) {
        this.userService.createUserByClient(newUser);
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }
}
