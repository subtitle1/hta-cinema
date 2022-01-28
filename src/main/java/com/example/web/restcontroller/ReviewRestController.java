package com.example.web.restcontroller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.annotation.LoginedUser;
import com.example.dto.ResponseDto;
import com.example.dto.ReviewDto;
import com.example.exception.LoginErrorException;
import com.example.pagination.Pagination;
import com.example.service.ReviewService;
import com.example.vo.Customer;
import com.example.vo.Review;
import com.example.vo.ReviewPoint;
import com.example.web.form.Criteria;
import com.example.web.form.ReviewInsertForm;

import lombok.extern.slf4j.Slf4j;
			
@Slf4j
@RestController
@RequestMapping("/rest")
public class ReviewRestController {
			
	@Autowired
	private ReviewService reviewService;
				
	@GetMapping("/review")
	public ResponseDto<Map<String, Object>> reviews(Criteria criteria) {
		if (criteria.getPage() < 1) {
			criteria.setPage(1);
		}
				
		int totalRecords = reviewService.getTotalRecords(criteria.getMovieNo());
		Pagination pagination = new Pagination(criteria.getPage(), totalRecords);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		ResponseDto<Map<String, Object>> response = new ResponseDto<>();
		List<ReviewDto> reviews = reviewService.getAllReviewsByMovie(criteria);
		int totalReviews = reviewService.getAllReviewsByMovie(criteria).size();
		
		response.setStatus(true);
		response.setItems(Map.of("pagination", pagination, "reviews", reviews, "totalReviews", totalReviews));
		
		return response;
	}
	
	@PostMapping("/review")
	public ResponseDto<Map<String, Object>> save(@LoginedUser Customer customer, ReviewInsertForm form) {
		
		if (customer == null) {
			throw new LoginErrorException("로그인이 필요한 서비스입니다.");
		}
		
		log.info(customer.toString());
		
		ResponseDto<Map<String, Object>> response = new ResponseDto<>();
		Review review = Review.builder()
				.movieNo(form.getMovieNo())
				.customerNo(customer.getNo())
				.reviewScore(form.getReviewScore())
				.reviewContent(form.getContent())
				.build();
		
		log.info(review.toString());
		
		List<ReviewPoint> reviewPoints = new ArrayList<>();
		List<Integer> pointNo = form.getPointNo();
		
		for (Integer point : pointNo) {
			ReviewPoint reviewPoint = new ReviewPoint();
			reviewPoint.setNo(review.getNo());
			reviewPoint.setReviewPointNo(point);
			
			reviewPoints.add(reviewPoint);
		}
		
		Review savedReview = reviewService.addReview(review, reviewPoints);
		
		response.setStatus(true);
		response.setItems(Map.of("review", savedReview, "points", reviewPoints));
		
		return response;
	}
	
	//ㅇㅇㅇㅇㅇㅇㅇㅇ
	@GetMapping("/myReview")
	public Review myMovie(@LoginedUser Customer customer, int movieNo) {
		
		Review review = reviewService.getMyReviewByMovieNo(customer.getNo(), movieNo);
		return review;
	}
}
