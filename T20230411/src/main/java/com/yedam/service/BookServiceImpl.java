package com.yedam.service;

import java.util.List;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.domain.BookVO;
import com.yedam.domain.RentVO;
import com.yedam.persistence.BookMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BookServiceImpl implements BookService{
	
	@Setter(onMethod_ = @Autowired)
	private BookMapper bookMapper;
	
	@Override
	public void register(BookVO book) {
		log.info("서비스 구현... 등록");
		bookMapper.insert(book);
	}
	
	@Override
	public List<BookVO> getList() {
		log.info("서비스 구현... 목록");
		log.info(bookMapper.getList());
		return bookMapper.getList();
	}
	
	@Override
	public int selectBno() {
		log.info("서비스 구현... 도서번호");
		log.info(bookMapper.selectBno());
		return bookMapper.selectBno();
	}
	
	
	@Override
	public List<RentVO> rentList() {
		log.info("서비스 구현... 대여 목록.");
		log.info(bookMapper.rentList());
		return bookMapper.rentList();
	}
	
	
}
