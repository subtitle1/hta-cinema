package com.example.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ChatRoom {

	private long chatroomNo;
	private int adminNo;
	private int customerNo;
	private Date updatedDate;
}
