package com.n11.sportshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.n11.sportshop.domain.User;

@Controller
public class DashboardController {
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

    @GetMapping("/admin/user")
    public String getUserPage() {
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getUserCreatePage(Model model) {
        model.addAttribute("useNayDeNhap", new User());
        return "admin/user/create";
    }

    @GetMapping("/admin/product")
    public String getProductPage() {
        return "admin/product/show";
    }

    @GetMapping("/admin/order")
    public String getOrderPage() {
        return "admin/order/show";
    }
}
