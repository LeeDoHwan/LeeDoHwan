package com.teampj.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface PatientService {
	
	public void BipolarDepressionResult(HttpServletRequest req, Model model);

	
	public final String[] RESERTVATIONTIME = {"09:00","10:00","11:00","12:00","14:00","15:00","16:00","17:00"};
	
	// 이도환
	// 예약 - 예약시간불러오기
	public void selectReservationTime(HttpServletRequest req, Model model);
	
	// 박미성
	// 예약처리
	public void reservationmPro(HttpServletRequest req, Model model);
	
	// 김동규
	//조울증 진단결과
	public void bipolarDepressionResult(HttpServletRequest req, Model model);
	
	//조울증 진단결과 제출
	public void bipolarResultPro(HttpServletRequest req, Model model);
	
	//우울증 진단결과
	public void depressionResult(HttpServletRequest req, Model model);
	
	//우울증 진단결과 제출
	public void depressionResultPro(HttpServletRequest req, Model model);

	//박건형
	//예약조회
	public void searchreservation(HttpServletRequest req, Model model);

	//박건형
	//예약 취소
	public void deleteReservation(HttpServletRequest req, Model model);
	
	//허소정
	// 마이페이지 내용 띄우기
	public void myPageContents(HttpServletRequest req, Model model);
	
	// 마이페이지 비밀번호 수정
	public void myPageModPw(HttpServletRequest req, Model model);
	
	// 마이페이지 내 정보 수정
	public void myPageModInfo(HttpServletRequest req, Model model);
	
	// 마이페이지 주소 변경
	public void myPageModAddr(HttpServletRequest req, Model model);
}
