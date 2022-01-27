package com.example.web.form;

import java.util.Date;

import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ScreenListInsertForm {

	private String ticketingDay;//날짜와 글자
	private int movieNo;//영화 번호 
	private String day;//요일
	private int theaterNo;//극장 번호 
	private String time;//시간
	private int ratingNo;
	private int screenNo;
	private int regionNo;
	private int showTypeNo;
	private int dayNo;//요일 번호 
	
	public void setTicketingDay(String ticketingDay, String day) {
		String result = ticketingDay.substring(ticketingDay.length() -1, ticketingDay.length());
		String result1 = ticketingDay.substring(0,ticketingDay.length()-1);
		this.day = result;
		this.ticketingDay = result1;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setRatingNo(int ratingNo) {
		this.ratingNo = ratingNo;
	}
	public void setScreenNo(int screenNo) {
		this.screenNo = screenNo;
	}
	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}
	public void setShowTypeNo(int showTypeNo) {
		this.showTypeNo = showTypeNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}
}
