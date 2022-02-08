package com.example.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShowScheduleDto {

	private long no;
	private int screenNo;
	private int movieNo;
	private int showTypeNo;
	private Date startTime;
	private Date endTime;
	private int timeNo;
	private String movieName;
}
