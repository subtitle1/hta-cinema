package com.example.web.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.MovieService;
import com.example.vo.Movie;

@RestController
@RequestMapping("/rest")
public class MovieRestController {

	@Autowired
	private MovieService movieService;
	
	@GetMapping("/count")
	public Movie likeCount(int movieNo) {
		return movieService.getLikeCount(movieNo);
	}
	
	@GetMapping("/top4")
	public List<Movie> getTop4() {
		return movieService.getTop4();
	}
}
