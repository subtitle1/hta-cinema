package com.example.utils;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.service.DeletedService;

@Component
public class Scheduler {
	
	@Autowired
	private DeletedService deleteDto;
	//지우는 mapper가 들어있는 service 우선 구현을 만들었다.
	
	@Scheduled(cron = "0 */2 * * * *") //2분마다 실행될 스케쥴러이다. 
	public void deletTicket() {
		
	}

}
