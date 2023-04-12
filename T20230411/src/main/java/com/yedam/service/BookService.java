package com.yedam.service;

import java.util.List;

import com.yedam.domain.BookVO;
import com.yedam.domain.RentVO;

public interface BookService {
	
	public List<BookVO> getList();
	public void register(BookVO book);
	public int selectBno(); // 도서 등록 시 도서번호.
	public List<RentVO> rentList();

}
