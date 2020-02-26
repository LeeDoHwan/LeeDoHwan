package com.teampj.test.persistence;

import java.util.Map;

import com.teampj.test.vo.PatientVO;
import com.teampj.test.vo.SearchReservationVO;
import com.teampj.test.vo.SelfCheckVO;

public interface PatientDAO {
	//예약환자 수 (이도환)
	public int selectReservationTime(Map<String,Object> map);
	//예약환자 이름(박미성)
	public String selectPatientName(String id);
	//예약처리(박미성)
	public int insertReservation(Map<String, Object> map);
	//예약 번호
	public int selReservateionNo(String id);
	// 예약상태(박미성)
	public int selReservationState(String id);
	// 김동규
	//조울증 자가진단 인서트 되어 있는지 체크
	public int bipolarInsertCheck(String patientID);
	//조울증 인서트
	public int insertBipolar(SelfCheckVO vo);
	//조울증 업데이트
	public int updateBipolar(SelfCheckVO vo);
	//우울증 자가진단 인서트 되어 있는지 체크
	public int depressionInsertCheck(String patientID);
	//우울증 인서트
	public int insertDepression(SelfCheckVO vo);
	//우울증 업데이트
	public int updateDepression(SelfCheckVO vo);
	//예약 조회(박건형)
	public SearchReservationVO searchreservation(String id);
	//예약 취소(박건형)
	public int deleteReservation(int reservationNo);
	// 마이페이지 정보 (환자 한 명)
	public PatientVO getMyPageContents(String id);
	
	// 원래 비밀번호 가져오기 .
	public String getPwd(String id);
	
	// 새로운 비밀번호 설정
	public int updatePwd(Map<String, Object> map);
	
	// 새로운 주소 설정
	public int updateAddr(Map<String, Object> map);
	
	// 새로운 정보(핸드폰 번호) 설정
	public int updateInfo(Map<String, Object> map);
	
}
