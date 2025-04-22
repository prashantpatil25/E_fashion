package com.grownited.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.grownited.entity.CartEntity;
import com.grownited.entity.OrdersEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.CartRepository;
import com.grownited.repository.OrdersRepository;
import com.grownited.service.PaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	OrdersRepository ordersRepository;
	
	@GetMapping("checkout")
	public String checkout(Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		List<Object[]> carts = cartRepository.getAllCartItemByUserId(user.getUserId());

		Integer amount = 0;
		for (Object c[] : carts) {
			amount = amount + (int) Double.parseDouble(c[1].toString());

		}

		System.out.println("amount => " + amount);
		model.addAttribute("amount", amount);
		return "Checkout";// credit card expDate

	}

	@PostMapping("pay")
	public String pay(String ccNum, String expDate, HttpSession session) {
	    UserEntity user = (UserEntity) session.getAttribute("user");

	    // get all items from cart
	    List<Object[]> carts = cartRepository.getAllCartItemByUserId(user.getUserId());

	    Integer amount = 0;
	    for (Object c[] : carts) {
	        amount = amount + (int) Double.parseDouble(c[1].toString());
	    }

	    System.out.println("Amount => " + amount);
	    Integer paymentId = paymentService.chargeCreditCard("8U8k4fDcR", "2VM5bqu25vuWA832", amount * 1.0, ccNum,
	            expDate, user.getEmail(), user.getUserId());

	    if (paymentId == -1) {
	        return "redirect:/checkout";
	    }

	    // 🔥 Save order
	    OrdersEntity order = new OrdersEntity();
	    order.setUserId(user.getUserId());
	    order.setStatus("Pending");
	    order.setTotalAmount(BigDecimal.valueOf(amount));
	    order.setCreatedAt(new Date());
	    order.setPaymentId(paymentId);

	    ordersRepository.save(order);

	    // cartRepository.deleteAllByUserId(user.getUserId()); // if needed

	    return "redirect:/home";
	}



}