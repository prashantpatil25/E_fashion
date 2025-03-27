package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CartEntity;
import com.grownited.repository.CartRepository;

@Controller
public class CartController {
		
		@Autowired
		CartRepository repositoryCart;
	
		@GetMapping("newcart")
		public String newCart() {
			return "NewCart";
		}
		
		@PostMapping("savecart")
		public String saveCart(CartEntity entityCart) {
			repositoryCart.save(entityCart);
			return "NewCart";
		}
}
