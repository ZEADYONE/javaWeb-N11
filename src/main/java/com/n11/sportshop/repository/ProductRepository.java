package com.n11.sportshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>, JpaSpecificationExecutor<Product> {
    Page<Product> findAll(Pageable pageable);

    Page<Product> findAll(Specification<Product> specification, Pageable pageable);

    boolean existsByName(String name);

    List<Product> findTop8ByOrderByIdDesc();
}
