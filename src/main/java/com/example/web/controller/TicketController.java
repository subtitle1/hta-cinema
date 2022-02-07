package com.example.web.controller;

import java.text.DateFormat;



import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.example.dto.MovieRatingDto;
import com.example.dto.MovieScheduleDto;
import com.example.dto.ResponseDto;
import com.example.dto.ShowScheduleScreenDto;
import com.example.exception.CustomException;
import com.example.service.MovieRatingService;
import com.example.service.MovieTicketService;
import com.example.service.TicketingServiece;
import com.example.utils.Scheduler;
import com.example.utils.SessionUtils;
import com.example.vo.AudienceType;
import com.example.vo.Customer;
import com.example.vo.FeeType;
import com.example.vo.NonExistentSeat;
import com.example.vo.Region;
import com.example.vo.Screen;
import com.example.vo.ShowDayType;
import com.example.vo.ShowSchedule;
import com.example.vo.ShowStartTimeType;
import com.example.vo.ShowType;
import com.example.vo.Theater;
import com.example.vo.Ticket;
import com.example.vo.TicketAudience;
import com.example.vo.TicketSeat;
import com.example.web.form.InsertTicketForm;
import com.example.web.form.ScreenListInsertForm;
import com.example.web.form.ScreenListInsertForm.ScreenListInsertFormBuilder;
import com.example.web.form.TicketForm;
import com.example.web.form.TicketNoForm;
import com.example.web.form.TicketingForm;
import com.example.web.form.TicketingPayForm;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Builder;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Transactional
public class TicketController {

	@Autowired
	private MovieRatingService movieRatingService;
	@Autowired
	private MovieTicketService movieTicketService;
	@Autowired
	private TicketingServiece ticketService;
	@Autowired
	private Scheduler scheduler;
	//스케쥴러를 Autowired한다.
	
	
	@GetMapping("/ticketing/screenList")
	public String screenList(Model model) {
		List<MovieRatingDto> movies = movieRatingService.getAllList();
		List<Region> regions = movieTicketService.listByRegion();
		int number = 0;
		for(Region rs : regions) {
			number = rs.no;
		}
		int countRegion = movieTicketService.CountRegionByNo(number);
		log.info(movies.toString());
		model.addAttribute("movies", movies);
		model.addAttribute("regions", regions);
		model.addAttribute("countRegion", countRegion);
		log.info(model.toString());
		return "/ticketing/screenList";
	}
	
	@GetMapping("/ticketing/ticketingList")
	public String ticketingList(@ModelAttribute("TicketForm") String forms, Model model) throws JsonMappingException, JsonProcessingException {
		//좌석꺼내기, 영화꺼내기 그리고 모델에 담기 
		ObjectMapper mapper = new ObjectMapper();
		TicketForm ticket = mapper.readValue(forms, TicketForm.class);
		ScreenListInsertForm form = ScreenListInsertForm.builder().screenNo(ticket.getScreenNo())
				.movieNo(ticket.getMovieNo()).showTypeNo(ticket.getShowTypeNo()).theaterNo(ticket.getTheaterNo()).dayNo(ticket.getShowDayTypeNo())
				.day(ticket.getDay()).time(ticket.getShowTime()).build();
			MovieScheduleDto screens = movieRatingService.getScheduleList(form);
		MovieRatingDto movieRated = movieRatingService.getListByMovieNo(form.getMovieNo());//영화 번호로 관람에 대해서 조회
		ShowDayType days = movieRatingService.getShowDayType(form.getDay());	//일자 조회
		List<AudienceType> audience = movieRatingService.getAudienceType(movieRated.getRatingNo());//관람자 조회
		ShowType showType = movieRatingService.getShowTypeByNo(form.getShowTypeNo());
		Screen realySeat = movieRatingService.getScreenByNo(form.getScreenNo(), form.getTheaterNo());
		List<NonExistentSeat> emptySeat = movieRatingService.getNonExistentSeat(form.getScreenNo());//빈좌석 조회
		//티켓조회 후 예약된 좌석 출력하기
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		Date time = new Date();
		String year = format.format(time);
		String month = ticket.getTicketingDay().substring(0, ticket.getTicketingDay().length()-2);
		String day = ticket.getTicketingDay().substring(ticket.getTicketingDay().length()-2, ticket.getTicketingDay().length());
		String totalDay = year+"-"+month+"-"+day;
		TicketNoForm ticketForm = TicketNoForm.builder().movieNo(ticket.getMovieNo()).showScheduleNo(screens.getShowScheDuleNo()).build();
		List<TicketSeat> findTicketSeat = movieRatingService.getTicketNoByScheduleNo(ticketForm);
		
		model.addAttribute("screens", screens);
		model.addAttribute("ratied", movieRated);
		model.addAttribute("emptySeat", emptySeat);//빈좌석
		model.addAttribute("realySeat", realySeat); //현재좌석
		model.addAttribute("day", days);
		model.addAttribute("audience", audience);
		model.addAttribute("showType", showType);
		model.addAttribute("ticketingDay",totalDay); //일자
		model.addAttribute("noEamptySeat",findTicketSeat); //예약된 좌석
		
		log.info("movieRated"+movieRated);
		log.info("emptySeat 비어있는좌석"+emptySeat);
		log.info("realySeat 남아있는좌석"+realySeat);
		log.info("noEamptySeat 예약좌석"+findTicketSeat);
		log.info("days"+days);
		log.info("audience"+audience);
		log.info("screens"+screens);
		log.info("showType"+showType);
		log.info("ticketingDay"+totalDay);
		return "/ticketing/ticketingList";
	}
	
