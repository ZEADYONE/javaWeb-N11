package com.n11.sportshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Cart;
import com.n11.sportshop.domain.CartDetail;
import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.OrderDetail;
import com.n11.sportshop.domain.OrderStatus;
import com.n11.sportshop.domain.Payment;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.Voucher;
import com.n11.sportshop.domain.dto.InformationDTO;
import com.n11.sportshop.repository.CartDetailRepository;
import com.n11.sportshop.repository.CartRepository;
import com.n11.sportshop.repository.OrderDetailRepository;
import com.n11.sportshop.repository.OrderRepository;
import com.n11.sportshop.repository.PaymentRepository;
import com.n11.sportshop.repository.ProductRepository;
import com.n11.sportshop.repository.UserRepository;
import com.n11.sportshop.repository.VoucherRepository;

import jakarta.transaction.Transactional;

@Service
public class OrderService {

    private final CartRepository cartRepo;
    private final CartDetailRepository cartDetailRepo;
    private final OrderRepository orderRepo;
    private final OrderDetailRepository orderDetailRepo;
    private final UserRepository userRepository;
    private final CartService cartService;
    private final PaymentRepository paymentRepository;
    private final ProductRepository productRepository;
    private final VoucherRepository voucherRepository;

    public OrderService(CartDetailRepository cartDetailRepo, CartRepository cartRepo, CartService cartService, OrderDetailRepository orderDetailRepo, OrderRepository orderRepo, PaymentRepository paymentRepository, ProductRepository productRepository, UserRepository userRepository, VoucherRepository voucherRepository) {
        this.cartDetailRepo = cartDetailRepo;
        this.cartRepo = cartRepo;
        this.cartService = cartService;
        this.orderDetailRepo = orderDetailRepo;
        this.orderRepo = orderRepo;
        this.paymentRepository = paymentRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
        this.voucherRepository = voucherRepository;
    }

    @Transactional
    public Order checkout(User user) {
        Cart cart = cartRepo.findByUserAndStatus(user, "active")
                .orElseThrow(() -> new RuntimeException("Không có giỏ hàng!"));

        Order order = new Order();
        order.setUser(user);
        order.setStatus(OrderStatus.paid);
        orderRepo.save(order);

        Long total = 0L;

        List<CartDetail> items = cartDetailRepo.findByCart(cart);
        for (CartDetail item : items) {
            OrderDetail detail = new OrderDetail();
            detail.setOrder(order);
            detail.setProduct(item.getProduct());
            detail.setQuantity(item.getQuantity());
            detail.setPrice(item.getProduct().getPrice());
            total = total + (item.getProduct().getPrice() * item.getQuantity());
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

    public Order createOrder(Integer userId, Integer voucherId, InformationDTO informationDTO) {
        User user = this.userRepository.findById(userId).get();
        List<CartDetail> items = this.cartService.getCartDetails(user);
        Order order = new Order();
        order.setName(informationDTO.getName());
        order.setEmail(informationDTO.getEmail());
        order.setAddress(informationDTO.getAddress());
        order.setNote(informationDTO.getNote());
        order.setPhone(informationDTO.getPhone());
        Payment payment = this.paymentRepository.findByPaymentMethod(informationDTO.getPayment());
        order.setPayment(payment);
        order.setStatus(OrderStatus.pending);
        Voucher voucher = this.voucherRepository.findById(voucherId).get();
        order = this.orderRepo.save(order);
        Long price = 0L + 30000;
        for (var item : items) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setPrice(item.getProduct().getPrice());
            orderDetail.setQuantity(item.getQuantity());
            Product product = this.productRepository.findById(item.getProduct().getId()).get();
            product.setStockQuantity(product.getStockQuantity() - item.getQuantity());
            this.productRepository.save(product);
            orderDetail.setProduct(item.getProduct());
            orderDetail.setOrder(order);
            this.orderDetailRepo.save(orderDetail);
            price += item.getQuantity() * orderDetail.getPrice();
        }
        order.setTotalAmount(price);
        return order;
    }
}
