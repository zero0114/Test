package com.project.smd.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.smd.board.model.BoardVO;
import com.project.smd.board.service.BoardFileService;
import com.project.smd.board.service.IBoardService;
import com.project.smd.commons.PageCreator;
import com.project.smd.commons.PageVO;
import com.project.smd.commons.SearchVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private IBoardService service;

	// 검색 처리 이후 게시물 목록 불러오기 요청
	@GetMapping("/list")
	public String list(SearchVO search, Model model) {

		String condition = search.getCondition();

		System.out.println("URL: /board/list GET -> result: ");
		System.out.println("parameter(페이지번호): " + search.getPage() + "번");
		System.out.println("검색 조건: " + condition);
		System.out.println("검색어: " + search.getKeyword());

		PageCreator pc = new PageCreator();
		pc.setPaging(search);

		List<BoardVO> list = service.getArticleList(search);
		pc.setArticleTotalCount(service.countArticles(search));

		model.addAttribute("articles", list);
		model.addAttribute("pc", pc);

		return "board/list";
	}

	// 게시글 작성페이지 요청
	@GetMapping("/write")
	public String write(HttpSession session, RedirectAttributes ra) {
		System.out.println("URL: /board/write => GET");
			return "board/write";
	}

	// 게시글 DB등록 요청
	@PostMapping("/write")
//	public String write(BoardVO article, RedirectAttributes ra, MultipartHttpServletRequest mul) {
	public String write( RedirectAttributes ra, MultipartHttpServletRequest mul) {

		System.out.println("URL: /board/write => POST");
		System.out.println("Controller parameter: ");
		service.insert(mul);
		ra.addFlashAttribute("msg", "regSuccess");

		return "redirect:/board/list";
	}

	// 게시물 상세 조회 요청
	@GetMapping("/content/{boardNo}")
	public String content(@PathVariable int boardNo, Model model, @ModelAttribute("p") SearchVO paging) {
		System.out.println("URL: /board/content => GET");
		System.out.println("parameter(글 번호): " + boardNo);
		BoardVO vo = service.getArticle(boardNo);
		System.out.println("Result Data: " + vo);
		model.addAttribute("article", vo);
		return "board/content";
	}

	// 게시물 삭제 처리 요청
	@PostMapping("/delete")
	public String remove(int boardNo, PageVO paging, RedirectAttributes ra) {

		System.out.println("URL: /board/delete => POST");
		System.out.println("parameter(글 번호): " + boardNo);
		service.delete(boardNo);
		ra.addFlashAttribute("msg", "delSuccess").addAttribute("page", paging.getPage()).addAttribute("countPerPage",
				paging.getCountPerPage());

		return "redirect:/board/list";
	}

	// 게시물 수정 페이지 요청
	@GetMapping("/modify")
	public String modify(int boardNo, Model model, @ModelAttribute("p") PageVO paging) {
		System.out.println("URL: /board/modify => GET");
		System.out.println("parameter(글 번호): " + boardNo);

		BoardVO vo = service.getArticle(boardNo);
		System.out.println("Result Data: " + vo);
		model.addAttribute("article", vo);

		return "board/modify";
	}

	// 게시물 수정 요청
	@PostMapping("/modify")
	public String modify(BoardVO article, RedirectAttributes ra) {
		System.out.println("URL: /board/modify => POST");
		System.out.println("parameter(게시글): " + article);
		service.update(article);

		ra.addFlashAttribute("msg", "modSuccess");

		return "redirect:/board/content/" + article.getBoardNo();
	}

	@GetMapping("/download")
	public void download(@RequestParam String imageFileName,
						HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment;imageFileName="+imageFileName);
		File file =	new File(BoardFileService.IMAGE_REPO+"/"+imageFileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	
}
