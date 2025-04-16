package com.grownited.controller.admin;


import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.repository.UserRepository;


@Controller
public class AdminController {
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("admindashboard")
	public String adminDashboard(Model model) {
		
		//total users
		Long totalUsers =userRepository.count();
		
		Integer totalAdmin = userRepository.findByRole("ADMIN").size();
		
		Integer totalSeller = userRepository.findByRole("SELLER").size();
		
		List<Object[]> userData = new ArrayList();
		userData.add(new Object[]{"2025-04-12", 5});
		userData.add(new Object[]{"2025-04-13", 8});
		userData.add(new Object[]{"2025-04-14", 10});
		model.addAttribute("userData", userData);
		model.addAttribute("totalUsers",totalUsers);
		return "AdminDashboard";
	}
	@GetMapping("userprofile")
	public String userprofile() {
		return "UserProfile";
	}
	
	/*
	 * @GetMapping("/userStats")
	 * 
	 * @ResponseBody public Map<String, Integer> getUserStats() { List<Object[]>
	 * data = userRepository.countUsersByDate(); Map<String, Integer> result = new
	 * LinkedHashMap<>();
	 * 
	 * for (Object[] row : data) { result.put(row[0].toString(), ((Number)
	 * row[1]).intValue()); }
	 * 
	 * return result; }
	 */

}

