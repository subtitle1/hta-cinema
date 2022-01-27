package com.example.web.restcontroller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.ResponseDto;
import com.example.dto.ShowScheduleScreenDto;
import com.example.service.MovieTicketService;
import com.example.vo.Region;
import com.example.vo.SpecialScreen;
import com.example.vo.Theater;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class TicketRestController {
	
	@Autowired
	private MovieTicketService movieticketService;
	
	  @GetMapping("/screenList")
	  public ResponseDto<?>getAllList(@RequestParam("movieNo")int movieNo){
	  List<ShowScheduleScreenDto> screens = movieticketService.AllListByMovie(movieNo); 
	  ResponseDto<List<ShowScheduleScreenDto>> response = new ResponseDto<>();
	  response.setStatus(true);
	  response.setItems(screens);
	  return response;
	  }
	  
	  @GetMapping("/theaterList")
	  public ResponseDto<?>getAllListBytheaterNo(@RequestParam("movieNo") int movieNo, @RequestParam("theaterNo") int theaterNo, @RequestParam("timeNo") int timeNo){
		  List<ShowScheduleScreenDto> theaters = movieticketService.ListByTheaterNo(movieNo,theaterNo);
		  List<ShowScheduleScreenDto> theater = new ArrayList<>();
		  for(ShowScheduleScreenDto sc :theaters) {
			  DateFormat dateFormat = new SimpleDateFormat("HH");
			  String startTime = dateFormat.format(sc.getShowScheduleStartTime());
			  int time = Integer.parseInt(startTime);
			  log.info("시간은"+time);
			  log.info("시간은"+timeNo);
			 if(time>=timeNo) {
				 theater.add(sc);
			 } 
		  }
		  ResponseDto<List<ShowScheduleScreenDto>> response = new ResponseDto<>();
		  response.setStatus(true);
		  response.setItems(theater);
		  log.info("시간은"+theater);
		  return response;
	  }
	  @GetMapping("/theater")
	  public ResponseDto<?>getRegionBytheaterNo(@RequestParam(required=false, value="regionNo", defaultValue="10" ) int regionNo) {
		  List<Theater> theaters =  movieticketService.listByRegionNo(regionNo);
		  ResponseDto<List<Theater>> response = new ResponseDto<>();
		  response.setStatus(true);
		  response.setItems(theaters);
		  return response;
	  }
	  
}
