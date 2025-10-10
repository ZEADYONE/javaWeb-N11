package com.n11.sportshop.domain;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "OrderDetail")
public class OrderDetail {

    @EmbeddedId
    private OrderDetailId id; // khóa chính kết hợp (order_id + product_id)

    @ManyToOne
    @MapsId("orderId") // ánh xạ khóa ngoại vào phần order_id trong khóa chính
    @JoinColumn(name = "order_id")//, nullable = false)
    private Order order;

    @ManyToOne
    @MapsId("productId") // ánh xạ khóa ngoại vào phần product_id trong khóa chính
    @JoinColumn(name = "product_id")//, nullable = false)
    private Product product;

    @Column( nullable = false)
    private int quantity;

    @Column(precision = 12, scale = 2)//, nullable = false)
    private BigDecimal price;

    
    // ===== Getters & Setters =====
    public OrderDetailId getId() { return id; }
    public void setId(OrderDetailId id) { this.id = id; }

    public Order getOrder() { return order; }
    public void setOrder(Order order) { this.order = order; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
}
