package com.example.dto;

import java.util.List;

import com.example.vo.ReviewPoint;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto {

	private String customerId;
	private int reviewScore;
	private List<ReviewPoint> reviewPoints;
	private String reviewContent;
	
}
