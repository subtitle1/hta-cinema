package com.example.mapper;

import java.util.List;

import com.example.dto.MovieScheduleDto;

public interface MovieScheduleMapper {

	public List<MovieScheduleDto> getAllMovieScheduler();
	public MovieScheduleDto getMovieSchedulerByMovieNo(int movieNo);
	
}
