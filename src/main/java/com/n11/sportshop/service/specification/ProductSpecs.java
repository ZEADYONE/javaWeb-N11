package com.n11.sportshop.service.specification;

import org.springframework.data.jpa.domain.Specification;

import com.n11.sportshop.domain.Category_;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.Product_;



public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, builder)
        -> builder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> filterCategories(String code) {
        return (root, query, builder)
        -> builder.equal(root.get(Product_.category).get(Category_.CODE), code);
    }
}
