package com.yedam.board.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.board.domain.Criteria;
import com.yedam.board.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	//@Test
	public void deleteTest() {
		log.info(replyMapper.delete(5L));
	}
	
	
	
	public void readTest() {
		log.info(replyMapper.read(3L));                       
	}
	
	
	@Test
	public void listTest() {
		Criteria cri = new Criteria();	// pageNum:1, amount:10
	
		List<ReplyVO> list  = replyMapper.getListWithPaging(300L, cri);
		for (ReplyVO vo : list) {
			
			log.info(vo);
		}
	}
	
	
	public void updateTest() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(3L);
		vo.setReply("300번의 수정된 댓글.");
		
		replyMapper.update(vo);
	}
	
	
	public void insertTest() {
		ReplyVO vo = new ReplyVO();
		vo.setReply("댓글등록1");
		vo.setReplyer("user07");
		vo.setBno(300L);
		
		if(replyMapper.insert(vo)==1) {
			log.info("성공!");
		} else {
			log.info("실패!");
		}
	}
	
}
