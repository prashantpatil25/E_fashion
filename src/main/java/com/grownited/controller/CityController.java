package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CityController {
	
	@GetMapping("newcity")
	public String newCity() {
		return "NewCity";
	}
	
	@PostMapping("savecity")
	public String saveCity() {
		return "NewCity";
	}
}
