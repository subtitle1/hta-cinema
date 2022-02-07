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
public class TheaterTransportationDto {

	private int theaterPublicTransportationNo;
	private int publicTransportationTypeNo;
	private String publicTransportationTypeName;
	private String theaterPublicTransportationContent;
}
