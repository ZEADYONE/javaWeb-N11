package com.n11.sportshop.controller.admin;

import org.springframework.ui.Model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n11.sportshop.domain.Brand;
import com.n11.sportshop.domain.Category;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.service.ProductService;
import com.n11.sportshop.service.CategoryService;
import com.n11.sportshop.service.BrandService;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
    private final ProductService productService;
    private final CategoryService categoryService;
    private final BrandService brandService;

    public ProductController(ProductService productService, CategoryService categoryService,
            BrandService brandService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.brandService = brandService;
    }

    // hien thi danh sach san pham
    @GetMapping
    public String getProductPage(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        model.addAttribute("newProduct", new Product());
        return "admin/product/show";
    }

    // hien thi form moi
    @GetMapping("/create")
    public String getProductCreatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        model.addAttribute("categorie", new Category());
        model.addAttribute("brand", new Brand());
        return "admin/product/create";
    }

    // Xử lý lưu sản phẩm mới
    @PostMapping("/create")
    public String postCreateProduct(@ModelAttribute("newProduct") Product product) {
        // Nhớ thêm tạm Shirt, Pant vào database category
        // Nhớ thêm tạm Hehe, Hihi vào database brand

        Category categoryInDataBase = this.categoryService.getCategoryByName(product.getCategory().getName());
        product.setCategory(categoryInDataBase);

        Brand brandInDataBase = this.brandService.getBrandByName(product.getBrand().getName());
        product.setBrand(brandInDataBase);

        this.productService.saveProduct(product);
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
    @PostMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id) {
        productService.deleteById(id);
        return "redirect:/admin/product";
    }

    // Sửa sản phẩm (hiển thị form)
    @GetMapping("/update/{id}")
    public String editProductForm(@PathVariable("id") int id, Model model) {
        Product product = productService.getProductById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm ID = " + id));
        model.addAttribute("product", product);
        return "admin/product/update";
    }

    // Cập nhật sản phẩm
    @PostMapping("/update")
    public String updateProduct(@ModelAttribute("product") Product product) {
        productService.saveProduct(product); // save() cũng có thể dùng để update
        return "redirect:/admin/product";
    }
}
