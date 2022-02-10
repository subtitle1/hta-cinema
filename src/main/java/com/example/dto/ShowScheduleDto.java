package com.example.dto;

import java.util.Date;

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

	private long no;
	private int screenNo;
	private int movieNo;
	private int showTypeNo;
	private Date startTime;
	private Date endTime;
	private int timeNo;
	private String movieName;
}