	@PostMapping("/ticketing/ticketingList")
	public String postTicketingList(ScreenListInsertForm form, RedirectAttributes redirect) throws JsonProcessingException {
		String result = form.getDay().substring(form.getDay().length()-1, form.getDay().length());
		String result1 = form.getDay().substring(form.getDay().length()-5, form.getDay().length()-1);
		form.setDay(result);
		form.setTicketingDay(result1);
		ShowDayType day = movieRatingService.getShowDayType(form.getDay());
		ScreenListInsertForm save = ScreenListInsertForm.builder().movieNo(form.getMovieNo()).day(form.getDay()).ratingNo(form.getRatingNo())
		.regionNo(form.getRegionNo()).screenNo(form.getScreenNo()).showTypeNo(form.getShowTypeNo())
		.theaterNo(form.getTheaterNo()).ticketingDay(form.getTicketingDay()).time(form.getTime()).dayNo(day.getNo()).build();
		MovieScheduleDto movieSchedul = movieRatingService.getScheduleList(save);
		DateFormat dateFormat = new SimpleDateFormat("HH");
		String showTime = dateFormat.format(movieSchedul.getShowScheduleStartTime());
		TicketForm forms = new TicketForm();
		forms.setShowDayTypeNo(form.getDayNo());
		forms.setTheaterNo(save.getTheaterNo());
		forms.setMovieNo(save.getMovieNo());
		forms.setScreenNo(save.getScreenNo());
		forms.setShowTypeNo(save.getShowTypeNo());
		forms.setShowTime(showTime);
		forms.setDay(save.getDay());
		log.info(result);
		log.info(result1);
		log.info("보낸일자"+result1);
		forms.setTicketingDay(result1);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(forms);
		redirect.addAttribute("TicketForm",jsonStr);
		return "redirect:/ticketing/ticketingList";
	}

