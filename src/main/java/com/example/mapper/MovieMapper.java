package com.example.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieMapper {

	int getMovieLikeCount(int movieNo);
}
