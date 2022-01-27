package com.example.web.form;

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
public class ScreenListInsertForm {

	private String ticketingDay;//날짜와 글자
	private int movieNo;//영화 번호 
	private String day;//요일
	private int theaterNo;//극장 번호 
	private int time;//시간
	private int ratingNo;
	private int screenNo;
	private int regionNo;
	private int showTypeNo;
}