	@GetMapping("/ticketing/ticketingPay")
	public String ticketingPay(@ModelAttribute(value="formByPay") String jsonForm, Model model) throws JsonMappingException, JsonProcessingException,Exception {
	
		ObjectMapper mapper = new ObjectMapper();
		TicketingPayForm form = mapper.readValue(jsonForm, TicketingPayForm.class);
		TicketingPayForm forms = TicketingPayForm.builder().screenNo(form.getScreenNo()).feeByForm(form.getFeeByForm())
				.findTicketByForm(form.getFindTicketByForm()).seatsKindByForm(form.getSeatsKindByForm()).showDayByForm(form.getShowDayByForm())
				.startTimesByForm(form.getStartTimesByForm()).movieNo(form.getMovieNo()).audult(form.getAudult()).baby(form.getBaby()).old(form.getOld()).
				audultTotal(form.getAudultTotal()).babyTotal(form.getBabyTotal()).oldTotal(form.getOldTotal()).build();
		log.info("넘어온 파일" + forms);
		Customer customer = (Customer)SessionUtils.getAttribute("LOGIN_USER");
		if(customer == null) {
			throw new CustomException("잘못된 요청입니다.");
		}
		Screen screen = ticketService.getScreenByNo(forms.getScreenNo());
		Theater theater = ticketService.getTheaterByNo(screen.getTheaterNo());
		MovieRatingDto movieRating = movieRatingService.getListByMovieNo(forms.getMovieNo());
		model.addAttribute("fee", form.getFeeByForm());
		model.addAttribute("movie", movieRating);
		model.addAttribute("showTime", form.getShowDayByForm());
		model.addAttribute("startTime", form.getStartTimesByForm());
		model.addAttribute("ticket", form.getFindTicketByForm());
		model.addAttribute("adienceType", form.getAudiencesByForm());
		model.addAttribute("ticketAudience", form.getTicketAudienceKindByForm());
		model.addAttribute("ticketSeat", form.getSeatsKindByForm());
		model.addAttribute("screen", screen);
		model.addAttribute("theater", theater);
		if(form.getAudult() != null) {
			model.addAttribute("audult", form.getAudult()+form.getAudultTotal());
		}
		if(form.getBaby() != null) {
			model.addAttribute("baby", form.getBaby()+form.getBabyTotal());
		}
		if(form.getOld() != null) {
			model.addAttribute("old", form.getOld()+form.getOldTotal());
		}
		
		log.info("관람인원"+ form.getFeeByForm());
		log.info("point"+customer.getCurrentPoint());
		log.info("영화" +movieRating);
		log.info("영화일자" +form.getShowDayByForm());
		log.info("시작시간"+form.getStartTimesByForm());
		log.info("티켓"+form.getFindTicketByForm());
		log.info("관람인원타입"+form.getAudiencesByForm());
		log.info("티켓구매타입"+form.getTicketAudienceKindByForm());
		log.info("사용될 좌석"+form.getSeatsKindByForm());
		log.info("상영관정보"+screen);
		log.info("극장정보"+theater);
		log.info("성인"+form.getAudult()+form.getAudultTotal());
		log.info("청소년"+form.getBaby()+form.getBabyTotal());
		log.info("노인"+form.getOld()+form.getOldTotal());
		//scheduler.startScheduler();//스케쥴러 시작
		//List<String> seats = new ArrayList<>();
		//for(TicketSeat seat : form.getSeatsKindByForm()) {
		//	seats.add(seat.getNo());
		//}
		//int number = Integer.parseInt(form.getAudultTotal()) +  Integer.parseInt(form.getBabyTotal()) + Integer.parseInt(form.getOldTotal());
		//TicketNoForm from = TicketNoForm.builder().movieNo(movieRating.getMovieNo()).customerNo(customer.getNo()).seatList(seats).movieAudienceTotalNumber(number).build();
		//scheduler.deletedDto(from); //스케쥴러 지우는 부분
		return "/ticketing/ticketingPay";
	}
	
