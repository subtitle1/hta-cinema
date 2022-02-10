package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class CheckDto {

	private int movieNo;
	private String ticketCancelled;
	private long reviewNo;
}
