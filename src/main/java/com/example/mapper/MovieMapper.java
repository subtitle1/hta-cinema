package com.example.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.example.vo.Movie;

@Mapper
public interface MovieMapper {

	Movie getMovieLikeCount(int movieNo);
}
