package com.example.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.MovieRatingDto;
import com.example.dto.ResponseDto;
import com.example.dto.ShowScheduleScreen;
import com.example.service.MovieRatingService;
import com.example.service.MovieTicketService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TicketController {

	@Autowired
	private MovieRatingService movieRatingService;
	
	
	@GetMapping("/ticketing/screenList")
	public String screenList(Model model) {
		
		List<MovieRatingDto> movies = movieRatingService.getAllList();
		log.info(movies.toString());
		model.addAttribute("movies", movies);
		log.info(model.toString());
		return "/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/ticketingList")
	public String ticketingList() {
		return "/ticketing/ticketingList";
	}
	
	
	 
}
