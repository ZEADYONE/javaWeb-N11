package com.n11.sportshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "Customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private int id;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true)//, nullable = false)
    private User user;

    @Column( columnDefinition = "INT DEFAULT 0")
    private int loyaltyPoints;

    
    

    
    public int getId() { return id; }
    public void setId(int customerId) { 
        this.id = customerId; 
    }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public int getLoyaltyPoints() { return loyaltyPoints; }
    public void setLoyaltyPoints(int loyaltyPoints) { this.loyaltyPoints = loyaltyPoints; }
}
