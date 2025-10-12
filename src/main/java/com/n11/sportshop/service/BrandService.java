package com.n11.sportshop.service;

import org.springframework.stereotype.Service;

import com.n11.sportshop.domain.Brand;
import com.n11.sportshop.repository.BrandRepository;

@Service
public class BrandService {
    private final BrandRepository brandRepository;

    public BrandService(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    public Brand getBrandByName(String name) {
        return this.brandRepository.findByName(name);
    }
}
