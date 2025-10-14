package com.n11.sportshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Category;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.repository.CategoryRepository;
import com.n11.sportshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;

    public ProductService(ProductRepository productRepository, CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
    }

    // them moi san pham
    public void saveProduct(Product product) {
        productRepository.save(product);
    }

    // xem danh sach tat ca san pham
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // xem chi tiet 1 san pham theo id
    public Optional<Product> getProductById(int id) {
        return productRepository.findById(id);
    }

    // xoa san pham
    public void deleteById(int id) {
        productRepository.deleteById(id);
    }

    public List<Category> getAllCategories() {
        return this.categoryRepository.findAll();
    }
}
