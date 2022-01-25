package com.example.web.restController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.ResponseDto;
import com.example.dto.ReviewDto;
import com.example.pagination.Pagination;
import com.example.service.ReviewService;
import com.example.web.form.Criteria;

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
		
		response.setStatus(true);
		response.setItems(Map.of("pagination", pagination, "reviews", reviews));
		
		return response;
	}
}
