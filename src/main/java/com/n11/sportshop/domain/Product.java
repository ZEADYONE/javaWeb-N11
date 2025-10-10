package com.n11.sportshop.domain;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "Product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private int id;

    //@Column( nullable = false, length = 200)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    //@Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal price;

    //@Column(nullable = false)
    private int stockQuantity = 0;

    // Quan hệ nhiều sản phẩm thuộc một category
    @ManyToOne
    @JoinColumn( referencedColumnName = "category_id")
    private Category category;

    // Quan hệ nhiều sản phẩm thuộc một brand
    @ManyToOne
    @JoinColumn(name = "brand_id", referencedColumnName = "brand_id")
    private Brand brand;

    @Column( updatable = false)
    private LocalDateTime createdAt;

    
    private LocalDateTime updatedAt;
     // 🔹 Thêm thuộc tính ảnh
    @Column(length = 500)
    private String imageUrl;  

    // 🔽 Quan hệ hai chiều với OrderDetail
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderDetail> orderDetails;
    
    

    //Getters and setters
    public int getId() { return id; }
    public void setId(int productId) { this.id = productId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }

    public Brand getBrand() { return brand; }
    public void setBrand(Brand brand) { this.brand = brand; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public List<OrderDetail> getOrderDetails() { return orderDetails; }
    public void setOrderDetails(List<OrderDetail> orderDetails) { this.orderDetails = orderDetails; }
    
}
