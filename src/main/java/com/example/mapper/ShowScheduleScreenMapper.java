package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.dto.ShowScheduleScreenDto;
import com.example.vo.Region;
import com.example.vo.SpecialScreen;

@Mapper
public interface ShowScheduleScreenMapper {

	public List<ShowScheduleScreenDto> AllListByMovie(int movieNo);
	public int CountRegionByNo(int regionNo);
	public List<ShowScheduleScreenDto> ListByTheaterNo(@Param("movieNo") int movieNo ,@Param("theaterNo") int theaterNo);
}
