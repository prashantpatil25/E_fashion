package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserAddressEntity;
import com.grownited.repository.UserAddressRepository;

@Controller
public class UserAddressController {
		
		@Autowired
		UserAddressRepository repoUserAddress;
		@GetMapping("newuseraddress")
		public String newUseraddress(Model model) {
			List<UserAddressEntity> addressList = repoUserAddress.findAll();
			//List<UserAddressEntity> addressList = repoUserAddress.findAll();
			//model.("addressList", repoUserAddress.findAll());
	        //model.addAttribute("newAddress", new UserAddressEntity());
			model.addAttribute("addressList", addressList);
			//model.addAttribute("addressList", addressList);
			return "NewUserAddress";
		}
		
		@PostMapping("saveuseraddress")
		public String saveUseraddress(UserAddressEntity userAddress) {
			System.out.println(userAddress.getAddressDetail());
			System.out.println(userAddress.getCityId());
			System.out.println(userAddress.getLandMark());
			System.out.println(userAddress.getStateId());
			System.out.println(userAddress.getStreet());
			System.out.println(userAddress.getTitle());
			System.out.println(userAddress.getUserAddressId());
			System.out.println(userAddress.getUserId());
			System.out.println(userAddress.getZipCode());
			System.out.println(userAddress.getUnitName());
			repoUserAddress.save(userAddress);
			return "NewUserAddress";
		}
}
