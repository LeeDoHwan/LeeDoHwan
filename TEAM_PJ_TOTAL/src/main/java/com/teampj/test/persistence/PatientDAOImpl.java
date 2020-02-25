package com.teampj.test.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PatientDAOImpl implements PatientDAO{

	@Autowired
	SqlSession sqlSession;

	//예약환자 수 (이도환)
	@Override
	public int selectReservationTime(Map<String, Object> map) {
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		return dao.selectReservationTime(map);
	}
	
	// 환자이름(박미성)
	@Override
	public String selectPatientName(String id) {
		
		return sqlSession.selectOne("com.teampj.test.persistence.PatientDAO.selectPatientName", id);
	}

	//예약처리(박미성)
	@Override
	public int insertReservation(Map<String, Object> map) {
		int cnt = sqlSession.insert("com.teampj.test.persistence.PatientDAO.insertReservation", map);
		return cnt;
	}

	//예약 번호(박미성)
	@Override
	public int selReservateionNo(String id) {
		int cnt = sqlSession.selectOne("com.teampj.test.persistence.PatientDAO.selReservateionNo", id);
		return cnt;
	}

	//예약 상태(박미성)
	@Override
	public int selReservationState(String id) {
		Integer result = 0;
		result = sqlSession.selectOne("com.teampj.test.persistence.PatientDAO.selReservationState", id);
		if(result == null) {
			result = 0;
			return result;
		}else {
			return result;
		}
	}
}
