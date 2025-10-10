package com.n11.sportshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "Category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private int id;

    @Column(  length = 100)//,nullable = false)
    private String name;

    
   

   
    public int getId() {
        return id;
    }

    public void setId(int categoryId) {
        this.id = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   
   
}
