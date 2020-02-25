package com.teampj.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DoctorService {
	// 진단에서 환자 검색기능
	void diagnosis(HttpServletRequest req, Model model);
}
