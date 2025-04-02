package com.grownited.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("products")
	public String products() {
		return "Products";
	}

	@GetMapping("productdetail")
	public String productdetail() {
		return "ProductDetail";
	}

	@GetMapping("shopingcart")
	public String shopingcart() {
		return "ShopingCart";
	}

	@GetMapping("blog")
	public String blog() {
		return "Blog";
	}

	@GetMapping("contact")
	public String contact() {
		return "Contact";
	}

	@GetMapping("about")
	public String about() {
		return "About";
	}

	@GetMapping("blogdetail")
	public String blogdetail() {
		return "BlogDetail";
	}
}