package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AreaController {
	
	@GetMapping("newarea")
	public String NewArea() {
		return "NewArea";
	}
	
	@PostMapping("savearea")
	public String newArea() {
		return "NewArea";
	}

}
