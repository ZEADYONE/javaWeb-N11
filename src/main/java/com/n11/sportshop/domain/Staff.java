package com.n11.sportshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "Staff")
public class Staff {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "staff_id")
    private int staffId;

    @OneToOne
    @JoinColumn(name = "user_id", unique = true, referencedColumnName = "user_id")
    private User user; // ánh xạ đến bảng Users

    @Column(name = "department", length = 100)
    private String department;

    // ===== Constructor =====
    public Staff() {
    }

    public Staff(User user, String department) {
        this.user = user;
        this.department = department;
    }

    // ===== Getter & Setter =====
    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
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

    // ===== toString =====
    @Override
    public String toString() {
        return "Staff{" +
                "staffId=" + staffId +
                ", user=" + (user != null ? user.getUsername() : "null") +
                ", department='" + department + '\'' +
                '}';
    }
}
