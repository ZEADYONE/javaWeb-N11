package com.n11.sportshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    void deleteById(int id);

    User findByUsername(String username);

    User findFirstById(int id);

    Page<User> findAll(Pageable pageable);
}
