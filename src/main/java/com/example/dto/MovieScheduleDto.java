package com.example.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class MovieScheduleDto {

	private int movieRatingNo;
	private String movieRatingName;
	private String movieRatingImageUrl;
	private int movieNo;
	private String movieName;
	private int movieTicketSalesRate;
	private long movieTotalLike;
	private int showDayTypeNo;
	private String showDayTypeName;
	private int showStartTimeTypeNo;
	private String showStartTimeTypeName;
	private Date showStartTimeTypeTime;
	private long showScheduleNo;
	private int screenNo;
	private int showTypeNo;
	private Date showScheduleStartTime;
	private Date showScheduleEndTime;
	private int showScheduleTimeNo;
	private String showTypeSubtiltle;
	private String showTypeName;
	private int audienceTypeNo;
	private long fee;
}
