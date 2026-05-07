package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Category;
import com.n11.sportshop.service.CategoryService;

@Controller
@RequestMapping("/admin/catalog")
public class CategoryController {

    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @PostMapping("/category/create")
    public String createCategory(@ModelAttribute("category") Category category) {
        categoryService.saveCategory(category);
        return "redirect:/admin/catalog";
    }

    @PostMapping("/category/toggle/{id}")
    public String toggleCategory(@PathVariable("id") Integer id) {
        this.categoryService.actionCategory(id);
        return "redirect:/admin/catalog";
    }

    @PostMapping("/category/update/{id}")
    public String updateCategory(@PathVariable Integer id, @ModelAttribute Category category) {
        categoryService.updateCategory(id, category);
        return "redirect:/admin/catalog";
    }
}
