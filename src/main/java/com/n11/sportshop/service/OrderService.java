package com.n11.sportshop.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Cart;
import com.n11.sportshop.domain.CartItem;
import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.OrderDetail;
import com.n11.sportshop.domain.OrderStatus;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.repository.CartItemRepository;
import com.n11.sportshop.repository.CartRepository;
import com.n11.sportshop.repository.OrderDetailRepository;
import com.n11.sportshop.repository.OrderRepository;

import jakarta.transaction.Transactional;

@Service
public class OrderService {
    private final CartRepository cartRepo;
    private final CartItemRepository cartItemRepo;
    private final OrderRepository orderRepo;
    private final OrderDetailRepository orderDetailRepo;
    public OrderService(CartRepository cartRepo, CartItemRepository cartItemRepo, OrderRepository orderRepo,
            OrderDetailRepository orderDetailRepo) {
        this.cartRepo = cartRepo;
        this.cartItemRepo = cartItemRepo;
        this.orderRepo = orderRepo;
        this.orderDetailRepo = orderDetailRepo;
    }
     @Transactional
    public Order checkout(User user) {
        Cart cart = cartRepo.findByUserAndStatus(user, "active")
                            .orElseThrow(() -> new RuntimeException("Không có giỏ hàng!"));

        Order order = new Order();
        order.setUser(user);
        order.setStatus(OrderStatus.paid);
        orderRepo.save(order);

        BigDecimal total = BigDecimal.ZERO;

        List<CartItem> items = cartItemRepo.findByCart(cart);
        for (CartItem item : items) {
            OrderDetail detail = new OrderDetail();
            detail.setOrder(order);
            detail.setProduct(item.getProduct());
            detail.setQuantity(item.getQuantity());
            detail.setPrice(item.getProduct().getPrice());
            total = total.add(item.getProduct().getPrice().multiply(BigDecimal.valueOf(item.getQuantity())));
            orderDetailRepo.save(detail);
        }

        order.setTotalAmount(total);
        orderRepo.save(order);

        cart.setStatus("checked_out");
        cartRepo.save(cart);

        return order;
    }

    public List<Order> getOrderHistory(User user) {
        return orderRepo.findByUser(user);
    }

    
}
