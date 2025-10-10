package com.n11.sportshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "Brand")
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private int id;

    //@Column( nullable = false, length = 100)
    private String name;

    
    
   
    public int getId() {
        return id;
    }

    public void setId(int brandId) {
        this.id= brandId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   
    
}
