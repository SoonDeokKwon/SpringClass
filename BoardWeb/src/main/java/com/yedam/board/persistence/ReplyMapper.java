package com.yedam.board.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.yedam.board.domain.BoardVO;
import com.yedam.board.domain.Criteria;
import com.yedam.board.domain.ReplyVO;

public interface ReplyMapper {
	
	// 기본적인 C(Create), R(Read), U(Update), D(Delete) 처리.
	public int insert(ReplyVO vo);
	public ReplyVO read(Long rno); // 댓글번호 조회.
	public int delete(Long rno);	// 댓글 삭제.
	public int update(ReplyVO vo);	// 댓글 수정.
	public List<ReplyVO> getListWithPaging(@Param("bno") Long bno, @Param("cri") Criteria cri);	// 글 번호에 대한 댓글 목록. (페이지, 건수...)
	public int getCountByBno(Long bno);	// 전체 건수.
	
}
