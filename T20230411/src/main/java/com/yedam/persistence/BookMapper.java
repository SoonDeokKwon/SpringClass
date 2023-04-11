package com.yedam.persistence;

import java.util.List;

import com.yedam.domain.BookVO;

public interface BookMapper {
	
	public List<BookVO> getList();	// 목록.
	public void insert(BookVO book);	// 등록.
	
}
