package com.teampj.test.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.teampj.test.persistence.PatientDAO;
import com.teampj.test.vo.PatientVO;
import com.teampj.test.vo.SearchReservationVO;
import com.teampj.test.vo.SelfCheckVO;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class PatientServiceImpl implements PatientService{

	@Autowired
	PatientDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 비밀번호 암호화 객체
	
	
	//조울증 진단결과
	@Override
	public void BipolarDepressionResult(HttpServletRequest req, Model model) {
		float manicScore = Float.parseFloat(req.getParameter("manicScore"));
		model.addAttribute("manicScore", manicScore);
	}
	
	// 예약 - 예약시간불러오기
	@Override
	public void selectReservationTime(HttpServletRequest req, Model model) {
		String date = req.getParameter("date");
		
		System.out.println(" selectReservationTime - date : " + date);
		
		List<String> dtos = new ArrayList<String>();
		List<Integer> dtosNum = new ArrayList<Integer>();
		for (int i=0; i<RESERTVATIONTIME.length; i++) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("date", date);
			map.put("time", RESERTVATIONTIME[i]);
			int cnt = dao.selectReservationTime(map);
			if(cnt < 3) {	// 예약환자가 3명 이하이면
				dtos.add(RESERTVATIONTIME[i]);
				dtosNum.add(3-cnt);
			}
		}	
		
		model.addAttribute("i", 0);
		model.addAttribute("dtos",dtos);
		model.addAttribute("dtosNum",dtosNum);
		model.addAttribute("date", date);
	}

	// 예약처리
	@Override
	public void reservationmPro(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("mem_id");
		String date = (String)(req.getParameter("date"));
		String time = (String)(req.getParameter("apptTime"));
		String strDate = date +" "+ time;
		String[] strClinic = req.getParameterValues("addCheckup");
		
		
		System.out.println("id : " + id);
		System.out.println("date : " + strDate);
		System.out.println("clinic : " + strClinic);
		
		//진료전 예약정보가 있는가?
		int selectCnt = dao.selReservationState(id);
		
		System.out.println("selectCnt" + selectCnt);
		
		if(selectCnt == 0) {
			int[] delection = {0,0,0,0,0};
			for(int i=0;i<strClinic.length;i++) {
				int index = Integer.parseInt(strClinic[i]);
				delection[index] = 1;
			}
			/*
			 * for(int i=0; i < strClinic.length; i++) { System.out.println(i + " : " +
			 * strClinic[i] + "    #######"); selectClinic += strClinic[i]; }
			 */
			
			String name = dao.selectPatientName(id);
			System.out.println("name: " + name);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", id);
			map.put("name", name);
			map.put("strDate", strDate);
			map.put("delections", delection);
			
			
			int insertCnt = dao.insertReservation(map);
			System.out.println("insertCnt" + insertCnt);
			
			int reservationNo = 0;
			if(insertCnt == 1) {
				reservationNo = dao.selReservateionNo(id);
				
			}
			
			/*
			 * String[] arrClinic = strClinic.split(","); for(int i=0; i<arrClinic.length;
			 * i++) { String clinicName = arrClinic[i]; if(clinicName.equals("유방암")) }
			 */
			
			model.addAttribute("date", date);
			model.addAttribute("time", time);
			model.addAttribute("reservationNo", reservationNo);
			model.addAttribute("selectCnt", selectCnt);
		}else {
			model.addAttribute("selectCnt", selectCnt);
		}
		
	}
	
	//조울증 진단결과
	public void bipolarDepressionResult(HttpServletRequest req, Model model) {
		float manicScore = Float.parseFloat(req.getParameter("manicScore"));
		model.addAttribute("manicScore", manicScore);
	}

	//조울증 진단결과 제출
	@Override
	public void bipolarResultPro(HttpServletRequest req, Model model) {
		float manic = Float.parseFloat(req.getParameter("manicScore"));	//진단점수
		System.out.println("manic : " + manic);
		String manicResult = req.getParameter("message");		//진단결과
		System.out.println("manicResult : " + manicResult);
		String patientID = (String)req.getSession().getAttribute("mem_id");		//환자 아이디
		System.out.println("patientID : " + patientID);
		
		SelfCheckVO vo = new SelfCheckVO();
		vo.setManicDepression(manic);
		vo.setManicResult(manicResult);
		vo.setPatientID(patientID);
		vo.setChkDate(new Timestamp(System.currentTimeMillis()));
		
		int selectCnt = dao.bipolarInsertCheck(patientID);
		int updateCnt = 0;
		int insertCnt = 0;
		
		System.out.println("selectCnt : " + selectCnt);
		
		if(selectCnt==1) {		//우울증에서 먼저 인서트 된 경우
			updateCnt = dao.updateBipolar(vo);
			model.addAttribute("selectCnt", selectCnt);
			model.addAttribute("updateCnt",updateCnt);
		} else { 	//우울증에서 인서트 안돼있는 경우
			insertCnt = dao.insertBipolar(vo);
			model.addAttribute("selectCnt", selectCnt);
			model.addAttribute("insertCnt",insertCnt);
		}
	}

	
	//우울증 진단결과
	@Override
	public void depressionResult(HttpServletRequest req, Model model) {
		int depScore = Integer.parseInt(req.getParameter("depScore"));
		model.addAttribute("depScore", depScore);
		
	}
	
	//우울증 결과제출
	@Override
	public void depressionResultPro(HttpServletRequest req, Model model) {
		int depression = Integer.parseInt(req.getParameter("depScore"));	//진단점수
		System.out.println("depression : " + depression);
		String depResult = req.getParameter("message");		//진단결과
		System.out.println("depResult : " + depResult);
		String patientID = (String)req.getSession().getAttribute("mem_id");		//환자 아이디
		System.out.println("patientID : " + patientID);
		
		SelfCheckVO vo = new SelfCheckVO();
		vo.setDepression(depression);
		vo.setDepResult(depResult);
		vo.setPatientID(patientID);
		vo.setChkDate(new Timestamp(System.currentTimeMillis()));
		
		int selectCnt = dao.depressionInsertCheck(patientID);
		int updateCnt = 0;
		int insertCnt = 0;
		
		System.out.println("selectCnt : " + selectCnt);
		
		if(selectCnt==1) {		//우울증에서 먼저 인서트 된 경우
			updateCnt = dao.updateDepression(vo);
			model.addAttribute("selectCnt", selectCnt);
			model.addAttribute("updateCnt",updateCnt);
		} else { 	//우울증에서 인서트 안돼있는 경우
			insertCnt = dao.insertDepression(vo);
			model.addAttribute("selectCnt", selectCnt);
			model.addAttribute("insertCnt",insertCnt);
		}
		
	}
	
	//예약 조회
	@Override
	public void searchreservation(HttpServletRequest req, Model model) {
		
		String id = (String)req.getSession().getAttribute("mem_id");
		
		
		SearchReservationVO vo = dao.searchreservation(id);
		
		model.addAttribute("vo", vo);
	}

	//예약 삭제
	@Override
	public void deleteReservation(HttpServletRequest req, Model model) {
		int reservationNo = Integer.parseInt(req.getParameter("reservationNo"));
		int deleteCnt = dao.deleteReservation(reservationNo);
		
		model.addAttribute("deleteCnt", deleteCnt);
		
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
