package com.example.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.dto.ScreenDto;

public interface ScreenMapper {
	public List<ScreenDto> getAllScreenByTheaterNo(@Param("theaterNo") int theaterNo, @Param("movieNo") int movieNo, @Param("startTime") Date startTime);  
}
