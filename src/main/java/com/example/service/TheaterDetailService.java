package com.example.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.dto.ScheduleDto;
import com.example.dto.ScreenDto;
import com.example.dto.ShowDto;
import com.example.dto.ShowScheduleDto;
import com.example.dto.TheaterDto;
import com.example.mapper.FacilityMapper;
import com.example.mapper.MovieMapper;
import com.example.mapper.ScheduleMapper;
import com.example.mapper.ScreenScheduleMapper;
import com.example.mapper.ShowScheduleMapper;
import com.example.mapper.ShowScheduleScreenMapper;
import com.example.mapper.TheaterMapper;
import com.example.mapper.TransportationMapper;
import com.example.vo.Movie;
import com.example.vo.Theater;

import lombok.Builder;

@Service
public class TheaterDetailService {
	
	@Autowired
	private TransportationMapper transportationMapper;
	@Autowired
	private FacilityMapper facilityMapper;
	@Autowired
	private MovieMapper movieMapper;
	@Autowired
	private TheaterMapper theaterMapper;
	@Autowired
	private ShowScheduleMapper showScheduleMapper;
	@Autowired
	private ScheduleMapper scheduleMapper;
	@Autowired
	private ScreenScheduleMapper screenScheduleMapper;

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
		
		List<ShowScheduleDto> showScheduleList = new ArrayList<ShowScheduleDto>();
		List<ShowDto> showDto = showScheduleMapper.getAllScheduleByTheaterNo(no);
		//List<ScreenDto> dto = new ArrayList<ScreenDto>();
		
		for(ShowDto movie: showDto) {
			
			ShowScheduleDto showScheduleDto = new ShowScheduleDto();
			//List<ScreenDto> dto = new ArrayList<ScreenDto>();

			List<ScreenDto> screenList = screenScheduleMapper.getAllScreenByTheaterNo(no, movie.getMovieNo());
			
			showScheduleDto.setScreenList(screenList);
			showScheduleDto.setShowDto(movie);
			for(ScreenDto screen: screenList) {
				ScreenDto screenDto = new ScreenDto();
				screenDto.setScheduleList(scheduleMapper.getAllScheduleByTheaterNo(no, movie.getMovieNo(), screen.getScreenNo()));
				//dto.add(screenDto);
			}
			//showScheduleDto.setScreenList(dto);
			showScheduleDto.setScreenList(screenList);
			showScheduleList.add(showScheduleDto);
		}
		theaterDto.setShowScheduleList(showScheduleList);
		return theaterDto;
	}
	
}
