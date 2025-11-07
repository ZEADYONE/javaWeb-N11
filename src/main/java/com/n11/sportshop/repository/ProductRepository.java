package com.n11.sportshop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>, JpaSpecificationExecutor<Product> {

    @Query(value = """
            SELECT p.*, c.code
            FROM product p
            JOIN brand b ON p.brand_id = b.id
            JOIN category c ON p.category_id = c.id
            WHERE c.status = 1 AND b.status = 1
            ORDER BY c.code ASC
            """,
            countQuery = """
            SELECT count(*)
            FROM product p
            JOIN brand b ON p.brand_id = b.id
            JOIN category c ON p.category_id = c.id
            WHERE c.status = 1 AND b.status = 1
            """,
            nativeQuery = true)
    Page<Product> findAll(Pageable pageable);

    Page<Product> findAll(Specification<Product> specification, Pageable pageable);

    boolean existsByName(String name);

    List<Product> findTop8ByOrderByIdDesc();

    @Query(value = "SELECT * FROM product WHERE id = :id FOR UPDATE", nativeQuery = true)
    Optional<Product> findByIdForUpdate(@Param("id") Integer id);
}
