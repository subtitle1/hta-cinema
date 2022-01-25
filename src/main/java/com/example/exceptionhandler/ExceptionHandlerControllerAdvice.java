package com.example.exceptionhandler;

import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.ResponseDto;
import com.example.exception.CustomException;
import com.example.exception.LoginErrorException;
import com.example.exception.MovieTicketingErrorException;

@ControllerAdvice
public class ExceptionHandlerControllerAdvice {

	@ExceptionHandler(CustomException.class)
	public String handlerCustomException(CustomException e) {
		return "error/customError";
	}
	@ExceptionHandler(DataAccessException.class)
	public String handlerDataAccessException(DataAccessException e) {
		return "error/databaseError";
	}
	@ExceptionHandler(Exception.class)
	public String handlerException(Exception e) {
		return "error/serverError";
	}
	
	@ExceptionHandler(MovieTicketingErrorException.class)
	public @ResponseBody ResponseDto<?> handlerMovieException(MovieTicketingErrorException e) {
		e.printStackTrace();
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus(false);
		response.setError(e.getMessage());
		return response;
	}
	@ExceptionHandler(LoginErrorException.class)
	public String handlerLoginException(LoginErrorException e, Model model) { 
		e.printStackTrace();
		model.addAttribute("error", e.getMessage());
		return "loginForm";//나중에 loginForm에 연결한다. 
	}
}
