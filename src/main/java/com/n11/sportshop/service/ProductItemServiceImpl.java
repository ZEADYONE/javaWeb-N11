package com.n11.sportshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.ProductItem;
import com.n11.sportshop.repository.ProductItemRepository;

@Service
public class ProductItemServiceImpl implements ProductItemService {

    private final ProductItemRepository productItemRepository;

    public ProductItemServiceImpl(ProductItemRepository productItemRepository) {
        this.productItemRepository = productItemRepository;
    }

    @Override
    public List<ProductItem> findByProductId(Integer productId) {
        return productItemRepository.findByProductId(productId);
    }

    @Override
    public Optional<ProductItem> findById(Integer id) {
        return productItemRepository.findById(id);
    }

    @Override
    public ProductItem save(ProductItem productItem) {
        return productItemRepository.save(productItem);
    }

    @Override
    public void deleteById(Integer id) {
        productItemRepository.deleteById(id);
    }

    @Override
    public boolean existsBySerialCode(String serialCode) {
        return productItemRepository.existsBySerialCode(serialCode);
    }
}
