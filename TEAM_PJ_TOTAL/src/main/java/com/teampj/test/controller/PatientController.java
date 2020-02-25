package com.teampj.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.test.service.PatientService;

@Controller
public class PatientController {
	
	private static final Logger logger = LoggerFactory.getLogger(PatientController.class);
	
	@Autowired
	PatientService service;
	
	// 예약하기
	@RequestMapping("appointment.pa")
	public String appointment1() {
		logger.info("url ==> appointment");
		
		return "pa/appointment";
	}

	
	// 예약조회
	@RequestMapping("appointment2.pa")
	public String appointment2() {
		logger.info("url ==> appointment2");
		
		return "pa/appointment2";
	}

	// 결과 조회
	@RequestMapping("appointment3.pa")
	public String appointment3() {
		logger.info("url ==> appointment3");
		
		return "pa/appointment3";
	}
	
	// 자가진단 - 정신 질환
	@RequestMapping("selfcheck.pa")
	public String selfcheck() {
		logger.info("url ==> selfcheck");
		
		return "pa/selfcheck";
	}
	
	// 자가진단 - 감정인식
	@RequestMapping("selfcheck3.pa")
	public String selfcheck3() {
		logger.info("url ==> selfcheck3");
		
		return "pa/selfcheck3";
	}
	
	// 보건정보 - 약품정보 
	@RequestMapping("mediinfo.pa")
	public String mediinfo() {
		logger.info("url ==> mediinfo");
		
		return "pa/mediinfo";
	}
	
	// 보건정보 - 질병 정보
	@RequestMapping("mediinfo2.pa")
	public String mediinfo2() {
		logger.info("url ==> mediinfo2");
		
		return "pa/mediinfo2";
	}
	
	// 보건정보 - 식단정보
	@RequestMapping("mediinfo3.pa")
	public String mediinfo3() {
		logger.info("url ==> mediinfo3");
		
		return "pa/mediinfo3";
	}
	
	// 결제 - 하이패스 
	@RequestMapping("payment.pa")
	public String payment() {
		logger.info("url ==> payment");
		
		return "pa/payment";
	}
	
	// 결제 - 일반결제 
	@RequestMapping("payment2.pa")
	public String payment2() {
		logger.info("url ==> payment2");
		
		return "pa/payment2";
	}

	
	/////////////////////////////////////////////// 
	// 허소정
	// 허소정 약품인식 - 소개 페이지  mediCognition
	@RequestMapping("mediCognition.pa")
	public String mediCognition() {
		logger.info("url ==> mediCognition");
		
		return "pa/mediCognition";
	}
	
	// 허소정 검진결과 - ajax, result로 뿌려주기
	@RequestMapping("result.pa")
	public String result() {
		logger.info("url ==> result");
		
		return "pa/result";
	}
	
	// 허소정 마이페이지 - 수정, 삭제
	@RequestMapping("myPage_pa.pa")
	public String myPage_pa() {
		logger.info("url ==> myPage_pa");
		
		return "pa/myPage_pa";
	}
	
	// 허소정 약품검색
	@RequestMapping("medictionary.pa")
	public String medictionary() {
		logger.info("url ==> medictionary");
		
		return "pa/medictionary";
	}
	
	/////////////////////////////////////////////////////////////
	// 김동규
	//patientController
	//자가진단 메인페이지
	@RequestMapping("selfCheckMain.pa")
	public String selfCheckMain() {
		logger.info("url ==> selfCheckMain");
		
		return "pa/selfCheckMain";
	}
	
	// 우울증 자가진단 페이지
	@RequestMapping("selfCheckDepression.pa")
	public String selfCheckDepression() {
		logger.info("url ==> selfCheckDepression");
		
		return "pa/selfCheckDepression";
	}
	
	// 조울증 자가진단 페이지
	@RequestMapping("selfCheckBipolarDisorder.pa")
	public String selfCheckBipolarDisorder() {
		logger.info("url ==> selfCheckBipolarDisorder");
		
		return "pa/selfCheckBipolarDisorder";
	}
	
	// 우울증 자가진단 결과 페이지
	@RequestMapping("selfCheckDepressionResult.pa")
	public String selfCheckDepressionResult() {
		logger.info("url ==> selfCheckDepressionResult");
		
		return "pa/selfCheckDepressionResult";
	}
	
	// 조울증 자가진단 결과 페이지
	@RequestMapping("selfCheckBipolarDisorderResult.pa")
	public String selfCheckBipolarDisorderResult(HttpServletRequest req, Model model) {
		logger.info("url ==> selfCheckBipolarDisorderResult");
		
		service.BipolarDepressionResult(req, model);
		
		return "pa/selfCheckBipolarDisorderResult";
	}
	
	// 사진 감정분석(감정인식)
	@RequestMapping("emotionRecognition.pa")
	public String emotionRecognition() {
		logger.info("url ==> emotionRecognition");
		
		return "pa/emotionRecognition";
	}
	///////////////////////////////////////////////////////////
	// 박미성
	// 예약 - 예약확인
	@RequestMapping("apptConfirm.pa")
	public String apptConfirm() {
		logger.info("url ==> apptConfirm");
		
		return "pa/apptConfirm";
	}
	////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////
	// 박미성
	// 예약처리
	@RequestMapping("appointmentPro.pa")
	public String appointmentPro(HttpServletRequest req, Model model) {
		logger.info("url ==> appointmentPro");
		
		service.reservationmPro(req, model);
		
		return "pa/apptConfirm";
	}
	///////////////////////////////////////////////////////////
	// 이도환
	// 예약 - 예약시간불러오기
	@RequestMapping("selectReservationTime.pa")
	public String selectReservationTime(HttpServletRequest req, Model model) {
		logger.info("url ==> selectReservationTime");
		
		service.selectReservationTime(req, model);
		
		return "pa/selectReservationTime";
	}
	////////////////////////////////////////////////////////////////
}
