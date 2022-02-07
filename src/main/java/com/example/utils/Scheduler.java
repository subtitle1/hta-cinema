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
	private ThreadPoolTaskScheduler scheduler;
	@Autowired
	private DeletedService deleteService;
	//지우는 mapper가 들어있는 service 우선 구현을 만들었다.
	private String cron = "0 */2 * * * *"; //2분마다 실행될 스케쥴러이다. 
	
	public void startScheduler() {
		scheduler = new ThreadPoolTaskScheduler();
		scheduler.initialize();
		//스케쥴러 셋팅
		scheduler.schedule(getRunnable(), getTrigger());
	}
	
	public String deletedDto(TicketNoForm form) {
		deleteService.deletedDto(form);
		return "실행시간이 지났습니다. 다시 예약바랍니다.";
	}
	public void stopScheduler() {
		scheduler.shutdown();
	}
	private Runnable getRunnable() {
		return () -> {
			System.out.println(LocalDateTime.now().toString());
			//현재시간에 대해서 sysout 하는 메소드
		};
	}
	
	private Trigger getTrigger() {
		//cron setting 
		return new CronTrigger(cron);
	}
	
	//실행되기전 초기화하는 어노테이션 
	@PostConstruct
	public void init() {
		startScheduler();
	}
	//소멸되는 어노테이션
	@PreDestroy
	public void destroy() {
		stopScheduler();
	}

}
