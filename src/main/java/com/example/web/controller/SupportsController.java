package com.example.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.service.QnaService;
import com.example.service.TheaterService;
import com.example.vo.QnaType;
import com.example.vo.Region;

@Controller
public class SupportsController {

	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/supports")
	public String supports() {
		return "/supports/main";
	}
	
	@GetMapping("/supports/inquiry")
	public String inquiry(Model model) {
		
		List<Region> regions = theaterService.getAllRegion();
		List<QnaType> categories = qnaService.getAllCategories();
		
		model.addAttribute("regions", regions);
		model.addAttribute("categories", categories);
		
		return "/supports/inquiry";
	}
}
