package com.teampj.test.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.teampj.test.persistence.PatientDAO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class PatientServiceImpl implements PatientService{

	@Autowired
	PatientDAO dao;
	
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
			if(cnt < 3) {   // 예약환자가 3명 이하이면
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
  
		int[] delection = {0,0,0,0,0};
		for(int i=0;i<strClinic.length;i++) {
			int index = Integer.parseInt(strClinic[i]);
			delection[index] = 1;
		}
 
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
  
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("reservationNo", reservationNo);
      
	}

}
