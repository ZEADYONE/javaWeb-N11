package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Brand;
import com.n11.sportshop.domain.Category;
import com.n11.sportshop.domain.Voucher;
import com.n11.sportshop.service.BrandService;
import com.n11.sportshop.service.CategoryService;
import com.n11.sportshop.service.ProductService;

@Controller
@RequestMapping("/admin/catalog")
public class CatalogController {

    private final BrandService brandService;
    private final CategoryService categoryService;

    public CatalogController(BrandService brandService, CategoryService categoryService) {
        this.brandService = brandService;
        this.categoryService = categoryService;
    }

    // Phần cate và brand
    @GetMapping()
    public String getCateBrandList(Model model) {
        model.addAttribute("categories", this.categoryService.getAllCategories());
        model.addAttribute("brands", this.brandService.getAllBrands());
        model.addAttribute("category", new Category()); // cần cho form binding
        model.addAttribute("brand", new Brand()); // cần cho form binding
        return "admin/catalog/show";
    }

}
