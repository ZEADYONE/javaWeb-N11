package com.n11.sportshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Cart;
import com.n11.sportshop.domain.CartItem;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.repository.CartItemRepository;
import com.n11.sportshop.repository.CartRepository;
import com.n11.sportshop.repository.ProductRepository;
@Service
public class CartService {
    private final CartRepository cartRepo;
    private final CartItemRepository cartItemRepo;
    private final ProductRepository productRepo;
    

    public CartService(CartRepository cartRepo, CartItemRepository cartItemRepo, ProductRepository productRepo) {
        this.cartRepo = cartRepo;
        this.cartItemRepo = cartItemRepo;
        this.productRepo = productRepo;
    }


    public Cart getActiveCart(User user) {
        return cartRepo.findByUserAndStatus(user, "active")
                        .orElseGet(() -> {
                            Cart cart=new Cart();
                            cart.setUser(user);
                            cart.setStatus("active");
                            return cartRepo.save(cart);
                        });
    }
    public void addToCart(User user, int productId, int quantity) {
        Cart cart = getActiveCart(user);
        Product product = productRepo.findById(productId).orElseThrow();
        CartItem item = new CartItem();
        item.setCart(cart);
        item.setProduct(product);
        item.setQuantity(quantity);
        cartItemRepo.save(item);
    }
    public List<CartItem> getCartItems(User user) {
        return cartItemRepo.findByCart(getActiveCart(user));
    }
}
