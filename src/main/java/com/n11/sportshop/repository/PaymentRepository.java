package com.n11.sportshop.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.n11.sportshop.domain.Payment;



public interface PaymentRepository extends JpaRepository<Payment, Integer>{
    Payment findByPaymentMethod(String paymentMethod);
}
