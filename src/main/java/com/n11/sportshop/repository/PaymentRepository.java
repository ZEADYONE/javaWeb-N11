package com.n11.sportshop.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.n11.sportshop.domain.Payment;


@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer>{
    Payment findByPaymentMethod(String paymentMethod);
}
