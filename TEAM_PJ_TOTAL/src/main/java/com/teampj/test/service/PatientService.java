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
	
	// 한상진
	// 결제 - 카드관리 - 등록된 카드정보 가져오기
	public void getCardInfo(HttpServletRequest req, Model model);
}
