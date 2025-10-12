package com.n11.sportshop.service;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Category;
import com.n11.sportshop.repository.CategoryRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public Category getCategoryByName(String name) {
        return this.categoryRepository.findByName(name);
    }
}
