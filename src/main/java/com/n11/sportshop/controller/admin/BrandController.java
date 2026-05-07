package com.n11.sportshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Brand;
import com.n11.sportshop.service.BrandService;

@Controller
@RequestMapping("/admin/catalog")
public class BrandController {

    private final BrandService brandService;

    public BrandController(BrandService brandService) {
        this.brandService = brandService;
    }

    @PostMapping("/brand/create")
    public String createBrand(@ModelAttribute("brand") Brand brand) {
        brandService.saveBrand(brand);
        return "redirect:/admin/catalog";
    }

    @PostMapping("/brand/toggle/{id}")
    public String toggleBrand(@PathVariable("id") Integer id) {
        this.brandService.actionBrand(id);
        return "redirect:/admin/catalog";
    }

    @PostMapping("/brand/update/{id}")
    public String updateBrand(@PathVariable Integer id, @ModelAttribute Brand brand) {
        brandService.updateBrand(id, brand);
        return "redirect:/admin/catalog";
    }
}
