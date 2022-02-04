package com.example.dto;

import java.sql.Date;

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
public class TheaterDto {
	private int theaterNo;
	private String theaterName;
	private int regionNo;
	private String theaterStreetAddress;
	private int theaterLongitude;
	private int theaterLatitude;
	
	private int theaterPublicTransportationNo;
	private int publicTransportationTypeNo;
	private String publicTransportationTypeName;
	private String theaterPublicTransportationContent;
	
	private int facilityTypeNo;
	private String facilityTypeName;
	
	private int MovieNo;
	private int screenNo;
	private int showScheduleNo;
	private int showTypeNo;
	private int showScheduleTimeNo;
	private Date showScheduleStartTime;
	private Date showScheduleEndTime;
	private String movieName;
	
	private int screenTotalSeat;
	
	
	
	
	//현재 좌석 어떻게 구하는지
		
	
}
