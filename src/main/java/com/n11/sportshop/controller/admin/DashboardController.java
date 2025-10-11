package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/admin")
    public String getDashBoardPage() {
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/table")
    public String getMethodName() {
        return "admin/dashboard/tables";
    }

}
