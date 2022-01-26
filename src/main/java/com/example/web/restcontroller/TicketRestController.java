package com.example.web.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.ResponseDto;
import com.example.dto.ShowScheduleScreen;
import com.example.service.MovieTicketService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class TicketRestController {
	
	@Autowired
	private MovieTicketService movieticketService;
	
	  @GetMapping("/screenList")
	  public ResponseDto<?>getAllList(@RequestParam("movieNo") int movieNo){
	  List<ShowScheduleScreen> screens = movieticketService.AllListByMovie(movieNo); 
	  ResponseDto<List<ShowScheduleScreen>> response = new ResponseDto<>();
	  response.setStatus(true);
	  response.setItems(screens);
	  return response;
	  }
	  
	  @GetMapping("/theaterList")
	  public ResponseDto<?>getAllListBytheaterNo(@RequestParam("movieNo") int movieNo, @RequestParam("theaterNo") int theaterNo){
		  List<ShowScheduleScreen> theaters = movieticketService.ListByTheaterNo(movieNo,theaterNo);
		  ResponseDto<List<ShowScheduleScreen>> response = new ResponseDto<>();
		  response.setStatus(true);
		  response.setItems(theaters);
		  return response;
	  }
	  
}
