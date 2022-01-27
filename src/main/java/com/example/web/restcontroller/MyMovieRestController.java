package com.example.web.restcontroller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.ResponseDto;
import com.example.service.MyMovieService;
import com.example.vo.MyMovie;

@RestController
@RequestMapping("/rest")
public class MyMovieRestController {

	@Autowired
	private MyMovieService myMovieService;
	
	@PostMapping("/like")
	public ResponseDto<Map<String, Object>> like(int customerNo, int movieNo) {
		
		ResponseDto<Map<String, Object>> response = new ResponseDto<>();
		
		MyMovie liker = myMovieService.upLike(customerNo, movieNo);
		int likeCount = myMovieService.getLikeCount(movieNo);
		
		response.setStatus(true);
		response.setItems(Map.of("liker", liker, "likeCount", likeCount));
		
		return response;
	}
	
	@DeleteMapping("/like")
	public ResponseDto<Map<String, Object>> delete(int customerNo, int movieNo) {

		ResponseDto<Map<String, Object>> response = new ResponseDto<>();
		
		MyMovie liker = myMovieService.downLike(customerNo, movieNo);
		int likeCount = myMovieService.getLikeCount(movieNo);
		
		response.setStatus(true);
		response.setItems(Map.of("liker", liker, "likeCount", likeCount));
		
		return response;
	}
	
	@GetMapping("/myMovies") 
	public ResponseDto<List<MyMovie>> myMovies(int customerNo) {
		/*if (user == null) {
			throw new CartErrorException("장바구니 아이템 삭제는 로그인 후 사용가능합니다.");
		}*/
		ResponseDto<List<MyMovie>> response = new ResponseDto<>();
		List<MyMovie> movies = myMovieService.getMyMovies(customerNo);
		
		response.setStatus(true);
		response.setItems(movies);
		
		return response;
	}
}
