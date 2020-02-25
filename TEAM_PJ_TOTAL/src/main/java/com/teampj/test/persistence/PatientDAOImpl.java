package com.teampj.test.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PatientDAOImpl implements PatientDAO{

	@Autowired
	SqlSession sqlSession;
	
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

	@Override
	public int selReservateionNo(String id) {
		int cnt = sqlSession.selectOne("com.teampj.test.persistence.PatientDAO.selReservateionNo", id);
		return cnt;
	}
}
