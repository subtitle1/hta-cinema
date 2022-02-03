package com.example.web.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.CustomerCriteria;
import com.example.dto.ResponseDto;
import com.example.service.CustomerService;
import com.example.vo.Customer;

@RestController
public class CustomerRestController {
	@Autowired
	CustomerService customerService;
	
	@PostMapping("/customer/findIdPassword")
	public ResponseDto<Customer> findIdPassword(CustomerCriteria criteria) {
		ResponseDto<Customer> response = new ResponseDto<Customer>();
		
		Customer customer = customerService.findIdPassword(criteria);
		
		if ("id".equals(criteria.getFind())) {
			String id = customer.getId();
			String partiallyEncryptedId = id.substring(0, id.length() - 2) + "**";
			
			Customer customerToSend = Customer.builder()
					.id(partiallyEncryptedId)
					.createdDate(customer.getCreatedDate())
					.build();
			
			response.setStatus(true);
			response.setItems(customerToSend);
			
			return response;
		}
		response.setStatus(true);
		
		return response;
	}
}
