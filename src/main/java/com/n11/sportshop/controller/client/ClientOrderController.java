package com.n11.sportshop.controller.client;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.n11.sportshop.domain.CartDetail;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.CartService;
import com.n11.sportshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientOrderController {

    private final CartService cartService;
    private final UserService userService;

    public ClientOrderController(CartService cartService, UserService userService) {
        this.cartService = cartService;
        this.userService = userService;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        User user = this.userService.getUserByID(userId);
        List<CartDetail> cartDetails = this.cartService.getCartDetails(user);

        BigDecimal totalPrice = BigDecimal.ZERO;

        for (CartDetail cd : cartDetails) {
            BigDecimal price = cd.getProduct().getPrice();
            BigDecimal quantity = BigDecimal.valueOf(cd.getQuantity());

            totalPrice = totalPrice.add(price.multiply(quantity));
        }

        model.addAttribute("items", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/show";
    }

    @GetMapping("/checkout")
    public String getll(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        User user = this.userService.getUserByID(userId);
        List<CartDetail> cartDetails = this.cartService.getCartDetails(user);

        BigDecimal totalPrice = BigDecimal.ZERO;

        for (CartDetail cd : cartDetails) {
            BigDecimal price = cd.getProduct().getPrice();
            BigDecimal quantity = BigDecimal.valueOf(cd.getQuantity());

            totalPrice = totalPrice.add(price.multiply(quantity));
        }

        model.addAttribute("items", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/checkout";
    }

}
