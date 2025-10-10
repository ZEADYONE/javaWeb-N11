package com.n11.sportshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "Staff")
public class Staff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   
    private int id;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true, referencedColumnName = "user_id")
    private User user; // ánh xạ đến bảng Users

    @Column(length = 100)
    private String department;

    

    // ===== Getter & Setter =====
    public int getId() {
        return id;
    }

    public void setId(int staffId) {
        this.id= staffId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

}
