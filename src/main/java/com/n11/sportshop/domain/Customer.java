package com.n11.sportshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "Customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id")
    private int customerId;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true, nullable = false)
    private User user;

    @Column(name = "loyalty_points", columnDefinition = "INT DEFAULT 0")
    private int loyaltyPoints;

    
    public Customer() {}

    public Customer(User user, int loyaltyPoints) {
        this.user = user;
        this.loyaltyPoints = loyaltyPoints;
    }

    
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { 
        this.customerId = customerId; 
    }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public int getLoyaltyPoints() { return loyaltyPoints; }
    public void setLoyaltyPoints(int loyaltyPoints) { this.loyaltyPoints = loyaltyPoints; }
}
