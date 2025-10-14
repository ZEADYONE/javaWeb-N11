package com.n11.sportshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;
import com.n11.sportshop.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail,Integer> {
    List<OrderDetail> findByOrder(Order order);
}
