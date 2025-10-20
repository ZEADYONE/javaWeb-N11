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
import com.n11.sportshop.repository.BrandRepository;
import com.n11.sportshop.repository.CategoryRepository;
import com.n11.sportshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final ImageService imageService;
    private final BrandRepository brandRepository;

    public ProductService(BrandRepository brandRepository, CategoryRepository categoryRepository,
            ImageService imageService, ProductRepository productRepository) {
        this.brandRepository = brandRepository;
        this.categoryRepository = categoryRepository;
        this.imageService = imageService;
        this.productRepository = productRepository;
    }

    // them moi san pham
    public void saveProduct(Product product, MultipartFile file) {
        Category categoryInDataBase = this.categoryRepository.findByCode(product.getCategory().getCode());
        product.setCategory(categoryInDataBase);
        Brand brandInDataBase = this.brandRepository.findByName(product.getBrand().getName());
        product.setBrand(brandInDataBase);
        String imageName = "";
        if (file != null && !file.isEmpty()) {
            imageName = this.imageService.handelImage(file, "product");
            product.setImage(imageName);
        }
        productRepository.save(product);
    }

    // xem danh sach tat ca san pham
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // xem chi tiet 1 san pham theo id
    public Optional<Product> getProductById(int id) {
        return productRepository.findById(id);
    }

    // xoa san pham
    public void deleteById(int id) {
        productRepository.deleteById(id);
    }

    public List<Category> getAllCategories() {
        return this.categoryRepository.findAll();
    }

    public List<Brand> getAllBrands() {
        return this.brandRepository.findAll();
    }

    public Page<Product> fetchProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }
}
