package com.teampj.test.service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.test.persistence.DoctorDAO;
import com.teampj.test.persistence.LocalDAO;
import com.teampj.test.vo.PatientVO;
import com.teampj.test.vo.ReservationVO;

@Service
public class DoctorServiceImpl implements DoctorService{

	@Autowired
	DoctorDAO dao;
	@Autowired
	LocalDAO ldao;
	
	@Override
	public void diagnosis(HttpServletRequest req, Model model) {
		String patientName = req.getParameter("patientName");
		System.out.println(patientName);
		List<ReservationVO> list = dao.selectReservationList();
		model.addAttribute("dtos",list);
		
		if(patientName != null) {
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			int nYear = calendar.get(Calendar.YEAR) - 1900;
			int nMonth = calendar.get(Calendar.MONTH);
			int nDay = calendar.get(Calendar.DAY_OF_MONTH);
	
			Timestamp reservationTime = new Timestamp(nYear,nMonth,nDay,9,0,0,0);
			System.out.println(reservationTime);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("patientName", patientName);
			map.put("reservationTime", reservationTime);
			
			ReservationVO rvo = dao.selectReservation(map);
			System.out.println(rvo);
			if(rvo != null) {
				String patientID = rvo.getPatientID();
				PatientVO pvo = ldao.selectPatient(patientID);
				System.out.println(pvo);
				model.addAttribute("vo", pvo);
			}
			
		}
	}
	
}
