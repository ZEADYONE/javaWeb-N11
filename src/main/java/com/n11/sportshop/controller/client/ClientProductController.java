package com.n11.sportshop.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.PaginationQuery;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.service.PaginationServie;
import com.n11.sportshop.service.ProductService;

@Controller
public class ClientProductController {
    private final ProductService productService;
    private final PaginationServie paginationServie;

    public ClientProductController(ProductService productService, PaginationServie paginationServie) {
        this.productService = productService;
        this.paginationServie = paginationServie;
    }

    @GetMapping("/products")
    public String getAllProductPage(Model model, @RequestParam("page") Optional<String> pageOptinal) {

        PaginationQuery<Product> paginationQuery = this.paginationServie.handelProductPagination(pageOptinal, 5);

        // --------------Lấy STT trang hiện tại-------------------
        model.addAttribute("currentPage", paginationQuery.getPage());

        // ---------------Lấy tổng số trang ------------------
        model.addAttribute("totalPage", paginationQuery.getPrs().getTotalPages());

        model.addAttribute("products", paginationQuery.getPrs().getContent());

        return "client/product/show";
    }

    @GetMapping("/products/{id}")
    public String getDetailProductPage(Model model, @PathVariable("id") int id) {
        Product product = this.productService.getProductById(id).get();
        model.addAttribute("product", product);
        return "client/product/detail";
    }
}
