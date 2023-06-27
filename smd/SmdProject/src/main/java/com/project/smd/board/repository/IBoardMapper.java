package com.project.smd.board.repository;

import java.util.List;

import com.project.smd.board.model.BoardVO;
import com.project.smd.commons.SearchVO;

public interface IBoardMapper {

	//게시글 등록 기능
		void insert(BoardVO bv);

		//게시글 상세 조회기능
		BoardVO getArticle(int boardNo);
		
		//게시물 조회수 상승 처리
		void updateViewCnt(int boardNo);

		//게시글 수정 기능
		void update(BoardVO article);

		//게시글 삭제 기능
		void delete(int boardNo);
		
		//# 검색, 페이징 기능이 포함된 게시물 목록 조회기능
		List<BoardVO> getArticleList(SearchVO search);
		
		int countArticles(SearchVO search);

}
