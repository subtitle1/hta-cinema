package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mapper.TheaterMapper;
import com.example.mapper.TicketingMapper;
import com.example.vo.AudienceType;
import com.example.vo.FeeType;
import com.example.vo.Screen;
import com.example.vo.ShowDayType;
import com.example.vo.ShowStartTimeType;
import com.example.vo.Theater;
import com.example.vo.Ticket;
import com.example.vo.TicketAudience;
import com.example.vo.TicketSeat;
import com.example.web.form.TicketAdienceTypeForm;

@Service
@Transactional
public class TicketingServiece {

	@Autowired
	private TicketingMapper ticketDto;
	@Autowired
	private TheaterMapper theaterDto;
	
	public Theater getTheaterByNo(int no) {
		return theaterDto.getTheaterByNo(no);
	}
	public Ticket saveTicket(Ticket ticket) {
		Ticket ticketBuilder = Ticket.builder().no(ticket.getNo()).customerNo(ticket.getCustomerNo())
				.showScheduleNo(ticket.getShowScheduleNo()).ticketTotalAmount(ticket.getTicketTotalAmount())
				.ticketUsedPoint(ticket.getTicketUsedPoint()).ticketExpectedEarningPoint(ticket.getTicketExpectedEarningPoint())
				.build();
		Ticket ticketByNo = ticketDto.ticketByNo(ticketBuilder.getNo());
		if(ticketByNo == null) {
			 ticketDto.insertTicket(ticketBuilder);
			 return ticketDto.ticketByNo(ticketBuilder.getNo());
		} else {
			return ticketByNo;
		}
	}
	public TicketAudience saveTicketAudience(TicketAudience audience) {
		TicketAudience audienceBuilder = TicketAudience.builder().ticketNo(audience.getTicketNo()).audienceTypeNo(audience.getAudienceTypeNo())
				.ticketNo(audience.getTicketNo()).totalNumber(audience.getTotalNumber()).build();
		TicketAdienceTypeForm form = TicketAdienceTypeForm.builder().ticketNo(audienceBuilder.getTicketNo()).audienceTypeNo(audienceBuilder.getAudienceTypeNo()).build();
		TicketAudience audiences = ticketDto.ticketAudienceByNo(form);
		if(audiences==null) {
			ticketDto.insertTicketAudience(audienceBuilder);
			return ticketDto.ticketAudienceByNo(form);
		} else {
			return audiences;
		}
	}
	public TicketSeat saveTicketSeat(TicketSeat seat) {
		if(seat.getNo() == null) {
			return null;
		} else {
			TicketSeat seatBuilder = TicketSeat.builder().no(seat.getNo()).ticketNo(seat.getTicketNo()).build();
			TicketSeat seats = ticketDto.ticketSeatByNo(seatBuilder.getTicketNo());

			if(seats == null) {
				ticketDto.insertTicetSeat(seatBuilder);
				return ticketDto.ticketSeatByNo(seatBuilder.getTicketNo());
			} else {
				return seats;
			}
		}
	}
	public ShowStartTimeType getStartType(String time) {
		return ticketDto.getStartType(time);
	}
	public ShowDayType getShowDayType(String name) {
		return ticketDto.getShowDayType(name);
	}
	public List<AudienceType> getAudienceTypeName(String audult, String old, String baby) {
		List<String> name = new ArrayList<>();
		if(audult.equals("성인")) {
			name.add("ADULT");
		} else if(old.equals("우대")) {
			name.add("OLD_MAN");
		} else if(baby.equals("청소년")) {
			name.add("YOUTH");
		}
		if(name.size() > 1) {
			return ticketDto.getAudienceTypeName(name);
		} else {
			AudienceType type = null;
			type =  ticketDto.getAudienceTypeNameByOne(name.get(0));
			List<AudienceType> typeName = new ArrayList<>();
			typeName.add(type);
			return typeName;
			
		}
		
	}
	public List<FeeType> getAllFeeType(int showTypeNo, int dayTypeNo, int showStartTimeNo, int audienceTypeNo){
		return ticketDto.getAllFeeType(showTypeNo, dayTypeNo, showStartTimeNo, audienceTypeNo);
	}
	public FeeType getFeeTypeByNo(int showTypeNo, int dayTypeNo, int showStartTimeNo, int audienceTypeNo) {
		FeeType fee = ticketDto.getAllFeeTypeByNo(showTypeNo, dayTypeNo, showStartTimeNo, audienceTypeNo);
		if(fee==null) {
			FeeType fees = FeeType.builder().showDayTypeNo(dayTypeNo).showTypeNo(showTypeNo).audienceTypeNo(audienceTypeNo).showStartTypeNo(showStartTimeNo)
					.build();
			if(audienceTypeNo == 1) {
				fees.setFee(10000);
			} else if(audienceTypeNo == 2) {
				fees.setFee(8000);
			} else if(audienceTypeNo == 3) {
				fees.setFee(5000);
			}
			 ticketDto.insertFeeType(fees);
			 return ticketDto.getAllFeeTypeByNo(showTypeNo, dayTypeNo, showStartTimeNo, audienceTypeNo);
		} else {
			return ticketDto.getAllFeeTypeByNo(showTypeNo, dayTypeNo, showStartTimeNo, audienceTypeNo);
		}
	}
	public Screen getScreenByNo(int screenNo) {
		return ticketDto.getScreenByNo(screenNo);
	}
}
