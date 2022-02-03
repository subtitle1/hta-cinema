package com.example.web.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.ResponseDto;
import com.example.service.CustomerService;
import com.example.utils.SessionUtils;
import com.example.vo.Customer;

@RestController
public class HomeRestController {
	@Autowired
	private CustomerService customerService;
	
	@PostMapping("/login")
	public ResponseDto<?> login(String id, String password) {
		ResponseDto<?> response = new ResponseDto<>();
		
		Customer customer = customerService.login(id, password);
		SessionUtils.addAttribute("LOGIN_USER", customer);
		
		response.setStatus(true);
		
		return response;
	}
}
