package com.n11.sportshop.controller.admin;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.n11.sportshop.domain.CartDetail;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.service.CartService;

@RestController
@RequestMapping("/api/cart")

public class CartController {
    private final CartService cartService;
    
    public CartController(CartService cartService) {
        this.cartService = cartService;
    }
    //them san pham vao gio hang
    @PostMapping("/add")
    public ResponseEntity<String> addToCart(@RequestParam int userId,
                                            @RequestParam int productId,
                                            @RequestParam int quantity) {
        User user = new User();
        user.setId(userId);
        cartService.addToCart(user, productId, quantity);
        return ResponseEntity.ok("Đã thêm vào giỏ hàng");
    }
    //lay ra san pham tu gio hang
    @GetMapping("/{customerId}")
    public ResponseEntity<List<CartDetail>> getCart(@PathVariable int customerId) {
        User user= new User();
        user.setId(customerId);
        return ResponseEntity.ok(cartService.getCartDetails(user));
    }
}
