package com.project.smd.user.model;

import java.util.Date;

public class UserVO {

	
	private int userNo;
	private String email;
	private String pw;
	private String nick;
	private String addr;
	private Date regDate;
	private String sessionId;
	private Date limitTime;
	private boolean autoLogin;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	public boolean isAutoLogin() {
		return autoLogin;
	}

	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}

	@Override
	public String toString() {
		return "UserVO [userNo=" + userNo + ", email=" + email + ", pw=" + pw + ", nick=" + nick + ", addr="
				+ addr + ", regDate=" + regDate + ", sessionId=" + sessionId + ", limitTime=" + limitTime
				+ ", autoLogin=" + autoLogin + "]";
	}
	
	
}
