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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dto.MovieRatingDto;
import com.example.dto.MovieScheduleDto;
import com.example.dto.ResponseDto;
import com.example.dto.ShowScheduleScreenDto;
import com.example.service.MovieRatingService;
import com.example.service.MovieTicketService;
import com.example.vo.Region;
import com.example.vo.ShowDayType;
import com.example.vo.ShowStartTimeType;
import com.example.vo.Theater;
import com.example.web.form.ScreenListInsertForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TicketController {

	@Autowired
	private MovieRatingService movieRatingService;
	@Autowired
	private MovieTicketService movieTicketService;
	
	
	@GetMapping("/ticketing/screenList")
	public String screenList(Model model) {
		List<MovieRatingDto> movies = movieRatingService.getAllList();
		List<Region> regions = movieTicketService.listByRegion();
		int number = 0;
		for(Region rs : regions) {
			number = rs.no;
		}
		int countRegion = movieTicketService.CountRegionByNo(number);
		log.info(movies.toString());
		model.addAttribute("movies", movies);
		model.addAttribute("regions", regions);
		model.addAttribute("countRegion", countRegion);
		log.info(model.toString());
		return "/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/ticketingList")
	public String ticketingList(@RequestParam(name="schedul", defaultValue="defaultValue") String schedul, Model model) {
		model.addAttribute("schedul", schedul);
		return "/ticketing/ticketingList";
	}
	
	@PostMapping("/ticketing/ticketingList")
	public String postTicketingList(ScreenListInsertForm form, RedirectAttributes redirect) {
		ShowDayType day = movieRatingService.getShowDayType(form.getDay());
		new ScreenListInsertForm();
		ScreenListInsertForm save = ScreenListInsertForm.builder().movieNo(form.getMovieNo()).day(form.getDay()).ratingNo(form.getRatingNo())
		.regionNo(form.getRegionNo()).screenNo(form.getScreenNo()).showTypeNo(form.getShowTypeNo())
		.theaterNo(form.getTheaterNo()).ticketingDay(form.getTicketingDay()).time(form.getTime()).dayNo(day.getNo()).build();
		MovieScheduleDto movieSchedul = movieRatingService.getScheduleList(save);
		redirect.addAttribute("schedul", movieSchedul);
		return "redirect:/ticketing/ticketingList";
	}
	
	 
}
