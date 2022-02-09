package com.example.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Builder
public class Theater {

	private int no;
	private String name;
	private String streetAddress;
	private double longitude;
	private double latitude;
	private int regionNo;

	
	
	
}
