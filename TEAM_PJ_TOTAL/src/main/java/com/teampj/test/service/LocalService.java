package com.teampj.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LocalService {

	// 회원가입 - 임시 환자
	public void insertPatient(HttpServletRequest req, Model model);
	// 회원가입 - 임시 의사
	public void insertDoctor(HttpServletRequest req, Model model);
	// 회원가입 - 임시 관리자
	public void insertAdmin(HttpServletRequest req, Model model);
	// 환자들 검색 - 임시
	public void searchPatients(HttpServletRequest req, Model model);
	// 이메일 인증처리
	public void emailChk(HttpServletRequest req, Model model);
	// 아이디 중복확인 - 환자
	public void confirmId_pa(HttpServletRequest req, Model model);
	// 아이디 중복확인 - 의사
	public void confirmId_dc(HttpServletRequest req, Model model);
	// 게시판 읽어오기
	public void boardList(HttpServletRequest req, Model model);
	// 게시판 상세페이지
	public void boardView(HttpServletRequest req, Model model);
}
