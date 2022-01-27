package com.example.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.utils.SessionUtils;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("message", "HTA CINEMA 방문을 환영합니다.");
		
		return "home";	// prefix="/WEB-INF/views/" viewName="home" suffix=".jsp"
	}

	@GetMapping("/logout")
	public String logout() {
		SessionUtils.sessionInvalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/findIdPassword")
	public String findIdPassword() {
		return "/customer/findIdPassword";
	}
	
	@GetMapping("/ticketing/ticketingPay")
	public String ticketingPay() {
		return "/ticketing/ticketingPay";
	}

	@GetMapping("/timeTable/timeTable")
	public String timeTable() {
		return "/timeTable/timeTable";
	}
}