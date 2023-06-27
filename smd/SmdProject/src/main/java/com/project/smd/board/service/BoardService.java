package com.project.smd.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.smd.board.model.BoardVO;
import com.project.smd.board.repository.IBoardMapper;
import com.project.smd.commons.SearchVO;

@Service
public class BoardService implements IBoardService {

	@Inject
	private IBoardMapper mapper;

	@Override
	public void insert(MultipartHttpServletRequest mul) {
		BoardVO bv = new BoardVO();
		MultipartFile file = mul.getFile("image_file_name");
		BoardFileService bfs = new BoardFileServiceImpl();
		if(file.getSize() != 0) {
			bv.setImageFileName(bfs.saveFile(file) );
		}		
		
		bv.setContent(mul.getParameter("content"));
		bv.setpName(mul.getParameter("pName"));
		bv.setpMake(mul.getParameter("pMake"));
		bv.setTitle(mul.getParameter("title"));
		bv.setWriter(mul.getParameter("writer"));

		mapper.insert(bv);
	}

	@Override
	public BoardVO getArticle(int boardNo) {
		mapper.updateViewCnt(boardNo);
		return mapper.getArticle(boardNo);
	}

	@Override
	public void update(BoardVO article) {
		mapper.update(article);
	}

	@Override
	public void delete(int boardNo) {
		mapper.delete(boardNo);
	}

	@Override
	public List<BoardVO> getArticleList(SearchVO search) {
		List<BoardVO> list = mapper.getArticleList(search);

		for (BoardVO article : list) {
			long now = System.currentTimeMillis();
			long regTime = article.getRegDate().getTime();

			if (now - regTime < 60 * 60 * 24 * 5 * 1000) {
				article.setNewMark(true);
			}
		}

		return list;
	}

	@Override
	public int countArticles(SearchVO search) {
		return mapper.countArticles(search);
	}

}
