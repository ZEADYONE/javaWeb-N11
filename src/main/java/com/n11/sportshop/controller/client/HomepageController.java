package com.n11.sportshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/allproduct")
    public String getAllProductPage() {
        return "client/product/show";
    }

    @GetMapping("/productdetail")
    public String getDetailProductPage() {
        return "client/product/detail";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }
}
