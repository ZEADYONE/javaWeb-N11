package com.n11.sportshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.n11.sportshop.domain.Brand_;
import com.n11.sportshop.domain.Category_;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.Product_;



public class ProductSpecs {
    public static Specification<Product> filterName(String name) {
        return (root, query, builder)
        -> builder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> filterCategories(List<String> codeCate) {
        return (root, query, builder)
        -> builder.in(root.get(Product_.category).get(Category_.CODE)).value(codeCate);
    }

    public static Specification<Product> filterPrice(Integer minPrice, Integer maxPrice) {
        int finalMinPrice, finalMaxPrice;
        if (minPrice == null) {
            finalMinPrice = 0;
        } else finalMinPrice = minPrice;
        if (maxPrice == null) {
            finalMaxPrice = 0;
        } else finalMaxPrice = maxPrice;
        return (root, query, builder)
        -> builder.between(root.get(Product_.PRICE), finalMinPrice, finalMaxPrice);
    }

    public static Specification<Product> filterBrand(List<String> brandName) {
        return (root, query, builder)
        -> builder.in(root.get(Product_.BRAND).get(Brand_.NAME)).value(brandName);
    }
}
