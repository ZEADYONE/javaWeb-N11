package com.n11.sportshop.domain;


import jakarta.persistence.*;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
@Entity
@Table(name = "Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "role_id", nullable = false) // khóa ngoại trỏ tới Role
    private Role role;
    @Column(nullable = false, unique = true, length = 100)
    private String username;

    //@Column(nullable = false)
    private String password;

    @Column(length = 150)//,nullable = false)
    private String fullName;

    @Column(unique = true, length = 150)
    private String email;

    @Column( length = 20)
    private String phoneNumber;

    @Column(length = 255)
    private String address;

    

    // ===== Getters & Setters =====
    public int getId() { return id; }
    public void setId(int id) { this.id=id; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
}
