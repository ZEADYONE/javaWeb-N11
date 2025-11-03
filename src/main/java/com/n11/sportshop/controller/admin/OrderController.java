package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.OrderStatus;
import com.n11.sportshop.service.OrderService;

@Controller
@RequestMapping("/admin/order")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping()
    public String getOrderPage(Model model) {
        model.addAttribute("pendingCount", this.orderService.countByStatus(OrderStatus.pending));
        model.addAttribute("shippingCount", this.orderService.countByStatus(OrderStatus.shipped));
        model.addAttribute("acceptedCount", this.orderService.countByStatus(OrderStatus.accept));
        model.addAttribute("canceledCount", this.orderService.countByStatus(OrderStatus.canceled));
        return "redirect:/admin/order/pending";
    }

    @GetMapping("/pending")
    public String getOrderPending(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.pending));
        model.addAttribute("status", "Pending");
        model.addAttribute("pendingCount", this.orderService.countByStatus(OrderStatus.pending));
        model.addAttribute("shippingCount", this.orderService.countByStatus(OrderStatus.shipped));
        model.addAttribute("acceptedCount", this.orderService.countByStatus(OrderStatus.accept));
        model.addAttribute("canceledCount", this.orderService.countByStatus(OrderStatus.canceled));
        return "admin/order/show";
    }

    @GetMapping("/shipping")
    public String getOrderShipping(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.shipped));
        model.addAttribute("status", "Shipping");
        model.addAttribute("pendingCount", this.orderService.countByStatus(OrderStatus.pending));
        model.addAttribute("shippingCount", this.orderService.countByStatus(OrderStatus.shipped));
        model.addAttribute("acceptedCount", this.orderService.countByStatus(OrderStatus.accept));
        model.addAttribute("canceledCount", this.orderService.countByStatus(OrderStatus.canceled));
        return "admin/order/show";
    }

    @GetMapping("/accepted")
    public String getOrderAccept(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.accept));
        model.addAttribute("status", "Accepted");
        model.addAttribute("pendingCount", this.orderService.countByStatus(OrderStatus.pending));
        model.addAttribute("shippingCount", this.orderService.countByStatus(OrderStatus.shipped));
        model.addAttribute("acceptedCount", this.orderService.countByStatus(OrderStatus.accept));
        model.addAttribute("canceledCount", this.orderService.countByStatus(OrderStatus.canceled));
        return "admin/order/show";
    }

    @GetMapping("/canceled")
    public String getOrderCancel(Model model) {
        model.addAttribute("orders", orderService.getOrderByStatus(OrderStatus.canceled));
        model.addAttribute("status", "Canceled");
        model.addAttribute("pendingCount", this.orderService.countByStatus(OrderStatus.pending));
        model.addAttribute("shippingCount", this.orderService.countByStatus(OrderStatus.shipped));
        model.addAttribute("acceptedCount", this.orderService.countByStatus(OrderStatus.accept));
        model.addAttribute("canceledCount", this.orderService.countByStatus(OrderStatus.canceled));
        return "admin/order/show";
    }

    // Cập nhật trạng thái đơn hàng
    @PostMapping("/update/{id}")
    public String updateOrderStatus(
            @PathVariable("id") Integer id) {
        Order order = this.orderService.getOrderById(id);
        if (order.getStatus() == OrderStatus.pending) {
            this.orderService.updateOrderStatus(id, OrderStatus.shipped);
        }
        return "redirect:/admin/order";
    }

}