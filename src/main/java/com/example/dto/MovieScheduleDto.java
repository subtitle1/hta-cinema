package com.example.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MovieScheduleDto {

	private int movieRatingNo;
	private String movieRatingName;
	private String movieRatingImageUrl;
	private int movieNo;
	private String movieName;
	private int showTypeNo;
	private String showTypeName;
	private char showTypeSubtotle;//자막유무
	private int showScheduleNo;
	private int screenNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd E요일 HH:MM:ss")
	private Date showScheDuleStartTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd E요일 HH:MM:ss")
	private Date showScheDuleEndTime;
	private int showScheDuleTimeNo;//상영회차
}
