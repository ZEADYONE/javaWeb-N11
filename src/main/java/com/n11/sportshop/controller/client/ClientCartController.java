package com.n11.sportshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.CartDetail;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.CartService;
import com.n11.sportshop.service.UserService;

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

    @GetMapping("")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        User user = this.userService.getUserByID(userId);
        List<CartDetail> cartDetails = this.cartService.getCartDetails(user);

        Long totalPrice = 0L;

        for (CartDetail cd : cartDetails) {
            Long price = cd.getProduct().getPrice();
            Long quantity = Long.valueOf(cd.getQuantity());

            totalPrice = totalPrice + (price * quantity);
        }

        model.addAttribute("items", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/show";
    }

    @PostMapping("/update")
    public void updateCart(@RequestParam("id") int id,
            @RequestParam("quantity") int quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = userService.getUserByID((int) session.getAttribute("id"));
        cartService.updateCart(user, id, quantity);
    }

    @PostMapping("/delete/{id}")
    public String deleteCartItem(@PathVariable("id") int id) {
        this.cartService.deleteItemInCart(id);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOut(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        User user = this.userService.getUserByID(userId);
        List<CartDetail> cartDetails = this.cartService.getCartDetails(user);

        Long totalPrice = 0L;

        for (CartDetail cd : cartDetails) {
            Long price = cd.getProduct().getPrice();
            Long quantity = Long.valueOf(cd.getQuantity());

            totalPrice = totalPrice + (price * quantity);
        }

        model.addAttribute("items", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/checkout";
    }

    @GetMapping("/confirmation")
    public String getComfirmation(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        User user = this.userService.getUserByID(userId);
        List<CartDetail> cartDetails = this.cartService.getCartDetails(user);

        Long totalPrice = 0L;

        for (CartDetail cd : cartDetails) {
            Long price = cd.getProduct().getPrice();
            Long quantity = Long.valueOf(cd.getQuantity());

            totalPrice = totalPrice + (price * quantity);
        }

        model.addAttribute("items", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/confirmation";
    }

}
