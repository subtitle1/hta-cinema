package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.vo.QnaType;

@Mapper
public interface QnaMapper {

	List<QnaType> getAllCategories();
}
