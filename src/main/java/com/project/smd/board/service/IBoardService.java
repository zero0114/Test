package com.project.smd.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.smd.board.model.BoardVO;
import com.project.smd.commons.SearchVO;

public interface IBoardService {

	//게시글 등록 기능
		void insert(MultipartHttpServletRequest mul);

		//게시글 상세 조회기능
		BoardVO getArticle(int boardNo);

		//게시글 수정 기능
		void update(BoardVO article);

		//게시글 삭제 기능
		void delete(int boardNo);
		
		//게시글 목록 조회 기능(검색, 페이징 통합)
		List<BoardVO> getArticleList(SearchVO search);
		
		int countArticles(SearchVO search);

}
