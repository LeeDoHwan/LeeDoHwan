package com.teampj.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teampj.test.service.LocalService;


//@Controller
public class TestController {

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	LocalService service;
	
	@RequestMapping("index.lo")
	public String index() {
		logger.info("url ==> index");
		
		return "index";
	}
	
	@RequestMapping("start.lo")
	public String start() {
		logger.info("url ==> start");
		
		return "start";
	}
	
	@RequestMapping("login.lo")
	public String login() {
		logger.info("url ==> login");
		
		return "login";
	}
	
	// 임시 회원가입 페이지 이동
	@RequestMapping("signInTest.lo")
	public String signInTest() {
		logger.info("url ==> signInTest");
		
		return "signInTest";
	}
	
	// 임시 이메일 인증 처리
	@RequestMapping("emailChk.lo")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("url ==> emailChk");
		
		service.emailChk(req, model);
		
		// 나중에 수정할 것
		return "login";
	}
	
	
	// 임시 검색 페이지 이동
	@RequestMapping("searchTest.lo")
	public String searchTest() {
		logger.info("url ==> searchTest");
		
		return "searchTest";
	}
	
	// 임시 회원가입 페이지 처리
	@RequestMapping("signUpTest.lo")
	public String signUpTest(HttpServletRequest req, Model model) {
		logger.info("url ==> signUpTest");
		
		// 임시 관리자
		service.insertAdmin(req, model);
		// service.insertPatient(req, model);
		// 바꿔야함
		return "start";
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
	
	@RequestMapping("test.dc")
	public String test(HttpServletRequest req, Model model) {
		logger.info("url ==> test");
		
		return "test";
	}
}
