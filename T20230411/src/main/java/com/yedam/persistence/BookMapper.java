package com.yedam.persistence;

import java.util.List;

import com.yedam.domain.BookVO;
import com.yedam.domain.RentVO;

public interface BookMapper {
	
	public List<BookVO> getList();	// 도서 목록.
	public void insert(BookVO book);	// 도서 등록.
	public int selectBno(); // 도서 등록 시 도서번호.
	public List<RentVO> rentList();
	
}
