package com.n11.sportshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.Product;
import com.n11.sportshop.service.ProductService;

@Controller
public class ClientProductController {
    private final ProductService productService;

    public ClientProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public String getAllProductPage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/product/show";
    }

    @GetMapping("/products/{id}")
    public String getDetailProductPage(Model model, @RequestParam("id") int id) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        return "client/product/detail";
    }
}


