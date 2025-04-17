package com.grownited.controller.admin;


import java.time.LocalDate;
import java.util.ArrayList;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.grownited.repository.OrdersRepository;
import com.grownited.repository.PaymentRepository;
import com.grownited.repository.ProductRepository;
import com.grownited.repository.UserRepository;


@Controller
public class AdminController {
//	@Autowired
//	 SessionRepository repouserEntity;
	
	@Autowired
	ProductRepository repositoryproduct;
	
	@Autowired
	OrdersRepository repositoryOrder;
	
	@Autowired
	PaymentRepository paymentRepository;
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("admindashboard")
	public String admindashboard(Model model) {
	    Long totalUsers = userRepository.count();
	    Long totalOrders = repositoryOrder.count();
	    Long totalProducts = repositoryproduct.count(); // 👈 New line
	    Double totalRevenue = paymentRepository.getTotalRevenue(); 
	    LocalDate today = LocalDate.now();
	    int month = today.getMonthValue();

	    Integer thisMonthUserCount = userRepository.countThisMonthUser(month);
	    Integer thisMonthOrderCount = repositoryOrder.countThisMonthOrder(month);

	    Integer monthWiseUsers[] = new Integer[12];
	    for (int i = 1; i <= 12; i++) {
	        monthWiseUsers[i - 1] = userRepository.countThisMonthUser(i);
	    }

	    model.addAttribute("totalOrders", totalOrders);
	    model.addAttribute("totalUsers", totalUsers);
	    model.addAttribute("totalProducts", totalProducts); 
	    model.addAttribute("totalRevenue", totalRevenue);

	    model.addAttribute("thisMonthUserCount", thisMonthUserCount);
	    model.addAttribute("thisMonthOrderCount", thisMonthOrderCount);
	    model.addAttribute("monthWiseUsers", monthWiseUsers);
	    model.addAttribute("currentMonth", today.getMonth().name());

	    return "AdminDashboard";
	}
	/*
	 * @GetMapping("admindashboard") public String adminDashboard(Model model) {
	 * 
	 * //total users Long totalUsers =userRepository.count();
	 * 
	 * Integer totalAdmin = userRepository.findByRole("ADMIN").size();
	 * 
	 * Integer totalSeller = userRepository.findByRole("SELLER").size();
	 * 
	 * List<Object[]> userData = new ArrayList(); userData.add(new
	 * Object[]{"2025-04-12", 5}); userData.add(new Object[]{"2025-04-13", 8});
	 * userData.add(new Object[]{"2025-04-14", 10}); model.addAttribute("userData",
	 * userData); model.addAttribute("totalUsers",totalUsers); return
	 * "AdminDashboard"; }
	 */
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

