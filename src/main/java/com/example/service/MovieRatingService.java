package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dto.MovieRatingDto;
import com.example.dto.MovieScheduleDto;
import com.example.exception.MovieTicketingErrorException;
import com.example.mapper.MovieRatingMapper;
import com.example.mapper.ShowFormMapper;
import com.example.vo.AudienceType;
import com.example.vo.FeeType;
import com.example.vo.ShowDayType;
import com.example.vo.ShowStartTimeType;
import com.example.web.form.ScreenListInsertForm;

@Service
@Transactional
public class MovieRatingService {

	@Autowired
	private MovieRatingMapper movieRatingDto;
	@Autowired
	private ShowFormMapper showDto;
	
	public List<MovieRatingDto> getAllList(){
		return movieRatingDto.getAllList();
	}
	public MovieRatingDto getListByMovieNo(int movieNo) {
		return movieRatingDto.getAllListByMovieNo(movieNo);
	}
	public ShowStartTimeType getStartTimeType(String starTime) {
		return showDto.getStartTimeType(starTime);
	}
	public ShowDayType getShowDayType(String name) {
		return showDto.getShowDayType(name);
	}
	public List<AudienceType> getAudienceType(int no){
		return showDto.getAudienceType(no);
	}
	public List<FeeType> getFeeType(ScreenListInsertForm form){
		return showDto.getFeeType(form);
	}
	public MovieScheduleDto getScheduleList(ScreenListInsertForm form) {
		MovieScheduleDto movies = showDto.getScheduleList(form);
		if(movies == null) {
			throw new MovieTicketingErrorException("해당하는 영화가 존재하지 않습니다.");
		} else {
			return movies;
		}
	}

}
