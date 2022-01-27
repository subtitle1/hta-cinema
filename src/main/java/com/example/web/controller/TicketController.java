package com.example.web.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
	public String ticketingList(@RequestParam(value="showTypeNo")String showTypeNo,@RequestParam(value="screenNo")String screenNo,
			@RequestParam(value="movieNo")String movieNo,@RequestParam(value="theaterNo")String theaterNo,Model model) {
		int showTypeNm = Integer.valueOf(showTypeNo);
		int screenNm = Integer.valueOf(screenNo);
		int movieNm = Integer.valueOf(movieNo);
		int theaterNm = Integer.valueOf(theaterNo);
		//좌석꺼내기, 영화꺼내기 그리고 모델에 담기 
		log.info("show"+showTypeNm);
		log.info("screen"+screenNm);
		log.info("movie"+movieNm);
		log.info("theater"+theaterNm);
		//model.addAttribute();
		return "/ticketing/ticketingList";
	}
	
	@PostMapping("/ticketing/ticketingList")
	public String postTicketingList(ScreenListInsertForm form, RedirectAttributes redirect) {
		String result = form.getDay().substring(form.getDay().length()-1, form.getDay().length());
		String result1 = form.getDay().substring(0, form.getDay().length());
		form.setDay(result);
		form.setTicketingDay(result1);
		ShowDayType day = movieRatingService.getShowDayType(form.getDay());
		log.info("showDayType객체 :" + day);
		new ScreenListInsertForm();
		ScreenListInsertForm save = ScreenListInsertForm.builder().movieNo(form.getMovieNo()).day(form.getDay()).ratingNo(form.getRatingNo())
		.regionNo(form.getRegionNo()).screenNo(form.getScreenNo()).showTypeNo(form.getShowTypeNo())
		.theaterNo(form.getTheaterNo()).ticketingDay(form.getTicketingDay()).time(form.getTime()).dayNo(day.getNo()).build();
		MovieScheduleDto movieSchedul = movieRatingService.getScheduleList(save);
		String theaterNo = Integer.toString(movieSchedul.getTheaterNo());
		String movieNo = Integer.toString(movieSchedul.getMovieNo());
		String screenNo = Integer.toString(movieSchedul.getScreenNo());
		String showTypeNo = Integer.toString(movieSchedul.getShowTypeNo());
		redirect.addAttribute("theaterNo", theaterNo);
		redirect.addAttribute("movieNo", movieNo);
		redirect.addAttribute("screenNo", screenNo);
		redirect.addAttribute("showTypeNo", showTypeNo);
		return "redirect:/ticketing/ticketingList";
	}
	
	 
}
