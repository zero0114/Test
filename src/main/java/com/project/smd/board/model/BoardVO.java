package com.project.smd.board.model;

import java.util.Date;

public class BoardVO {

	private int boardNo;
	private String title;
	private String content;
	private String writer;
	private String pName;
	private String pMake;
	private String imageFileName;
	private Date regDate;
	private int viewCnt;
		
	private boolean newMark;
	
	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}
	
	public boolean isNewMark() {
		return newMark;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpMake() {
		return pMake;
	}
	public void setpMake(String pMake) {
		this.pMake = pMake;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", pName=" + pName + ", pMake=" + pMake + ", imageFileName=" + imageFileName + ", regDate=" + regDate
				+ ", viewCnt=" + viewCnt + ", newMark=" + newMark + "]";
	}


	
}
