package com.example.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		
		return "home";	// prefix="/WEB-INF/views/" viewName="home" suffix=".jsp"
	}
	
	@GetMapping("/ticketing/screenList")
	public String screenList() {
		return "/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/ticketingList")
	public String ticketingList() {
		return "/ticketing/ticketingList";
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