package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.dto.MovieScheduleDto;

public interface MovieScheduleMapper {

	public List<MovieScheduleDto> getAllMovieScheduler(String day);
	public MovieScheduleDto getMovieSchedulerByMovieNo(@Param("movieNo")int movieNo,@Param("dayNo")int dayNo);
	
}
