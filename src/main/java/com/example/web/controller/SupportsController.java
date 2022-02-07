package com.example.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.FaqDto;
import com.example.pagination.Pagination;
import com.example.service.FaqService;
import com.example.service.QnaService;
import com.example.service.TheaterService;
import com.example.vo.QnaType;
import com.example.vo.Region;
import com.example.web.form.FaqCriteria;

@Controller
public class SupportsController {

	@Autowired
	private TheaterService theaterService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private FaqService FaqService;
	
	static final Logger logger = LogManager.getLogger(SupportsController.class);
	
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
	
	@GetMapping("/supports/faq")
	public String faq() {
		/*int totalRecords = FaqService.getFaqRows(criteria);
		
		Pagination pagination = new Pagination(page, totalRecords);
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<FaqDto> dto = FaqService.getAllFaq(criteria);
		
		logger.info("페이지: ", page);
		logger.info("조건: ", criteria);
		
		model.addAttribute("faqList", dto);
		model.addAttribute("pagination", pagination);*/
		
		return "/supports/faq";
	}
}
