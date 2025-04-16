package com.grownited.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;

@Controller
public class AdminActiveUsers {
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("adminactiveusers")
	public String adminActiveUsers(Model model) {
	List<UserEntity> users=	userRepository.findByRole("BUYER");
	
	model.addAttribute("userList",users);
	
		return "AdminActiveUsers";
	}
	
	@GetMapping("adminactivesellers")
	public String adminActiveSellers(Model model) {

	List<UserEntity> sellers=	userRepository.findByRole("SELLER");
	
	model.addAttribute("userList",sellers);
		return "AdminActiveSellers";
	}
}
