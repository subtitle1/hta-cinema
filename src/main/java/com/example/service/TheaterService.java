package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.LogManager;

import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.TheaterMapper;
import com.example.vo.Region;
import com.example.vo.Theater;


@Service
public class TheaterService {

	@Autowired
	private TheaterMapper theaterMapper;
	
	public Theater getTheaterDetail(int no){
		
		return theaterMapper.getTheaterByNo(no);
	}
	
	public Map<String, List<Theater>> getAllTheaters() {
		Map<String, List<Theater>> result = new HashMap<>();
		
		List<Region> regions = theaterMapper.getAllRegion();
		for(Region region: regions) {
			List<Theater> theaters = theaterMapper.getTheatersByRegion(region.no);
			result.put(region.name, theaters );
		}
		// 지역 테이블을 조회한다.
				// List<Region> 지역들 = 
				// for (Region region : 지역들) {
				//		지역번호 조회
				//		List<Theater> theaters = 지역번호의 극장들
				//		result.put(지역명, theaters)
				// }
		
		return result;
	}
	
	public List<Region> getAllRegion(){
		List<Region> regions = theaterMapper.getAllRegion();
		return regions;
	}
	
}
