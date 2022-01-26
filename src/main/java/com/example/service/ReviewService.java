package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dto.ReviewDto;
import com.example.mapper.ReviewMapper;
import com.example.vo.Review;
import com.example.vo.ReviewPoint;
import com.example.vo.ReviewPointType;
import com.example.web.form.Criteria;

@Service
@Transactional
public class ReviewService {
	
	static final Logger logger = LogManager.getLogger(ReviewService.class);

	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<ReviewPointType> getAllPointTypes() {
		return reviewMapper.getAllPointTypes();
	}
	
	// todo 레스트 형식으로 바꾸기
	public Review addReview(Review review, List<ReviewPoint> pointTypes) {
		reviewMapper.insertReview(review);
		
		for (ReviewPoint point : pointTypes) {
			point.setNo(review.getNo());
			point.setReviewPointNo(point.getReviewPointNo());
			reviewMapper.insertReviewPoint(point);
		}
		
		return reviewMapper.getReviewByNo(review.getNo());
	}
	
	public int getTotalRecords(int movieNo) {
		return reviewMapper.getTotalReviewsByMovieNo(movieNo);
	}
	
	public List<ReviewDto> getAllReviewsByMovie(Criteria criteria) {
		
		List<ReviewDto> reviews = reviewMapper.getAllReviewsByMovieNo(criteria);
		
		for (ReviewDto review: reviews) {
			List<ReviewPointType> pointTypes = reviewMapper.getPointNamesByReviewNo(review.getReviewNo());
			List<ReviewPointType> points = new ArrayList<>();
			
			for (ReviewPointType point : pointTypes) {
				points.add(point);
			}
			
			review.setReviewPoints(points);
		}
		return reviews;
	}
}
