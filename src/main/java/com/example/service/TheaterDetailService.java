package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.example.vo.Theater;

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
		Map<String, List<Theater>> map = new HashMap<String, List<Theater>>();
		
		map.put("seoul", theaterMapper.getTheatersByRegion(10));
		map.put("kyungki", theaterMapper.getTheatersByRegion(11));
		map.put("incheon", theaterMapper.getTheatersByRegion(12));
		map.put("daejeon", theaterMapper.getTheatersByRegion(13));
		map.put("busan", theaterMapper.getTheatersByRegion(14));
		map.put("kwangju", theaterMapper.getTheatersByRegion(15));
		map.put("kangwon", theaterMapper.getTheatersByRegion(16));
		
		
		theaterDto.setTheaterList(map);
		theaterDto.setTheater(theaterMapper.getTheaterByNo(no));
		theaterDto.setTransportationList(transportationMapper.getAllTransportationByNo(no));
		theaterDto.setFacilityList(facilityMapper.getAllFacilityByNo(no));
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
