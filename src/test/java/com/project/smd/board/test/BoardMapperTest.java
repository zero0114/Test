package com.project.smd.board.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.smd.board.model.BoardVO;
import com.project.smd.board.repository.IBoardMapper;
import com.project.smd.commons.PageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/mvc-config.xml" })
public class BoardMapperTest {

	@Autowired
	private IBoardMapper mapper;

	// 게시글 등록 테스트
	@Test
	public void insertTest() {
		for (int i = 1; i <= 315; i++) {
			BoardVO article = new BoardVO();
			article.setTitle("테스트 제목" + i);
			article.setWriter("테스터" + i);
			article.setContent("테스트 중" + i);
			mapper.insert(article);
		}
		System.out.println("게시물 등록 성공!");
	}

	// 게시글 단일 조회 테스트
	@Test
	public void getArticleTest() {

		BoardVO article = mapper.getArticle(44);
		System.out.println(article);

	}

	// 게시물 수정 테스트 :
	// VO의 세터를 사용하여 수정 내용(글제목, 글내용)을 입력하고
	// 수정을 테스트해보세요.
	@Test
	public void updateTest() {
		BoardVO article = new BoardVO();
		article.setBoardNo(1);
		article.setTitle("수정된 제목");
		article.setContent("수정 테스트 중");
		mapper.update(article);
		System.out.println("수정 후 정보: " + mapper.getArticle(1));
	}

	// 게시물 삭제 테스트 : 게시글 번호를 통한 삭제를 확인하세요
	@Test
	public void deleteTest() {
		mapper.delete(3);
		BoardVO vo = mapper.getArticle(3);
		if (vo == null) {
			System.out.println("# 게시물이 없습니다!");
		} else {
			System.out.println("# 게시물 정보: " + vo);
		}
	}

	// 페이징 단위 테스트
	@Test
	public void pagingTest() {
		System.out.println("===================================");
		PageVO paging = new PageVO();
		paging.setPage(0);
		paging.setCountPerPage(20);

	//	mapper.getArticleListPaging(1).forEach(vo -> System.out.println(vo));
		System.out.println("===================================");

	}

}
