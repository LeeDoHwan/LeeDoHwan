package com.teampj.test.persistence;

import java.util.List;
import java.util.Map;

import com.teampj.test.vo.CardVO;

public interface PatientDAO {
	//예약환자 수 (이도환)
	public int selectReservationTime(Map<String,Object> map);
	
	//예약환자 이름(박미성)
	public String selectPatientName(String id);
	
	//예약처리(박미성)
	public int insertReservation(Map<String, Object> map);
	
	//예약 번호
	public int selReservateionNo(String id);
	
	// 등록 카드 정보 가져오기(한상진)
	public List<CardVO> getCardInfo(String patientID);
		
	// 등록 카드 유무
	public int cardCnt(String patientID);
}
