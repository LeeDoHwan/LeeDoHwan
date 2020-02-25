package com.teampj.test.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.teampj.test.persistence.PatientDAO;
import com.teampj.test.vo.PatientVO;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class PatientServiceImpl implements PatientService{

	@Autowired
	PatientDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//조울증 진단결과
	@Override
	public void BipolarDepressionResult(HttpServletRequest req, Model model) {
		float manicScore = Float.parseFloat(req.getParameter("manicScore"));
		model.addAttribute("manicScore", manicScore);
	}

	// 마이페이지 
	@Override
	public void myPageContents(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		String id = (String) req.getSession().getAttribute("mem_id");
		
		PatientVO vo = dao.getMyPageContents(id);
		
		model.addAttribute("vo", vo);
	}

	// 마이페이지 수정 - 비밀번호
	@Override
	public void myPageModPw(HttpServletRequest req, Model model) {
		System.out.println("patientService - myPageModPw");
		
		int udtCnt = 0; 
		
		String id = (String) req.getSession().getAttribute("mem_id");
		
		String prePatientPW = req.getParameter("prePatientPW"); // 기존 비밀번호 확인
		String newPatientPW = req.getParameter("newPatientPW"); // 신규 비밀번호
		String newPatientPWchk = req.getParameter("newPatientPWchk"); // 신규 비밀번호 확인 
		
		String patientPW = dao.getPwd(id); // 기존 비밀번호 
		
		System.out.println("prePatientPW : " + prePatientPW);
		
		boolean qualify = passwordEncoder.matches(prePatientPW, patientPW);
		
		// 기존 비밀번호와 입력한 비밀번호 확인 
		if(!qualify) { // 기존 비밀번호 != 입력 비밀번호
			
			model.addAttribute("udtCnt",udtCnt);
			System.out.println("@@@@@@ !qualify @@@@@@");
			return;
		
		} else { // 기존 비밀번호 == 입력 비밀번호 
			// 새로운 비밀번호 확인 
			if(newPatientPW.equals(newPatientPWchk)) {
				String encryptPassword = passwordEncoder.encode(newPatientPWchk);
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("patientPW", encryptPassword);
				map.put("patientID", id);
				
				udtCnt = dao.updatePwd(map);
				System.out.println("qualify> if> udtCnt : " + udtCnt);
			}
		}
		
		model.addAttribute("udtCnt", udtCnt);
	}

	// 마이페이지 수정 - 내 정보
	@Override
	public void myPageModInfo(HttpServletRequest req, Model model) {
		System.out.println("patientService - myPageModInfo");
		
		int udtCnt = 0; 
		
		String id = (String) req.getSession().getAttribute("mem_id");
		
		String tel = req.getParameter("tel"); // 전화번호
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("patientID", id);
		map.put("tel", tel);
		
		udtCnt = dao.updateInfo(map);
		
		if(udtCnt != 1) {
			udtCnt = -2;
		}
		
		model.addAttribute("udtCnt", udtCnt);
	}

	// 마이페이지 수정 - 주소
	@Override
	public void myPageModAddr(HttpServletRequest req, Model model) {
		System.out.println("patientService - myPageModAddr");
		
		int udtCnt = 0; 
		
		String id = (String) req.getSession().getAttribute("mem_id");
		
		String address1 = req.getParameter("address1"); // 우편번호
		String address2 = req.getParameter("address2"); // 지번주소
		String address3 = req.getParameter("address3"); // 상세주소
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("patientID", id);
		map.put("address1", address1);
		map.put("address2", address2);
		map.put("address3", address3);
		
		udtCnt = dao.updateAddr(map);
		
		// Pro 페이지에서 다른 alert을 띄우기 위해 -1로 주기.
		if(udtCnt != 1) {
			udtCnt = -1;
		}
		model.addAttribute("udtCnt", udtCnt);
		
	}
	

	
}
