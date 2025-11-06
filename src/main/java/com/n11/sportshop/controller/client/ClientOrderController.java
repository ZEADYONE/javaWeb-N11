package com.n11.sportshop.controller.client;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.Cart;
import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.OrderDetail;
import com.n11.sportshop.domain.OrderStatus;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.dto.InformationDTO;
import com.n11.sportshop.service.CartService;
import com.n11.sportshop.service.OrderService;
import com.n11.sportshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class ClientOrderController {

    private final CartService cartService;
    private final UserService userService;
    private final OrderService orderService;

    public ClientOrderController(CartService cartService, OrderService orderService, UserService userService) {
        this.cartService = cartService;
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping
    public String getUserOrderPendingPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Integer id = (Integer)session.getAttribute("id");
        User user = this.userService.getUserByID(id);
        List<Order> orders = this.orderService.getOrderHistoryByStatus(user, OrderStatus.pending);
        Collections.reverse(orders);
        model.addAttribute("status", "pending");
        model.addAttribute("orders", orders);
        return "client/order/show";
    }

    @GetMapping("/shipping")
    public String getUserOrderShippingPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Integer id = (Integer)session.getAttribute("id");
        User user = this.userService.getUserByID(id);
        List<Order> orders = this.orderService.getOrderHistoryByStatus(user, OrderStatus.shipped);
        Collections.reverse(orders);
        model.addAttribute("status", "shipping");
        model.addAttribute("orders", orders);
        return "client/order/show";
    }

    @GetMapping("/accept")
    public String getUserOrderAcceptPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Integer id = (Integer)session.getAttribute("id");
        User user = this.userService.getUserByID(id);
        List<Order> orders = this.orderService.getOrderHistoryByStatus(user, OrderStatus.accept);
        Collections.reverse(orders);
        model.addAttribute("status", "accepted");
        model.addAttribute("orders", orders);
        return "client/order/show";
    }

    @GetMapping("/cancel")
    public String getUserOrderCancelPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Integer id = (Integer)session.getAttribute("id");
        User user = this.userService.getUserByID(id);
        List<Order> orders = this.orderService.getOrderHistoryByStatus(user, OrderStatus.canceled);
        Collections.reverse(orders);
        model.addAttribute("status", "canceled");
        model.addAttribute("orders", orders);
        return "client/order/show";
    }

    @PostMapping("/create")
    public String createOrder(
            @ModelAttribute InformationDTO informationDTO,
            HttpServletRequest http,
            @RequestParam("checkoutToken") String token) {
        HttpSession session = http.getSession(false);
        String sessionToken = (String) session.getAttribute("checkoutToken");
        if (sessionToken == null || !sessionToken.equals(token)) {
            return "redirect:/cart?error=invalid_or_used_token";
        }
        session.removeAttribute("checkoutToken");
        
        Integer userId = (Integer) session.getAttribute("id");
        if (informationDTO.getVoucherCode() == null || informationDTO.getVoucherCode().isEmpty() || informationDTO.getVoucherCode().isBlank()) {
            informationDTO.setVoucherCode("NONE");
        }
        Boolean status = this.orderService.createOrder(userId, informationDTO.getVoucherCode(), informationDTO);
        if (status == true) {
            return "redirect:/order/confirmation";
        } else {
            return "redirect:/cart";
        }
    }

    @GetMapping("/confirmation")
    public String getConfirmation(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        User user = this.userService.getUserByID(userId);
        Cart cart = this.cartService.getActiveCart(user);
        this.cartService.deleteCart(user, cart);
        List<OrderDetail> orderDetails = this.orderService.getOrderDetails(user);
        Order order = this.orderService.getOrderByUser(user);
        Long totalPrice = order.getShipPrice() + order.getTotalAmount() - order.getDiscountAmount();
        if (totalPrice < 0) totalPrice = 0L;
        model.addAttribute("items", orderDetails);
        model.addAttribute("shipping", order.getShipPrice());
        model.addAttribute("subTotal", order.getTotalAmount());
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("discountAmount", order.getDiscountAmount());
        return "client/order/confirmation";
    }

    @PostMapping("/cancel/{id}")
    public String cancelOrderStatus(@PathVariable("id") Integer id) {
        this.orderService.updateOrderStatus(id, OrderStatus.canceled);
        return "redirect:/order/cancel";
    }

    @PostMapping("/accept/{id}")
    public String acceptOrderStatus(@PathVariable("id") Integer id) {
        this.orderService.updateOrderStatus(id, OrderStatus.accept);
        return "redirect:/order/accept";
    }
}
