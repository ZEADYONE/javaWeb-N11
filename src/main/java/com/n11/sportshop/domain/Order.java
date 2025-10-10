package com.n11.sportshop.domain;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "Orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private int id;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer; // khóa ngoại -> Customer(customer_id)

    @Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime orderDate;

    @Enumerated(EnumType.STRING)
    
    private OrderStatus status = OrderStatus.pending;

    //@Column( precision = 12, scale = 2, nullable = false)
    private BigDecimal totalAmount;

    @ManyToOne
    @JoinColumn(name = "voucher_id")
    private Voucher voucher; // khóa ngoại -> Voucher(voucher_id)

    // 🔽 Quan hệ hai chiều với OrderDetail
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderDetail> orderDetails;
    
    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
    private Payment payment;

    
    // ====== Getters & Setters ======
    public int getId() { return id; }
    public void setId(int orderId) { this.id = orderId; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public LocalDateTime getOrderDate() { return orderDate; }
    public void setOrderDate(LocalDateTime orderDate) { this.orderDate = orderDate; }

    public OrderStatus getStatus() { return status; }
    public void setStatus(OrderStatus status) { this.status = status; }

    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }

    public Voucher getVoucher() { return voucher; }
    public void setVoucher(Voucher voucher) { this.voucher = voucher; }
    public List<OrderDetail> getOrderDetails() { return orderDetails; }
    public void setOrderDetails(List<OrderDetail> orderDetails) { this.orderDetails = orderDetails; }
     public Payment getPayment() { return payment; }
    public void setPayment(Payment payment) { this.payment = payment; }
}
