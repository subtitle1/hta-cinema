package com.example.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Customer {
	private int no;
	private int gradeNo;
	private String id;
	private String password;
	private String name;
	private String phoneNumber;
	private String email;
	private String streetAddress;
	private Date birthDate;
	private String gender;	// "남", "여"
	private int currentPoint;
	private Date createdDate;
	private String deleted;	// "Y"이면 삭제된 고객, "N"이면 정상 고객
	private Date deletedDate;
}
