package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.MovieMapper;

@Service
public class MovieService {

	@Autowired
	private MovieMapper movieMapper;
	
	public int getLikeCount(int movieNo) {
		return movieMapper.getMovieLikeCount(movieNo);
	}
}
