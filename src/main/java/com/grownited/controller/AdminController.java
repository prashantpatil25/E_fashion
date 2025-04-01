package com.grownited.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {
		
		@GetMapping("admin")
		public String newAdmin() {
			return "AdminDashboard";
		}
		
		@PostMapping("saveadmin")
		public String saveAdmin() {
			return "AdminDashboard";
		}
}
