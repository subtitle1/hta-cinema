package com.example.mapper;

import java.util.List;

import com.example.dto.ScheduleDto;
import com.example.dto.ShowScheduleDto;

public interface ShowScheduleMapper {
	List<ScheduleDto> getAllScheduleByTheaterNo(int no);
	
	
}
