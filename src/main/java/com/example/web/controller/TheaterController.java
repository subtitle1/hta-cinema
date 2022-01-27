package com.example.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.TheaterService;
import com.example.vo.Theater;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
	@Autowired
	TheaterService theaterService;

	@GetMapping("/list")
	public String theaterlist(Model model) {
		
		Map<String, List<Theater>> theaters = theaterService.getAllTheaters();
		
		model.addAttribute("theaters", theaters);
		return "/theater/list";
	}
	@GetMapping("/detail")
	public String detail() {
		
		return "/theater/detail";
	}
	@GetMapping("/th")
	public String th() {
		
		return "/theater/th";
	}
}
