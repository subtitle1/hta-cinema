package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.CustomerCriteria;
import com.example.exception.ErrorException;
import com.example.mapper.CustomerMapper;
import com.example.vo.Customer;

@Service
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	
	public Customer login(String id, String password) {
		Customer customer = customerMapper.getCustomerById(id);
		
		if (customer == null || !password.equals(customer.getPassword())) {
			throw new ErrorException("아이디 또는 비밀번호가 맞지 않습니다.<br>"
					+ "로그인 정보를 다시 확인바랍니다.");
		}
		if ("Y".equals(customer.getDeleted())) {
			throw new ErrorException("탈퇴 처리된 회원입니다.");
		}
		
		return customer;
	}
	
	public Customer findIdPassword(CustomerCriteria criteria) {
		Customer customer = customerMapper.getCustomerByCriteria(criteria);
		
		if (customer == null) {
			 throw new ErrorException("해당정보로 가입된 사용자를 찾을 수 없습니다.<br>"
			 		+ "<br>"
			 		+ "탈퇴여부 및 재가입 가능한 일자를 확인하고 싶으시면 본인인증을 통하여 확인 가능합니다.");
		}
		
		return customer;
	}
	
	public void updatePassword(String id, String password) {
		Customer customer = customerMapper.getCustomerById(id);
		
		if (customer == null) {
			throw new ErrorException("해당정보로 가입된 사용자를 찾을 수 없습니다.");
		}
		customer.setPassword(password);
		customerMapper.updateCustomer(customer);
	}
}
