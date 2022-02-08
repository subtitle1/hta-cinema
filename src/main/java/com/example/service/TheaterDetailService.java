package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.dto.TheaterDto;
import com.example.mapper.FacilityMapper;
import com.example.mapper.MovieMapper;
import com.example.mapper.ShowScheduleMapper;
import com.example.mapper.ShowScheduleScreenMapper;
import com.example.mapper.TheaterMapper;
import com.example.mapper.TransportationMapper;

@Service
public class TheaterDetailService {
	
	@Autowired
	private TransportationMapper transportationMapper;
	@Autowired
	private FacilityMapper facilityMapper;
	@Autowired
	private ShowScheduleMapper showScheduleMapper;
	@Autowired
	private MovieMapper movieMapper;
	@Autowired
	private TheaterMapper theaterMapper;
	
	public TheaterDto getTheaterDto(int no) {
		
		TheaterDto theaterDto = new TheaterDto();
		theaterDto.setTransportationList(transportationMapper.getAllTransportationByNo(no));
		theaterDto.setFacilityList(facilityMapper.getAllFacilityByNo(no));
		theaterDto.setTheater(theaterMapper.getTheaterByNo(no)); 
		theaterDto.setShowScheduleList(showScheduleMapper.getAllScheduleByTheaterNo(no));
		/*
		List<Integer> allMovieNo = movieMapper.getAllMovieNo();
		for(int movieNo: allMovieNo) {
			showScheduleScreenMapper.ListByTheaterNo(theaterNo, movieNo);
		}
		 */
		
		return theaterDto;
	}
	
}
