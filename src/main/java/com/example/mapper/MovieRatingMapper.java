package com.example.mapper;

import java.util.List;


import com.example.dto.MovieRatingDto;

public interface MovieRatingMapper {
	
	public List<MovieRatingDto> getAllList();
	public MovieRatingDto getAllListByMovieNo(int movieNo);
}
