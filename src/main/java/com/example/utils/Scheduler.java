package com.example.utils;

import java.time.LocalDateTime;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;

import com.example.mapper.DeletedMapper;
import com.example.service.DeletedService;
import com.example.web.form.TicketNoForm;

@Component
public class Scheduler {

	@Autowired
	private DeletedService deleteService;
	//지우는 mapper가 들어있는 service 우선 구현을 만들었다.
	
	@Scheduled(fixedDelay = 3000)
	public void deletedService() {
		
	}
}
