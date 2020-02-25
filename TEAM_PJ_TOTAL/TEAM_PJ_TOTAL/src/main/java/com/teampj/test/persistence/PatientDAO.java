package com.teampj.test.persistence;

import java.util.Map;

public interface PatientDAO {
	//예약환자 수 (이도환)
	public int selectReservationTime(Map<String,Object> map);
	//예약환자 이름(박미성)
	public String selectPatientName(String id);
	//예약처리(박미성)
	public int insertReservation(Map<String, Object> map);
	//예약 번호
	public int selReservateionNo(String id);
}
