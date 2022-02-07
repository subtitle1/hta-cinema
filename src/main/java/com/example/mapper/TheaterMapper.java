package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.TheaterDto;
import com.example.vo.Region;
import com.example.vo.Theater;

@Mapper
public interface TheaterMapper {
	
	List<Theater> getAllTheaters();
	Theater getTheaterByNo(int no);
	List<Theater> getTheatersByRegion(int regionNo);
	List<Region> getAllRegion();
	TheaterDto getTheaterDetail(int no);
	
	
}
