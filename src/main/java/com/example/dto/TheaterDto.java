package com.example.dto;

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
	private int facilityTypeNo;
	private String facilityTypeName;
	private int screenNo;
	private int showScheduleNo;
	private String publicTransportationTypeName;
	private String theaterPublicTransportationContent;
}
