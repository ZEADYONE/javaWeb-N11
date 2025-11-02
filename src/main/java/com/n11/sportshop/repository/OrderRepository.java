package com.n11.sportshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.Order;
import com.n11.sportshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order,Integer>{
    List<Order> findByUser (User user);
    Order findTopByUserOrderByIdDesc(User user);
}
