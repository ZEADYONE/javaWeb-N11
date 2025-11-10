package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.service.UserService;



@Controller
@RequestMapping("/admin")
public class DashboardController {
    private final UserService userService;
    
    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String getDashBoardPage() {
        return "admin/dashboard/show";
    }

    @GetMapping("/table")
    public String getMethodName() {
        return "admin/dashboard/tables";
    }

    @GetMapping("/dashboard")
    public String adminDashboard(Model model) {
        long activeUserCount = userService.countActiveUsers();
        model.addAttribute("activeUserCount", activeUserCount);
        return "admin/dashboard"; 
    }
}
 