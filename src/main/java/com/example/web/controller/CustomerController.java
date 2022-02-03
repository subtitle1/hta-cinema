package com.example.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.dto.CustomerCriteria;
import com.example.service.CustomerService;
import com.example.utils.SessionUtils;
import com.example.vo.Customer;

@Controller
public class CustomerController {
	static final Logger logger = LogManager.getLogger(CustomerController.class);
	
	@Autowired
	CustomerService customerService;
	
	@PostMapping("/customer/findPassword")
	public String findPassword(CustomerCriteria criteria) {
		Customer customer = customerService.findIdPassword(criteria);
		SessionUtils.addAttribute("CUSTOMER_ID", customer.getId());
		
		return "/customer/resetPassword";
	}
	
	@PostMapping("/customer/resetPassword")
	public String restPassword(String newPassword) {
		if (SessionUtils.getAttribute("CUSTOMER_ID") == null) {
			SessionUtils.sessionInvalidate();
			logger.info("잘못된 접근");
			return "redirect:/";
		}
		logger.info("회원정보 update");
		// 회원정보 update
		return "/customer/resetPassword";
	}
}
