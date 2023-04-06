package com.yedam.board.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.board.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void updateTest() {
		BoardVO board = new BoardVO();
		board.setBno(2L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		
		int resultCount = mapper.update(board);
		log.info("update count:"+ resultCount);
		log.info(mapper.read(board.getBno()));
	}
	
	
	//@Test
	public void deleteTest() {
		log.info(mapper.delete(3L) == 1 ? "성공" : "실패");
	}
	
	
	
	public void readTest() {
		// 3(int) -> 3(Long)
		BoardVO board = mapper.read(3L);
		log.info(board);
	}
	
	
	//@Test
	public void insertTest() {
		BoardVO board = new BoardVO();
		board.setTitle("새글등록");
		board.setContent("글본문입니다.");
		board.setWriter("user03");
		mapper.insertSelectKey(board);
	}
	
	
	public void testGetTime() {
		mapper.getList().forEach(board -> log.info(board));
		

	}
	
}
