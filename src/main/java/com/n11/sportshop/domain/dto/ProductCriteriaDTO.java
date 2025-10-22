package com.n11.sportshop.domain.dto;

import java.util.List;
import java.util.Optional;

public class ProductCriteriaDTO {
    private Optional<String> page;
    private Optional<List<String>> brand;
    private Optional<List<String>> categories;
    private Optional<List<String>> price;
    private Optional<String> test;
    

   
    public Optional<List<String>> getBrand() {
        return brand;
    }
    public void setBrand(Optional<List<String>> brand) {
        this.brand = brand;
    }
    public Optional<List<String>> getCategories() {
        return categories;
    }
    public void setCategories(Optional<List<String>> categories) {
        this.categories = categories;
    }
    public Optional<List<String>> getPrice() {
        return price;
    }
    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<String> getTest() {
        return test;
    }

    public void setTest(Optional<String> test) {
        this.test = test;
    }

    
}
