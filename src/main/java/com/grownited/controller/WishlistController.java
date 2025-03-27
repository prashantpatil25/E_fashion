package com.grownited.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.WishlistEntity;
import com.grownited.repository.WishlistRepository;

@Controller
public class WishlistController {
		
		@Autowired
		WishlistRepository repositoryWishlist;
		@GetMapping("newwishlist")
		public String newWishlist() {
			return "NewWishList";
		}
		
		@PostMapping("savewishlist")
		public String saveWishlist(WishlistEntity entityWishlist) {
			repositoryWishlist.save(entityWishlist);
			return "NewWishList";
		}
}
