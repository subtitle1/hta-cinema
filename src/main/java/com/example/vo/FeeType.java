package com.example.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class FeeType {

	private int showTypeNo;
	private int showDayTypeNo;
	private String showStartTypeNo;
	private int audienceTypeNo;
	private int fee;
	
}
