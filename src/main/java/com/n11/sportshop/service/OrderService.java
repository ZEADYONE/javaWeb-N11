package com.n11.sportshop.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Cart;
import com.n11.sportshop.domain.CartDetail;
import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.OrderDetail;
import com.n11.sportshop.domain.OrderStatus;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.dto.InformationDTO;
import com.n11.sportshop.repository.CartDetailRepository;
import com.n11.sportshop.repository.CartRepository;
import com.n11.sportshop.repository.OrderDetailRepository;
import com.n11.sportshop.repository.OrderRepository;
import com.n11.sportshop.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class OrderService {
    private final CartRepository cartRepo;
    private final CartDetailRepository cartDetailRepo;
    private final OrderRepository orderRepo;
    private final OrderDetailRepository orderDetailRepo;
    private final UserRepository userRepository;
    private final CartService cartService;

    public OrderService(CartDetailRepository cartDetailRepo, CartRepository cartRepo, CartService cartService, OrderDetailRepository orderDetailRepo, OrderRepository orderRepo, UserRepository userRepository) {
        this.cartDetailRepo = cartDetailRepo;
        this.cartRepo = cartRepo;
        this.cartService = cartService;
        this.orderDetailRepo = orderDetailRepo;
        this.orderRepo = orderRepo;
        this.userRepository = userRepository;
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

        List<CartDetail> items = cartDetailRepo.findByCart(cart);
        for (CartDetail item : items) {
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

    public Order createOrder(Integer userId, Integer vouncherId, InformationDTO informationDTO) {
        User user = this.userRepository.findById(userId).get();
        List<CartDetail> items = this.cartService.getCartDetails(user);
        Order order = new Order();
        order.setName(informationDTO.getName());
        order.setEmail(informationDTO.getEmail());
        order.setAddress(informationDTO.getAddress());
        order.setNote(informationDTO.getNote());
        order.setPhone(informationDTO.getPhone());
        order.setPayment(informationDTO.getPa);
        for (var item : items) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setPrice(item.getProduct().getPrice());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setProduct(item.getProduct());
        }
    }

}
