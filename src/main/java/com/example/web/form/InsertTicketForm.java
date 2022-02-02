package com.example.web.form;

import com.example.vo.FeeType;
import com.example.vo.Movie;
import com.example.vo.Screen;
import com.example.vo.ShowDayType;
import com.example.vo.ShowStartTimeType;
import com.example.vo.Theater;
import com.example.vo.Ticket;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class InsertTicketForm {

	private Theater theater;
	private Screen screen;
	private Movie movie;
	private int ticketingToTalPay;//실제계산총액
	private int userDiscountPoint;//사용자 할인받은금액
	private int ticketingPay;//사용자 티켓 총 금액(할인전)
	private int point;//계산해야하는 포인트
	private String seatNumber;
	private int userPoint;//포인트 적립으로 보였던 부분
	private String adult;
	private String baby;
	private String old;
	private ShowDayType showTime;
	private Ticket ticket;
	private FeeType fee;
}
