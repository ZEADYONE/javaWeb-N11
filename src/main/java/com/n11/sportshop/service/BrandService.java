package com.n11.sportshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Brand;
import com.n11.sportshop.repository.BrandRepository;

@Service
public class BrandService {

    private final BrandRepository brandRepository;

    public BrandService(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    public List<Brand> getAllBrands() {
        return this.brandRepository.findAll();
    }

    public void saveBrand(Brand brand) {
        brandRepository.save(brand);
    }

    public List<Brand> getActiveBrand(int status) {
        return this.brandRepository.findByStatus(status);
    }

    public void actionBrand(Integer id) {
        Brand brand = this.brandRepository.findById(id).get();
        if (brand.getStatus() == 1) {
            brand.setStatus(0);
        } else {
            brand.setStatus(1);
        }
        this.brandRepository.save(brand);
    }

    public void updateBrand(Integer id, Brand updatedBrand) {
        Brand brand = brandRepository.findById(id).orElse(null);
        if (brand != null) {
            brand.setName(updatedBrand.getName());
            brandRepository.save(brand);
        }
    }
}
