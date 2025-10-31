package com.n11.sportshop.controller.client;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.CartService;
import com.n11.sportshop.service.UserService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class ClientCartController {

    private final CartService cartService;
    private final UserService userService;

    public ClientCartController(CartService cartService, UserService userService) {
        this.cartService = cartService;
        this.userService = userService;
    }

    @PostMapping("/update")
    public void updateCart(@RequestParam("id") int id,
            @RequestParam("quantity") int quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = userService.getUserByID((int) session.getAttribute("id"));
        cartService.updateCart(user, id, quantity);
    }

}
