package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.MovieMapper;
import com.example.vo.Movie;

@Service
public class MovieService {

	@Autowired
	private MovieMapper movieMapper;
	
	public Movie getLikeCount(int movieNo) {
		return movieMapper.getMovieLikeCount(movieNo);
	}
}
