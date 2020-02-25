package com.teampj.test.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teampj.test.vo.PatientVO;

@Repository
public class PatientDAOImpl implements PatientDAO {

	@Autowired
	SqlSession sqlSession;
	

	@Override
	public PatientVO getMyPageContents(String id) {
		
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		return dao.getMyPageContents(id);
	}

	@Override
	public String getPwd(String id) {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		return dao.getPwd(id);
	}

	@Override
	public int updatePwd(Map<String, Object> map) {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		return dao.updatePwd(map);
	}

	@Override
	public int updateAddr(Map<String, Object> map) {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		return dao.updateAddr(map);
	}

	@Override
	public int updateInfo(Map<String, Object> map) {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		return dao.updateInfo(map);
	}
}
