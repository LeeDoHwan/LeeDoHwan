package com.teampj.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.test.service.HostService;


@Controller
public class HostController {

	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	
	@Autowired
	HostService service;
    // 호스트
	
	// 회원조회
	@RequestMapping("/select.ho")
	public String select() {
		logger.info("url ==> /select.ho");
		
		return "ho/select";
	}
	// - 회원 관리 종료 -
	
	// - 보건정보 - 
	// 약품정보
	@RequestMapping("/druginfo.ho")
	public String druginfo() {
		logger.info("url ==> /druginfo.ho");
		
		return "ho/druginfo";
	}
/*	
	// 질병정보
	@RequestMapping("/illnessinfo.ho")
	public String illnessinfo() {
		logger.info("url ==> /illnessinfo.ho");
		
		return "ho/illnessinfo";
	}
*/	
	// 식단정보
	@RequestMapping("/dietinfo.ho")
	public String dietinfo() {
		logger.info("url ==> /dietinfo.ho");
		
		return "ho/dietinfo";
	}
	// - 보건정보 종료 -
	
	// 결산
	@RequestMapping("/total.ho")
	public String total() {
		logger.info("url ==> /total.ho");
		
		return "ho/total";
	}
	
	// 챗봇 
	@RequestMapping("/chatbot.ho")
	public String chatbot() {
		logger.info("url ==> /chatbot.ho");
		
		return "ho/chatbot";
	}
	// 통계
	@RequestMapping("/statistics.ho")
	public String statistics() {
		logger.info("url ==> /statistics.ho");
		
		return "ho/statistics";
	}
	
/*	
	@RequestMapping("/floating.ho")
	public String floating() {
		logger.info("url ==> /floating.ho");
		
		return "ho/floating";
	}
	
	@RequestMapping("/illstats.ho")
	public String illstats() {
		logger.info("url ==> /illstats.ho");
		
		return "ho/illstats";
	}
*/	
	@RequestMapping("/stats.ho")
	public String stats() {
		logger.info("url ==> /stats.ho");
		
		return "ho/stats";
	}
	

	
	//////////////////////////////////////////////////////////////////////////////
	// 상진
	// - 회원 관리 -
	// 의료인 회원가입 승인 페이지
	@RequestMapping("/signcheck.ho")
	public String signcheck(HttpServletRequest req, Model model) {
		logger.info("url ==> /signcheck.ho");
		service.getDoctorList(req, model);
		return "ho/signcheck";
	}
	
	// 회원가입 부서/승인 처리
	@RequestMapping("/signConfirm.ho")
	public String signConfirm(HttpServletRequest req, Model model) {
		logger.info("url ==> /signConfirm.ho");
		service.signConfirm(req, model);
		return "ho/signConfirm";
	}
	
	// - 회원 관리 종료 -
	/////////////////////////////////////////////////////////////////////////////////////
	// 박미성
	// 약품데이터 수정 
	@RequestMapping("/drugModify.ho")
	public String drugModify() {
		logger.info("url ==> /drugModify.ho");
		
		return "ho/drugModify";
	}	
	/////////////////////////////////////////////////////////////////////////////////////
	// 함정화
	// 공지 작성 페이지
	@RequestMapping("/boardWriteForm.ho")
	public String boardWriteForm(HttpServletRequest req, Model model) {
		logger.info("url ==> /boardWriteForm");
		return "ho/boardWriteForm";
	}
	
	// 공지 작성 처리페이지
	@RequestMapping("/boardWritePro.ho")
	public String writePro(HttpServletRequest req, Model model) {
		logger.info("url ==> /boardWritePro.ho");
		service.boardWritePro(req, model);
		return "ho/boardWritePro";
	}
	
	// 공지 수정 페이지
	@RequestMapping("/boardModifyForm.ho")
	public String boardModifyForm(HttpServletRequest req, Model model) {
		logger.info("url ==> /boardModifyForm");
		service.boardModifyForm(req, model);
		return "ho/boardModifyForm";
	}
	
	// 공지 수정 처리
	@RequestMapping("/boardModifyPro.ho")
	public String boardModifyPro(HttpServletRequest req, Model model) {
		logger.info("url ==> /boardModifyPro");
		service.boardModifyPro(req, model);
		return "ho/boardModifyPro";
	}
	
	// 삭제 처리 페이지
	@RequestMapping("/boardDeletePro.ho")
	public String boardDeletePro(HttpServletRequest req, Model model) {
		logger.info("url ==> /boardDeletePro");
		service.boardDeletePro(req, model);
		return "ho/boardDeletePro";
	}
	/////////////////////////////////////////////////////////////////////////////////////

}
