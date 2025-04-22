package com.grownited.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.grownited.entity.PaymentEntity;


public interface PaymentRepository extends JpaRepository<PaymentEntity, Integer>{
	@Query("SELECT SUM(p.amount) FROM PaymentEntity p")
    Double getTotalRevenue();
	@Query("SELECT SUM(p.amount) FROM PaymentEntity p WHERE MONTH(p.paymentDate) = :month")
	Double getTotalRevenueByMonth(@org.springframework.data.repository.query.Param("month") int month);

}