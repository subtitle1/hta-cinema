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
public class Message {

	private long chatroomNo;
	private int customerNo;
	private String content;
	private Date sendingDate;
}
