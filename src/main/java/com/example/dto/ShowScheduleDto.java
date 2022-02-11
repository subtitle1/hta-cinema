package com.example.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class ShowScheduleDto {

	private int totalSeat;	//상영관이랑 조인
	private String ratingName;//영화에 rating 조인
	private String movieName;//영화랑 조인
	private int ratingNo;
	private int timeNo;	//상영회차
	private long showScheduleNo;
	private int showTypeNo;
	private Date startTime;
	private Date endTime;
	private int screenNo;
	private int movieNo;
}
