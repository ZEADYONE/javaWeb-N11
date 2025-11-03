package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.OrderStatus;
import com.n11.sportshop.service.OrderService;

@Controller
@RequestMapping("/admin/order")
public class OrderController {

    private final OrderService orderService;
    
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }
    //Hiển thị danh sách tất cả đơn hàng
    @GetMapping
    public String getOrderPage(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("statuses", OrderStatus.values()); 
        return "admin/order/show"; // trang hiển thị danh sách đơn hàng
    }

    // Cập nhật trạng thái đơn hàng 
    @PostMapping("/update-status")
    public String updateOrderStatus(
            @RequestParam("orderId") Integer orderId,
            @RequestParam("status") String status) {

        orderService.updateOrderStatus(orderId, OrderStatus.valueOf(status.toUpperCase()));
        return "redirect:/admin/order"; 
    }
}