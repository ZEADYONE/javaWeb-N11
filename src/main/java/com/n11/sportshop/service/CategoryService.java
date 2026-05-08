package com.n11.sportshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Category;
import com.n11.sportshop.repository.CategoryRepository;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return this.categoryRepository.findAll();
    }

    public void saveCategory(Category category) {
        categoryRepository.save(category);
    }

    public List<Category> getActiveCategory(int status) {
        return this.categoryRepository.findByStatus(status);
    }

    public void actionCategory(Integer id) {
        Category category = this.categoryRepository.findById(id).get();
        if (category.getStatus() == 1) {
            category.setStatus(0);
        } else {
            category.setStatus(1);
        }
        this.categoryRepository.save(category);
    }

    public void updateCategory(Integer id, Category updatedCategory) {
        Category category = categoryRepository.findById(id).orElse(null);
        if (category != null) {
            category.setName(updatedCategory.getName());
            category.setCode(updatedCategory.getCode());
            categoryRepository.save(category);
        }
    }
}
