package com.example.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
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
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date showScheduleStartTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date showScheduleEndTime;
	
}
