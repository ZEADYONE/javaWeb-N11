package com.n11.sportshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.dto.InformationDTO;
import com.n11.sportshop.service.CartService;
import com.n11.sportshop.service.OrderService;
import com.n11.sportshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;

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

    @GetMapping("")
    public String getUserOrderPage(Model model, HttpServletRequest request) {
        return "/client/order/show";
    }

    @PostMapping("/create")
    public String createOrder(
            @ModelAttribute InformationDTO informationDTO,
            HttpServletRequest http) {
        HttpSession session = http.getSession(false);
        Integer userId = (Integer) session.getAttribute("id");
        String voucherCode = "NONE";
        if (informationDTO.getVoucherCode() != null) {
            voucherCode = informationDTO.getVoucherCode();
        }
        Order order = this.orderService.createOrder(userId, voucherCode, informationDTO);
        return "redirect:/cart/confirmation";
    }
}
