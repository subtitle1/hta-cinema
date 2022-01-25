package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dto.MovieRatingDto;
import com.example.mapper.MovieRatingMapper;

@Service
@Transactional
public class MovieRatingService {

	@Autowired
	private MovieRatingMapper movieRatingDto;
	
	public List<MovieRatingDto> getAllList(){
		return movieRatingDto.getAllList();
	}
	public MovieRatingDto getListByMovieNo(int movieNo) {
		return movieRatingDto.getAllListByMovieNo(movieNo);
	}
}
