package com.n11.sportshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
@Transactional
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

    public List<Order> getOrderHistoryByStatus(User user, OrderStatus status) {
        return orderRepo.findByUserAndStatus(user, status);
    }

    public List<Order> getOrderByStatus(OrderStatus status) {
        return this.orderRepo.findByStatus(status);
    }

    public Order createOrder(Integer userId, String voucherCode, InformationDTO informationDTO) {
        User user = this.userRepository.findById(userId).get();
        List<CartDetail> items = this.cartService.getCartDetails(user);
        Order order = new Order();
        order.setUser(user);
        order.setName(informationDTO.getName());
        order.setEmail(informationDTO.getEmail());
        order.setAddress(informationDTO.getAddress());
        order.setNote(informationDTO.getNote());
        order.setPhone(informationDTO.getPhone());
        Payment payment = this.paymentRepository.findByPaymentMethod(informationDTO.getPayment());
        order.setPayment(payment);
        order.setStatus(OrderStatus.pending);
        Voucher voucher = this.voucherRepository.findByCode(voucherCode);
        order.setVoucher(voucher);
        order = this.orderRepo.save(order);
        Long price = 0L;
        Long shipPrice = 30000L;
        Long discountAmount = 0L;
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
        if (voucher.getCode().equals("FREESHIP")) {
            shipPrice = 0L;
        } else {
            discountAmount = price * voucher.getDiscountValue() / 100;
        }
        order.setTotalAmount(price);
        order.setShipPrice(shipPrice);
        order.setDiscountAmount(discountAmount);
        return order;
    }

    public List<OrderDetail> getOrderDetails (User user) {
        Order order = this.orderRepo.findTopByUserOrderByIdDesc(user);
        return this.orderDetailRepo.findByOrder(order);
    }
    //lay toan bo don hang
    public List<Order> getAllOrders() {
        return orderRepo.findAll();
    }

    //Cap nhat trang thai trong admin/order
    @Transactional
    public void updateOrderStatus(Integer orderId, OrderStatus status) {
        Order order = orderRepo.findById(orderId).get();
        order.setStatus(status);
        orderRepo.save(order);
    }

    public Order getOrderByUser(User user) {
        return this.orderRepo.findTopByUserOrderByIdDesc(user);
    }


    public Order getOrderById(int id) {
        return this.orderRepo.findById(id).get();
    }

    public Integer countByStatus(OrderStatus status) {
        return this.orderRepo.countByStatus(status);
    }
}
