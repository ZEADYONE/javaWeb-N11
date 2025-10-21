package com.n11.sportshop.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.PaginationQuery;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.User;

@Service
public class PaginationService {

    private final UserService userService;
    private final ProductService productService;

    public PaginationService(UserService userService, ProductService productService) {
        this.userService = userService;
        this.productService = productService;
    }

    
    public PaginationQuery<Product> handelProductPagination(Optional<String> pageOptinal, int size) {
        // pageOptinal chứa số thứ tự trang do client truyền lên (có thể null hoặc rỗng)
        // size :Số lượng sản phẩm hiển thị trên mỗi trang
        int page = 1; // Mặc định nếu client không truyền số trang thì sẽ hiển thị trang đầu tiên

        try {
            // Nếu client có truyền số trang (ví dụ ?page=2) → parse từ String sang int
            if (pageOptinal.isPresent()) {
                page = Integer.parseInt(pageOptinal.get());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // Pageable: đại diện cho thông tin phân trang mà Spring Data JPA sử dụng
        // page - 1 vì trong Spring Data JPA, số trang bắt đầu từ 0 (0 = trang 1, 1 =
        // trang 2, ...)
        Pageable pageable = PageRequest.of(page - 1, size);

        // fetchProducts(pageable) trả về một Page<Product> gồm danh sách sản phẩm +
        // tổng số trang + tổng số phần tử
        Page<Product> prs = this.productService.fetchProducts(pageable);

        return new PaginationQuery<>(page, prs);
    }

    public PaginationQuery<User> handelUserPagination(Optional<String> pageOptinal, int size) {
        int page = 1;

        try {
            if (pageOptinal.isPresent()) {
                page = Integer.parseInt(pageOptinal.get());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Pageable pageable = PageRequest.of(page - 1, size);
        Page<User> prs = this.userService.fetchUsers(pageable);

        return new PaginationQuery<>(page, prs);
    }


    // Đang test thử filter 
    public PaginationQuery<Product> handelFilterProductPagination(Optional<String> pageOptinal, int size, Optional<String> codeOptional) {
        int page = 1;
        try {
            if (pageOptinal.isPresent()) {
                page = Integer.parseInt(pageOptinal.get());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Pageable pageable = PageRequest.of(page - 1, size);
        String code = codeOptional.isPresent() ? codeOptional.get() : "";
        Page<Product> prs = this.productService.fetchProductsByCode(pageable, code);
        return new PaginationQuery<>(page, prs);
    }
}
