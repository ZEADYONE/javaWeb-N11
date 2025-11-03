package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Brand;
import com.n11.sportshop.domain.Category;
import com.n11.sportshop.service.ProductService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/admin/catalog")
public class CatalogController {

    private final ProductService productService;

    public CatalogController(ProductService productService) {
        this.productService = productService;
    }

    // Phần cate và brand
    @GetMapping()
    public String getCateBrandList(Model model) {
        model.addAttribute("categories", this.productService.getAllCategories());
        model.addAttribute("brands", this.productService.getAllBrands());
        model.addAttribute("category", new Category()); // cần cho form binding
        model.addAttribute("brand", new Brand());       // cần cho form binding
        return "admin/catalog/show";
    }
    //Thêm phần category
    @PostMapping("/category/create")
        public String createCategory(@ModelAttribute("category") Category category) {
        productService.saveCategory(category);
        return "redirect:/admin/catalog";
    }

    @PostMapping("/brand/create")
    public String createBrand(@ModelAttribute("brand") Brand brand) {
        productService.saveBrand(brand);
        return "redirect:/admin/catalog";
    }
    
}
