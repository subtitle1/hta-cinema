package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.exception.LoginErrorException;
import com.example.mapper.CustomerMapper;
import com.example.vo.Customer;

@Service
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	
	public Customer login(String id, String password) {
		Customer customer = customerMapper.getCustomerById(id);
		
		if (customer == null || !password.equals(customer.getPassword())) {
			throw new LoginErrorException("아이디 또는 비밀번호가 맞지 않습니다.\n"
					+ "로그인 정보를 다시 확인바랍니다.");
		}
		if ("Y".equals(customer.getDeleted())) {
			throw new LoginErrorException("탈퇴 처리된 회원입니다.");
		}
		
		return customer;
	}
}
