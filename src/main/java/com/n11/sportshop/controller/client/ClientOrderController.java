package com.n11.sportshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Cart;
import com.n11.sportshop.domain.CartDetail;
import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.dto.InformationDTO;
import com.n11.sportshop.service.CartService;
import com.n11.sportshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class ClientOrderController {

    private final CartService cartService;
    private final UserService userService;
    public ClientOrderController(CartService cartService, UserService userService) {
        this.cartService = cartService;
        this.userService = userService;
    }

    @PostMapping("/create")
    public String createOrder(
            @RequestBody InformationDTO informationDTO,
            HttpServletRequest http) {
        HttpSession session = http.getSession(false);
        Integer userId = (Integer) session.getAttribute("id");
        User user = this.userService.getUserByID(userId);
        Cart cart = this.cartService.getActiveCart(user);
        List<CartDetail> items = this.cartService.getCartDetails(user);

        Order order = new Order();
        return "redirect:/cart/confirm";
    }
}
