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
import com.example.mapper.TheaterMapper;
import com.example.vo.Region;
import com.example.vo.SpecialScreen;
import com.example.vo.Theater;

@Service
@Transactional
public class MovieTicketService {

	@Autowired
	private MovieScheduleMapper movieDao;
	@Autowired
	private ShowScheduleScreenMapper showDao;
	@Autowired
	private TheaterMapper theaterDao;
	@Autowired
	private MovieScheduleMapper schedulDao;
	
	public List<ShowScheduleScreenDto> AllListByMovie(int movieNo){
		return showDao.AllListByMovie(movieNo);
	}
	public int CountRegionByNo(int regionNo) {
		return showDao.CountRegionByNo(regionNo);
	}
	public List<ShowScheduleScreenDto> ListByTheaterNo(int movieNo, int theaterNo){
		return showDao.ListByTheaterNo(movieNo, theaterNo);
	}
	
	public List<Region> listByRegion(){
		return theaterDao.getAllRegion();
	}
	public List<Theater> listByRegionNo(int regionNo){
		return schedulDao.getAllMovieScheduler(regionNo);
	}
	}

