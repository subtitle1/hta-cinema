package com.example.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ShowScheduleScreen {

	private int movieNo;
	private int theaterNo;
	private int screenNo;
	private String screenName;
	private int screenTotalSeat;
	private int regionNo;
	private String regionName;
	private String theaterName;
	private int specialScreenNo;
	private long showScheduleNo;
	private String specialScreenName;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="HH:mm:ss", timezone="Asia/Seoul")
	private Date showScheduleStartTime;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="HH:mm:ss", timezone="Asia/Seoul")
	private Date showScheduleEndTime;
	private int movieRatingNo;
	private String movieRatingName;
	private String movieName;
	private int showTypeNo;
	private String showTypeName;
	private String showTypeSubTitle;
	
}
