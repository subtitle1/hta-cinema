package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.DeletedMapper;

@Service
public class DeletedService {

	@Autowired
	private DeletedMapper deletedDto;
	
}
