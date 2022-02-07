package com.example.dto;

import java.sql.Date;
import java.util.List;

import com.example.vo.ShowSchedule;

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
	private int no;
	private String name;
	private String streetAddress;
	private int longitude;
	private int latitude;
	private int regionNo;
	
	private List<TheaterTransportationDto> transportationList;
	
	private List<TheaterFacilityDto> facilityList;
	
	private List<ShowSchedule> showScheduleList;
	private String movieName;
}
