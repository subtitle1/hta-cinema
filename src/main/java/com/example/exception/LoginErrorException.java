package com.example.exception;

public class LoginErrorException extends CustomException{

	private static final long serialVersionUID = -843452749540633107L;

	public LoginErrorException(String message) {
		super(message);
	}

}
