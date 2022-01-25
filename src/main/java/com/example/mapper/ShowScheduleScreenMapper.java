package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.dto.ShowScheduleScreen;

public interface ShowScheduleScreenMapper {

	public List<ShowScheduleScreen> AllListByMovie(int movieNo);
	public int CountRegionByNo(int regionNo);
	public List<ShowScheduleScreen> ListByTheaterNo(@Param("movieNo") int movieNo ,@Param("theaterNo") int theaterNo);
	public List<ShowScheduleScreen> ListBySpectialNo(@Param("movieNo")int movieNo,@Param("specialNo") int spectialNo);
}
