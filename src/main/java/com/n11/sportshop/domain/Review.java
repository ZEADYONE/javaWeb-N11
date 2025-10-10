package com.n11.sportshop.domain;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "product_id")//, nullable = false)
    private Product product; // mỗi review thuộc 1 sản phẩm

    @ManyToOne
    @JoinColumn(name = "customer_id")//, nullable = false)
    private Customer customer; // người viết review

    //@Column(nullable = false)
    private int rating; // điểm đánh giá (1-5)

    @Column(columnDefinition = "TEXT")
    private String comment; // nội dung bình luận

    @Column( columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime createdAt = LocalDateTime.now();

    

    // ===== Getters & Setters =====
    public int getId() { return id; }
    public void setId(int reviewId) { this.id = reviewId; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
