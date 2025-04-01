package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.CategoryEntity;
import com.grownited.entity.ProductEntity;
import com.grownited.service.CategoryService;
import com.grownited.service.ProductService;

@Controller
public class HomeController {
		
	@Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ProductService productService;
		@GetMapping("home")
		public String newHome() {
			return "Home";
		}
		
		@PostMapping("savehome")
		public String saveHome() {
			return "Home";
		}
		
		@GetMapping("index")
		public String index(Model model) {
			// Fetch category and product list from the database
			List<CategoryEntity> categories = categoryService.categoryEntities();
			List<ProductEntity> products = productService.getProductEntities();

	        // Add to model
			model.addAttribute("categories",categories);
			model.addAttribute("products",products);
	       
	       
			return "Index";
		}
		
		@PostMapping("saveindex")
		public String saveIndex() {
			return "Index";
		}
}
