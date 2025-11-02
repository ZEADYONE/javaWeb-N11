package com.n11.sportshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.n11.sportshop.domain.Voucher;

public interface VoucherRepository extends JpaRepository<Voucher, Integer>{
    
}
