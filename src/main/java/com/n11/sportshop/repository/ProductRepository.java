package com.n11.sportshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.Product;


@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{

}
