package com.project.smd.user.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.project.smd.user.model.UserVO;
import com.project.smd.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;

	// 회원가입 요청 처리
	@PostMapping("/")
	public String register(@RequestBody UserVO user) {
		System.out.println("/user/ POST 요청 발생!");
		System.out.println("param: " + user);

		service.register(user);
		return "joinSuccess";
	}

	// 아이디 중복확인 요청 처리
	@PostMapping("/checkEmail")
	public String checkEmail(@RequestBody String email) {

		System.out.println("/user/checkEmail: POST요청 발생!");
		System.out.println("parameter: " + email);
		String result = null;

		int checkNum = service.checkEmail(email);
		if (checkNum == 1) {
			System.out.println("이메일 중복");
			result = "NO";
		} else {
			System.out.println("이메일 사용가능");
			result = "OK";
		}

		return result;
	}

	// 로그인 요청 처리
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestBody UserVO inputData, 
			HttpSession session, HttpServletResponse response) {

		String result = null;
		
		System.out.println("/user/loginCheck 요청! : POST");
		System.out.println("Parameter: " + inputData);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO dbData = service.selectOne(inputData.getEmail());

		if (dbData != null) {
			if (encoder.matches(inputData.getPw(), dbData.getPw())) {
				session.setAttribute("login", dbData);
				result = "loginSuccess";

				long limitTime = 60 * 60 * 24 * 90;

				if (inputData.isAutoLogin()) {
					System.out.println("자동 로그인 쿠키 생성");
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");
					loginCookie.setMaxAge((int) limitTime);

					response.addCookie(loginCookie);

					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					Date limitDate = new Date(expiredDate);

					service.keepLogin(session.getId(), limitDate, inputData.getEmail());
				}

			} else {
				result = "pwFail";
			}
		} else {
			result = "emailFail";
		}

		return result;
	}

	// 로그아웃 요청 처리
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("/user/logout 요청!");

		UserVO user = (UserVO) session.getAttribute("login");

		if (user != null) {
			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin("none", new Date(), user.getEmail());
			}
		}
		return new ModelAndView("redirect:/");
	}

	// 회원탈퇴 요청 처리
	@DeleteMapping("/{userNO}")
	public String delete(@PathVariable int userNo) {
		System.out.println("/user/" + userNo + ": DELETE 요청 발생!");

		service.delete(userNo);
		return "delSuccess";
	}

	// 회원정보 조회 요청 처리
	@GetMapping("/{email}")
	public UserVO selectOne(@PathVariable String email) {
		System.out.println("/user/" + email + ": GET 요청 발생!");

		return service.selectOne(email);
	}

	// 회원정보 전체조회 요청 처리
	@GetMapping("/")
	public List<UserVO> selectOne() {
		System.out.println("/user/ : GET 요청 발생!");

		return service.selectAll();
	}
}
