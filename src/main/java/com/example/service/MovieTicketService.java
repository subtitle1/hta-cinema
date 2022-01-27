package com.example.service;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dto.MovieScheduleDto;
import com.example.dto.ShowScheduleScreenDto;
import com.example.mapper.MovieScheduleMapper;
import com.example.mapper.ShowScheduleScreenMapper;
import com.example.vo.Region;
import com.example.vo.SpecialScreen;

@Service
@Transactional
public class MovieTicketService {

	@Autowired
	private MovieScheduleMapper movieDao;
	@Autowired
	private ShowScheduleScreenMapper showDao;
	
	public List<MovieScheduleDto> getAllMovieScheduler(String day){
		return movieDao.getAllMovieScheduler(day);
	}
	public MovieScheduleDto getMovieSchedulerByMovieNo(int movieNo, int dayNo) {
		return movieDao.getMovieSchedulerByMovieNo(movieNo, dayNo);
	}
	public List<ShowScheduleScreenDto> AllListByMovie(int movieNo){
		return showDao.AllListByMovie(movieNo);
	}
	public int CountRegionByNo(int regionNo) {
		return showDao.CountRegionByNo(regionNo);
	}
	public List<ShowScheduleScreenDto> ListByTheaterNo(int movieNo, int theaterNo){
		return showDao.ListByTheaterNo(movieNo, theaterNo);
	}
	}

