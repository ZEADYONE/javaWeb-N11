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
    @GetMapping
    public String getOrderPage(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.pending));
        return "admin/order/show";
    }
    @GetMapping("/shipping")
    public String getOrderShipping(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.shipped));
        return "admin/order/show";
    }
    @GetMapping("/accpet")
    public String getOrderAccept(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.accept));
        return "admin/order/show";
    }
    @GetMapping("/cancel")
    public String getOrderCancel(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.canceled));
        return "admin/order/show";
    }
    

    // Cập nhật trạng thái đơn hàng 
    @PostMapping("/update-status")
    public String updateOrderStatus(
            @RequestParam("orderId") Integer orderId,
            @RequestParam("status") String status) {

        orderService.updateOrderStatus(orderId, OrderStatus.valueOf(status));
        return "redirect:/admin/order"; 
    }
}