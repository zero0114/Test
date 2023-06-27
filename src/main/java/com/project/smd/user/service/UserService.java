package com.project.smd.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.smd.user.model.UserVO;
import com.project.smd.user.repository.IUserMapper;

@Service
public class UserService implements IUserService{

	@Autowired
	private IUserMapper mapper;
	
	
	@Override
	public void register(UserVO user) {
	
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전: " + user.getPw());
		
		String securePw = encoder.encode(user.getPw());
		user.setPw(securePw);
		System.out.println("암호화 후: " + securePw);
		
		mapper.register(user);
	}

	@Override
	public int checkEmail(String email) {
		return mapper.checkEmail(email);
	}

	@Override
	public void delete(int userNo) {
		mapper.delete(userNo);
		
	}

	@Override
	public UserVO selectOne(String email) {
		
		return mapper.selectOne(email);
	}

	@Override
	public List<UserVO> selectAll() {
		
		return mapper.selectAll();
	}

	@Override
	public void keepLogin(String sessionId, Date limitDate, String email) {
		
		Map<String, Object> datas = new HashMap<>();
		datas.put("sessionId", sessionId);
		datas.put("limitDate", limitDate);
		datas.put("email", email);
		
		mapper.keepLogin(datas);
	}

	@Override
	public UserVO getUserWithSessionId(String sessionId) {
		return mapper.getUserWithSessionId(sessionId);
	}

}
