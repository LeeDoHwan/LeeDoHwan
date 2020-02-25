package com.teampj.test.persistence;

import java.util.List;
import java.util.Map;

import com.teampj.test.vo.ReservationVO;

public interface DoctorDAO {
	// 예약환자 불러오기
	ReservationVO selectReservation(Map<String, Object> map);
	// 예약환자 목록 불러오기(현재 날짜로)
	List<ReservationVO> selectReservationList();
}
