package com.n11.sportshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.User;
import com.n11.sportshop.domain.UserVoucher;
import com.n11.sportshop.domain.Voucher;

@Repository
public interface UserVoucherRepo extends JpaRepository<UserVoucher, Integer>{
    List<UserVoucher> findByUserAndQuantityGreaterThan(User user, Integer quantity);
    UserVoucher findByUserAndVoucher(User user, Voucher voucher);
}
