package com.example.argumentresolver;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.example.annotation.LoginedUser;
import com.example.utils.SessionUtils;


public class LoginedUserArgumentResolver implements HandlerMethodArgumentResolver {

	static final Logger logger = LogManager.getLogger(LoginedUserArgumentResolver.class);
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.hasParameterAnnotation(LoginedUser.class);
	}

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		return SessionUtils.getAttribute("LOGIN_USER");
	}

}
