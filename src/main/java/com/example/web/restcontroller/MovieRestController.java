package com.example.web.restcontroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.MovieService;

@RestController
@RequestMapping("/rest")
public class MovieRestController {

	@Autowired
	private MovieService movieService;
	
	@GetMapping("/count")
	public int likeCount(int movieNo) {
		
		int count = movieService.getLikeCount(movieNo);
		
		return count;
	}
}
