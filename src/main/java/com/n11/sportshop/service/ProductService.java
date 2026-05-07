package com.n11.sportshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.n11.sportshop.domain.Brand;
import com.n11.sportshop.domain.Category;
import com.n11.sportshop.domain.Product;
import com.n11.sportshop.domain.Voucher;
import com.n11.sportshop.repository.BrandRepository;
import com.n11.sportshop.repository.CategoryRepository;
import com.n11.sportshop.repository.ProductRepository;
import com.n11.sportshop.repository.VoucherRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final ImageService imageService;
    private final BrandRepository brandRepository;
    private final VoucherRepository voucherRepository;

    public ProductService(BrandRepository brandRepository, CategoryRepository categoryRepository,
            ImageService imageService, ProductRepository productRepository, VoucherRepository voucherRepository) {
        this.brandRepository = brandRepository;
        this.categoryRepository = categoryRepository;
        this.imageService = imageService;
        this.productRepository = productRepository;
        this.voucherRepository = voucherRepository;
    }

    // them moi san pham
    public void saveProduct(Product product, MultipartFile file) {
        Category categoryInDataBase = this.categoryRepository.findByCode(product.getCategory().getCode());
        product.setCategory(categoryInDataBase);
        Brand brandInDataBase = this.brandRepository.findByName(product.getBrand().getName());
        product.setBrand(brandInDataBase);
        String imageName = "";
        if (file != null && !file.isEmpty()) {
            this.imageService.deleteImage(product.getImage(), "product");
            imageName = this.imageService.handelImageForProduct(file, "product", product);
            product.setImage(imageName);
        }
        productRepository.save(product);
    }

    // xem danh sach tat ca san pham
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public List<Product> getActiveProduct() {
        return this.productRepository.findActiveProduct();
    }

    // xem chi tiet 1 san pham theo id
    public Optional<Product> getProductById(int id) {
        return productRepository.findById(id);
    }

    // xoa san pham
    public void deleteById(int id) {
        productRepository.deleteById(id);
    }

    public Page<Product> getAllProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    // Kiểm tra Tên sản phẩm có tồn tại hay ko
    public boolean existsByName(String name) {
        return this.productRepository.existsByName(name);
    }

    public void createVoucher(Voucher voucher) {
        this.voucherRepository.save(voucher);
    }

    public void updateVoucher(Integer id) {
        Voucher voucher = this.voucherRepository.findById(id).get();
        if (voucher.getStatus() == 1) {
            voucher.setStatus(0);
        } else {
            voucher.setStatus(1);
        }
        this.voucherRepository.save(voucher);
    }

    public List<Product> getLatestProducts() {
        return this.productRepository.findTop8ByOrderByIdDesc();
    }

    public List<Voucher> getVouchers() {
        return this.voucherRepository.findAll();
    }

    public List<Voucher> getActiveVoucher(int status) {
        return this.voucherRepository.findByStatus(status);
    }

    public List<Product> getActiveProduct(int status) {
        return this.productRepository.findByStatus(status);
    }

    public void actionProduct(Integer id) {
        Product product = this.productRepository.findById(id).get();
        if (product.getStatus() == 1) {
            product.setStatus(0);
        } else {
            product.setStatus(1);
        }
        this.productRepository.save(product);
    }

    public long countActiveProductsWithActiveCategoryAndBrand() {
        return productRepository.countActiveProductsWithActiveCategoryAndBrand();
    }

}
