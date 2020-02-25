package com.teampj.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teampj.test.service.LocalService;
import com.teampj.test.vo.CommentVO;

@Controller
public class LocalController {

	private static final Logger logger = LoggerFactory.getLogger(LocalController.class);
	
	@Autowired
	LocalService service;
	
	// 첫페이지
	@RequestMapping("start.lo")
	public String start() {
		logger.info("url ==> start");
		
		return "start";
	}
		
	// 메인페이지
	@RequestMapping("index.lo")
	public String index() {
		logger.info("url ==> index");
		
		return "index";
	}
	
	// 로그인 페이지
	@RequestMapping("login.lo")
	public String login() {
		logger.info("url ==> login");
		
		return "login";
	}
	
	// 로그아웃 페이지
	@RequestMapping("logout.lo")
	public String logout(HttpSession session) {
		logger.info("url ==> logout");
		
		session.invalidate();
		
		return "start";
	}
	
	// 회원가입 페이지 - 의사
	@RequestMapping("signin.lo")
	public String signin(HttpServletRequest req, Model model) {
		logger.info("url ==> signin");
		
		String authority = req.getParameter("authority");
		
		if(authority.equals("1")) {
			return "signin_dc";
		}else {
			return "signin_pa";
		}		
	}
		
	// 환자 이메일 인증 처리
	@RequestMapping("emailChk.lo")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("url ==> emailChk");
		
		service.emailChk(req, model);
		
		return "emailChk";
	}
	

	// 환자 회원가입 페이지 처리
	@RequestMapping("signUp_pa.lo")
	public String signUp_pa(HttpServletRequest req, Model model) {
		logger.info("url ==> signUp_pa");
		
		// 임시 관리자
		//service.insertAdmin(req, model);
		
		service.insertPatient(req, model);
		
		return "signUpPro";
	}
	
	// 중복확인 - 환자
	@RequestMapping("/confirmId_pa.lo")
	public String confirmId_pa(HttpServletRequest req, Model model) {
		logger.info("url ==> /confirmId_pa");
		
		service.confirmId_pa(req, model);
		
		return "confirmId_pa";
	}
	
	// 의사 회원가입 페이지 처리
	@RequestMapping("signUp_dc.lo")
	public String signUp_dc(HttpServletRequest req, Model model) {
		logger.info("url ==> signUp_dc");
		
		service.insertDoctor(req, model);
		
		return "signUpPro";
	}
	
	// 중복확인 - 의사
	@RequestMapping("/confirmId_dc.lo")
	public String confirmId_dc(HttpServletRequest req, Model model) {
		logger.info("url ==> /confirmId_dc");
		
		service.confirmId_dc(req, model);
		
		return "confirmId_dc";
	}
	
	// AJAX 실험
	// 임시 검색 페이지 이동
	@RequestMapping("searchTest.lo")
	public String searchTest() {
		logger.info("url ==> searchTest");
		
		return "searchTest";
	}
	
	// 임시 AJAX 화면 통으로 불러오기
	@RequestMapping("ajaxTest1")
	public String ajaxTest1() {
		logger.info("url ==> ajaxTest1");
		
		return "ajaxTest1";
	}
	// 임시 AJAX 화면 통으로 불러오기
	@RequestMapping("ajaxTest2")
	public String ajaxTest2() {
		logger.info("url ==> ajaxTest2");
		
		return "ajaxTest2";
	}
	// 임시 검색 화면 통으로 불러오기
	@RequestMapping("search")
	public String search() {
		logger.info("url ==> search");
		
		return "search";
	}
	// 임시 검색 결과 화면 통으로 불러오기
	@RequestMapping("searchPro")
	public String searchPro(HttpServletRequest req, Model model) throws Exception {
		
		logger.info("url ==> searchPro");
		
		service.searchPatients(req, model);
		
		return "searchPro";
	}
	// 임시 상세페이지 결과 화면 통으로 불러오기
	@RequestMapping("imgtest")
	public @ResponseBody String imgtest() {
		logger.info("url ==> imgtest");
		
		return "imgtest.png";
	}
	
	// 시큐리티 시험
	@RequestMapping("test.ho")
	public String test(HttpServletRequest req, Model model) {
		logger.info("url ==> test");
		
		return "test";
	}
	
	// 캘린더 시험
	@RequestMapping("fullcalendar.lo")
	public String fullcalendar() {
		logger.info("url ==> fullcalendar");
		
		return "fullcalendar";
	}
	
	// 새로운 헤더 시험
	@RequestMapping("test.lo")
	public String test2(HttpServletRequest req, Model model) {
		logger.info("url ==> test2");
		
		return "test/index";
	}
	
	/////////////////////////////////////////////////////////////////////////////////////
	// 함정화
	// 공지 목록
	@RequestMapping("board.lo")
	public String board(HttpServletRequest req, Model model) {
		logger.info("url ==> board");
		
		service.boardList(req, model);
		
		return "board";
	}
	
	// 공지 상세페이지
	@RequestMapping("boardView.lo")
	public String boardView(HttpServletRequest req, Model model) {
		logger.info("url ==> boardView");
		service.boardView(req, model);
		
		return "boardView";
	}
	
	// 댓글 작성
	   @RequestMapping("comments.lo")
	   @ResponseBody
	   public void comments(HttpServletRequest req, Model model) {
	      logger.info("url ==> comments");
	      
	      service.insertComments(req, model);
	      
	      return;
	   }
	   
	   // 댓글 불러오기
	   @RequestMapping("commentList.lo")
	   @ResponseBody
	   public List<CommentVO> commentList(HttpServletRequest req, Model model) {
	      logger.info("url ==> commentList");
	      
	      List<CommentVO> list = service.selectComments(req, model);
	   
	      return list;
	   }
	   
	   // 댓글 삭제
	   @RequestMapping("deleteComment.lo")
	   @ResponseBody
	   public void deleteComment(HttpServletRequest req, Model model) {
	      logger.info("url ==> deleteComment");
	      
	      service.deleteComment(req, model);
	      
	      return;
	   }
	   
	   // 댓글 수정 완료 버튼
	   @RequestMapping("updateComment.lo")
	   @ResponseBody
	   public void updateComment(HttpServletRequest req, Model model) {
	      logger.info("url ==> updateComment");
	      
	      service.updateComment(req, model);
	      
	      return;
	   }	


}
