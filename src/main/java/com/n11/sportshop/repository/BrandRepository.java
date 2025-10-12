package com.n11.sportshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.Brand;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Integer> {
    Brand findByName(String name);
}
