package com.teampj.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface PatientService {
	
	// 조울증 결과
	public void BipolarDepressionResult(HttpServletRequest req, Model model);

	// 마이페이지 내용 띄우기
	public void myPageContents(HttpServletRequest req, Model model);
	
	// 마이페이지 비밀번호 수정
	public void myPageModPw(HttpServletRequest req, Model model);
	
	// 마이페이지 내 정보 수정
	public void myPageModInfo(HttpServletRequest req, Model model);
	
	// 마이페이지 주소 변경
	public void myPageModAddr(HttpServletRequest req, Model model);
}
