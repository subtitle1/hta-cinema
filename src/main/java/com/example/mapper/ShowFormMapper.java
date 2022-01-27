package com.example.mapper;

import java.util.Date;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.dto.MovieScheduleDto;
import com.example.vo.AudienceType;
import com.example.vo.FeeType;
import com.example.vo.ShowDayType;
import com.example.vo.ShowSchedule;
import com.example.vo.ShowStartTimeType;
import com.example.web.form.ScreenListInsertForm;

public interface ShowFormMapper {

	public ShowStartTimeType getStartTimeType(String starTime);
	public ShowDayType getShowDayType(String name);
	public List<AudienceType> getAudienceType(int no);
	public List<FeeType> getFeeType(ScreenListInsertForm form);
	public MovieScheduleDto getScheduleList(ScreenListInsertForm form);
	
}
