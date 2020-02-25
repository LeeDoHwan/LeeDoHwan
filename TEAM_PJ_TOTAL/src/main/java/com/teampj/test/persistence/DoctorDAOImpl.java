package com.teampj.test.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teampj.test.vo.ReservationVO;

@Repository
public class DoctorDAOImpl implements DoctorDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public ReservationVO selectReservation(Map<String, Object> map) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		
		return dao.selectReservation(map);
	}

	@Override
	public List<ReservationVO> selectReservationList() {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		
		return dao.selectReservationList();
	}
}
