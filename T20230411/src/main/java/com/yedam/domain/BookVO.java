package com.yedam.domain;



import java.sql.Date;

import lombok.Data;

@Data
public class BookVO {
	private Long bookNo;
	private String bookName;
	private String bookCoverimg; 
	private Date bookDate; 
	private int bookPrice; 
	private String bookPublisher;
	private String bookInfo;
}
