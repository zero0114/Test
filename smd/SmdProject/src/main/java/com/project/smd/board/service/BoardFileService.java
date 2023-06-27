package com.project.smd.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface BoardFileService {
	public static final String IMAGE_REPO = "C:/Web A/IMAGE_REPO";
	
	public String getMessage(int num, HttpServletRequest req);
	
	public String saveFile(MultipartFile file);
	
	public String getMessage(String msg, String path);
	
	public void deleteImage(String fileName);
}











