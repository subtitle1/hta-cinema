package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mapper.QnaMapper;
import com.example.vo.QnaType;

@Transactional
@Service
public class QnaService {
	
	@Autowired
	private QnaMapper qnaMapper;
	
	public List<QnaType> getAllCategories() {
		return qnaMapper.getAllCategories();
	}
}
