package com.n11.sportshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Cart;
import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.OrderDetail;
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
    public String getUserOrderPage(Model model, HttpServletRequest request) {
        return "client/order/show";
    }

    @PostMapping("/create")
    public String createOrder(
            @ModelAttribute InformationDTO informationDTO,
            HttpServletRequest http) {
        HttpSession session = http.getSession(false);
        Integer userId = (Integer) session.getAttribute("id");
        if (informationDTO.getVoucherCode().isEmpty()) {
            informationDTO.setVoucherCode("NONE");
        }
        Order order = this.orderService.createOrder(userId, informationDTO.getVoucherCode(), informationDTO);
        return "redirect:/order/confirmation";
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
        model.addAttribute("items", orderDetails);
        model.addAttribute("shipping", order.getShipPrice());
        model.addAttribute("subTotal", order.getTotalAmount());
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("discountAmount", order.getDiscountAmount());
        return "client/order/confirmation";
    }
}
