package com.n11.sportshop.domain;

import jakarta.persistence.*;
import java.io.Serializable;


@Embeddable
public class OrderDetailId implements Serializable {

    
    private int orderId;

    
    private int productId;

   

    // ===== Getters & Setters =====
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    
    
}
