package com.example.dto;

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
public class MovieRatingDto {

	private int ratingNo;
	private String ratingName;
	private String ratingImageURL;
	private int movieNo;
	private String movieName;

}
