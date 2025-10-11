package com.n11.sportshop.controller.admin;

import org.springframework.ui.Model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.service.ProductService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // hien thi danh sach san pham
    @GetMapping
    public String getProductPage(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "admin/product/show";
    }

    // hien thi form moi
    @GetMapping("/new")
    public String showAddForm(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/add";
    }

    // Xử lý lưu sản phẩm mới
    @PostMapping("/save")
    public String saveProduct(@ModelAttribute("product") Product product) {
        productService.saveProduct(product);
        return "redirect:/admin/product";
    }

    // Hiển thị chi tiết 1 sản phẩm
    @GetMapping("/{id}")
    public String showDetail(@PathVariable("id") int id, Model model) {
        Product product = productService.getProductById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm ID = " + id));
        model.addAttribute("product", product);
        return "admin/product/detail"; // file HTML hiển thị chi tiết
    }

    // Xóa sản phẩm
    @PostMapping("/delete")
    public String deleteProduct(@RequestParam("id") int id) {
        productService.deleteById(id);
        return "redirect:/admin/product";
    }

    // Sửa sản phẩm (hiển thị form)
    @GetMapping("/edit/{id}")
    public String editProductForm(@PathVariable("id") int id, Model model) {
        Product product = productService.getProductById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm ID = " + id));
        model.addAttribute("product", product);
        return "admin/product/edit";
    }

    // Cập nhật sản phẩm
    @PostMapping("/update")
    public String updateProduct(@ModelAttribute("product") Product product) {
        productService.saveProduct(product); // save() cũng có thể dùng để update
        return "redirect:/admin/product";
    }
}
