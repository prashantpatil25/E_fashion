package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.OrderDetailEntity;
import com.grownited.entity.OrdersEntity;
import com.grownited.repository.OrderDetailRepository;
import com.grownited.repository.OrdersRepository;

@Controller
public class OrderController {
		
		@Autowired
		OrdersRepository repositoryOrders;
		
		@Autowired
		OrderDetailRepository repositoryOrderdetails;
		
		@GetMapping("neworder")
		public String newOrder() {
			return "NewOrder";
		}
		
		@PostMapping("saveorder")
		public String saveOrder(OrdersEntity entityOrders) {
			repositoryOrders.save(entityOrders);
			return "NewOrder";
		}
		
		@GetMapping("neworderdetails")
		public String newOrderdetails() {
			return "NewOrderDetails";
		}
		
		@PostMapping("saveorderdetails")
		public String saveOrderdetails(OrderDetailEntity entityOrderdetails) {
			repositoryOrderdetails.save(entityOrderdetails);
			return "NewOrderDetails";
		}
}