	@PostMapping("/ticketing/ticketingPay")
	public String postTicketingPay(TicketingForm form, RedirectAttributes redirect) throws JsonProcessingException {
		Customer customer = (Customer)SessionUtils.getAttribute("LOGIN_USER");
		if(customer == null) {
			 throw new CustomException("로그인을 다시 진행하세요");
		} 
		TicketingForm ticket = TicketingForm.builder().adult(form.getAdult()).adultCount(form.getAdultCount()).baby(form.getBaby()).babyCount(form.getBabyCount())
				.old(form.getOld()).oldCount(form.getOldCount()).movieNo(form.getMovieNo()).screenNo(form.getScreenNo()).ticketingPay(form.getTicketingPay())
				.theaterNo(form.getTheaterNo()).showTypeNo(form.getShowTypeNo()).seats(form.getSeats()).showScheduleStartTime(form.getShowScheduleStartTime())
				.showScheDuleNo(form.getShowScheDuleNo()).showNo(form.getShowNo()).seat1(form.getSeat1()).seat2(form.getSeat2())
				.seat3(form.getSeat3()).seat4(form.getSeat4()).date(form.getDate()).dayName(form.getDayName()).build();
		log.info("폼입력 값" + ticket);
		//현재값을 뿌리기 위해 조회하는 값이다. 
		ShowDayType showDay = ticketService.getShowDayType(ticket.getDayName());
		ShowStartTimeType startTime = ticketService.getStartType(ticket.getShowScheduleStartTime());
		List<AudienceType> audiences = ticketService.getAudienceTypeName(ticket.getAdult(),ticket.getBaby(),ticket.getOld());
		long totalpay = Integer.parseInt(ticket.getTicketingPay());
		int countPoint = (int)((totalpay) * 0.05);
		Ticket tickets = Ticket.builder().showScheduleNo(ticket.getShowScheDuleNo()).customerNo(customer.getNo()).ticketTotalAmount(totalpay)
				.ticketExpectedEarningPoint(countPoint).ticketUsedPoint(0).build();
		//나중에 totalPay와 point, EarningPoint변경예정
		//티켓을 저장한다.
		Ticket findTicket = ticketService.saveTicket(tickets);
		//List<FeeType> fees = new ArrayList<>();
		//for(AudienceType audience : audiences) {
		//	FeeType fee = ticketService.getFeeTypeByNo(ticket.getShowTypeNo(), showDay.getNo(), startTime.getNo(),audience.getNo());
		//		fees.add(fee);
		//	//관람료 구분에 입력한다.
		//} //에러나서 주석으로 처리함, 나중에 확인해야함(입력필요없으면 따로 입력안함)
		List<TicketSeat> seatsKind = new ArrayList<>();
		TicketSeat seats1 = TicketSeat.builder().ticketNo(findTicket.getNo()).no(ticket.getSeat1()).build();
		TicketSeat seats2 = TicketSeat.builder().ticketNo(findTicket.getNo()).no(ticket.getSeat2()).build();
		TicketSeat seats3 = TicketSeat.builder().ticketNo(findTicket.getNo()).no(ticket.getSeat3()).build();
		TicketSeat seats4 = TicketSeat.builder().ticketNo(findTicket.getNo()).no(ticket.getSeat4()).build();
		//ticketSeat을 구매한 것을 저장한다. 그리고 좌석예약수에 맞춰 예약 인원수를 증가한다.
		if(!seats1.getNo().isEmpty()) {
			TicketSeat seat1 = ticketService.saveTicketSeat(seats1);
			seatsKind.add(seat1);
			ticketService.updateMovieTotalNumber(form.getMovieNo());
		} 
		if(!seats2.getNo().isEmpty()) {
			TicketSeat seat2 = ticketService.saveTicketSeat(seats2);
			seatsKind.add(seat2);
			ticketService.updateMovieTotalNumber(form.getMovieNo());
		} 
		if(!seats3.getNo().isEmpty()) {
			TicketSeat seat3 = ticketService.saveTicketSeat(seats3);
			seatsKind.add(seat3);
			ticketService.updateMovieTotalNumber(form.getMovieNo());
		}
		if(!seats4.getNo().isEmpty()) {
			TicketSeat seat4 = ticketService.saveTicketSeat(seats4);
			seatsKind.add(seat4);
			ticketService.updateMovieTotalNumber(form.getMovieNo());
		}
		//log.info("관람자구분" + fees);
		log.info("일정조회" + showDay);
		log.info("시작시간조회" + startTime);
		log.info("관람자번호" + audiences);
		log.info("티켓저장 후 티켓"+ findTicket);
		log.info("좌석" + seatsKind);
		log.info("영화번호" + ticket.getMovieNo());
		
		TicketingPayForm formByPay = TicketingPayForm.builder()
				.showDayByForm(showDay).startTimesByForm(startTime).audiencesByForm(audiences)
				.findTicketByForm(findTicket).seatsKindByForm(seatsKind).movieNo(ticket.getMovieNo()).audult(form.getAdult()).audultTotal(form.getAdultCount()).screenNo(form.getScreenNo())
				.baby(form.getBaby()).babyTotal(form.getBabyCount()).oldTotal(form.getOldCount()).old(form.getOld()).build();
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(formByPay);
		redirect.addAttribute("formByPay",jsonStr);
		return "redirect:/ticketing/ticketingPay";
		//결제를 진행하지 않으면 좌석과 티켓이 취소되는 스케쥴러 구현해야함 2-5
	}
	

	 
}
