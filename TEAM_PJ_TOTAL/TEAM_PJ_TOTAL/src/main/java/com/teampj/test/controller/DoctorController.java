package com.teampj.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.test.service.DoctorService;

@Controller
public class DoctorController {
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);
	
	@Autowired
	DoctorService service;
	
	// 의사	
	
	// 진료 - 진단 
	@RequestMapping("diagnosis.dr")
	public String diagnosis(HttpServletRequest req, Model model) {
		logger.info("url ==> diagnosis");
		
		service.diagnosis(req, model);
		return "dr/diagnosis";
	}	
	
	// 스케줄 관리 
	@RequestMapping("schedule.dr")
	public String schedule() {
		logger.info("url ==> schedule");
		
		return "dr/schedule";
	}
	
	// 환자관리 - 환자 조회 
	@RequestMapping("patientinfo.dr")
	public String patientinfo() {
		logger.info("url ==> patientinfo");
		
		return "dr/patientinfo";
	}
	

}
