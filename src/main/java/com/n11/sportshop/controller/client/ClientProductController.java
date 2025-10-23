package com.n11.sportshop.controller.client;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.n11.sportshop.domain.PaginationQuery;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.dto.ProductCriteriaDTO;
import com.n11.sportshop.service.PaginationService;
import com.n11.sportshop.service.ProductService;

@Controller
public class ClientProductController {

    private final ProductService productService;
    private final PaginationService paginationService;

    public ClientProductController(ProductService productService, PaginationService paginationServie) {
        this.productService = productService;
        this.paginationService = paginationServie;
    }

    @GetMapping("/products")
    public String getAllProductPage(
            Model model,
            ProductCriteriaDTO productCriteriaDTO) {
        // PaginationQuery<Product> paginationQuery = this.paginationService.AdminProductPagination(productCriteriaDTO.getPage(), 9);
        
        Page<Product> productPage = this.paginationService.ClientProductsPagination(productCriteriaDTO);
        PaginationQuery<Product> paginationQuery = new PaginationQuery<>(productCriteriaDTO.getPage().get(), productPage);

        // --------------Lấy STT trang hiện tại-------------------
        model.addAttribute("currentPage", paginationQuery.getPage());

        // ---------------Lấy tổng số trang ------------------
        model.addAttribute("totalPage", paginationQuery.getPrs().getTotalPages());

        model.addAttribute("products", paginationQuery.getPrs().getContent());
        model.addAttribute("categories", this.productService.getAllCategories());
        model.addAttribute("brands", this.productService.getAllBrands());

        return "client/product/show";
    }

    @GetMapping("/products/{id}")
    public String getDetailProductPage(Model model, @PathVariable("id") int id) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        return "client/product/detail";
    }
}
