package com.n11.sportshop.service;

import java.util.List;
import java.util.Optional;

import com.n11.sportshop.domain.ProductItem;

public interface ProductItemService {
    List<ProductItem> findByProductId(Integer productId);
    Optional<ProductItem> findById(Integer id);
    ProductItem save(ProductItem productItem);
    void deleteById(Integer id);
    boolean existsBySerialCode(String serialCode);
}
