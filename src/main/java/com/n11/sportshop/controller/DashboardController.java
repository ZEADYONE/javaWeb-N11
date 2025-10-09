package com.n11.sportshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DashboardController {

    @GetMapping("/")
    public String autoDirectHomePage() {
        return "redirect:/home";
    }
    
    @GetMapping("/home")
    public String getHomePage(Model model) {
        return "client/homepage/show";
    }

    @GetMapping("/admin")
    public String getDashBoardPage() {
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/table")
    public String getMethodName() {
        return "admin/dashboard/tables";
    }

    

    

    
}
