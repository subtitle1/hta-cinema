package com.example.mapper;

import java.util.Date;
import java.util.List;

import com.example.vo.AudienceType;
import com.example.vo.FeeType;
import com.example.vo.ShowDayType;
import com.example.vo.ShowStartTimeType;

public interface ShowFormMapper {

	public ShowStartTimeType getStartTimeType(int starTime);
	public void insertStartTimType(Date startTime);
	public ShowDayType getShowDayType(int no);
	public List<AudienceType> getAudienceType(int no);
	public void insertFeeType(FeeType fee);
	public List<FeeType>getFeeType(int no);
	
}
