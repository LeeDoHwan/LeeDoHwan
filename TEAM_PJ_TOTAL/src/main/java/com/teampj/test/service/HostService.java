package com.teampj.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface HostService {

	// 의사 리스트 가져오기
	public void getDoctorList(HttpServletRequest req, Model model);
	// 의사 가입 승인 및 부서정해주기
	public void signConfirm(HttpServletRequest req, Model model);
	
	// 게시판
	public void boardWritePro(HttpServletRequest req, Model model);
	
	public void boardModifyForm(HttpServletRequest req, Model model);
	
	public void boardModifyPro(HttpServletRequest req, Model model);
	
	public void boardDeletePro(HttpServletRequest req, Model model);
}
