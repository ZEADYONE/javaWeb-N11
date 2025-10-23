package com.n11.sportshop.controller.client;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n11.sportshop.domain.PaginationQuery;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.dto.ProductCriteriaDTO;
import com.n11.sportshop.service.CartService;
import com.n11.sportshop.service.PaginationService;
import com.n11.sportshop.service.ProductService;
import com.n11.sportshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientProductController {

    private final CartService cartService;
    private final ProductService productService;
    private final PaginationService paginationService;
    private final UserService userService;

    public ClientProductController(ProductService productService,
            PaginationService paginationService,
            CartService cartService,
            UserService userService) {
        this.productService = productService;
        this.paginationService = paginationService;
        this.cartService = cartService;
        this.userService = userService;
    }

    @GetMapping("/products")
    public String getAllProductPage(
            Model model,
            ProductCriteriaDTO productCriteriaDTO) {
        // PaginationQuery<Product> paginationQuery =
        // this.paginationService.AdminProductPagination(productCriteriaDTO.getPage(),
        // 9);

        Page<Product> productPage = this.paginationService.ClientProductsPagination(productCriteriaDTO);
        PaginationQuery<Product> paginationQuery = new PaginationQuery<>(productCriteriaDTO.getPage().get(),
                productPage);

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

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable("id") int id,
            @RequestParam(defaultValue = "1") int quantity,
            HttpSession session, HttpServletRequest request) {

        // Lấy email từ session
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login"; // chưa đăng nhập
        }

        // Lấy user từ database
        User user = userService.getUserByUsername(username);

        // Thêm sản phẩm vào giỏ
        this.cartService.addToCart(user, id, quantity);

        // Lấy trang hiện tại (Referer)
        String referer = request.getHeader("Referer");

        // Chuyển hướng lại trang hiện tại
        return "redirect:" + referer;
    }
}
