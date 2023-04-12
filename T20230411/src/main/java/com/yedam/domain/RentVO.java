package com.yedam.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class RentVO {
	
	private long rentNo;
	private long bookNo;
	private int rentPrice;
	private Date rentDate;
	private String rentStatus;
	
}
