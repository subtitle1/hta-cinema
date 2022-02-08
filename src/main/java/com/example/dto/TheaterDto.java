package com.example.dto;

import java.sql.Date;
import java.util.List;

import com.example.vo.ShowSchedule;
import com.example.vo.Theater;

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
	private Theater theater;
	
	private List<TheaterTransportationDto> transportationList;
	
	private List<TheaterFacilityDto> facilityList;
	
	private List<ShowScheduleDto> showScheduleList;
	private String movieName;
}
