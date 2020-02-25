package com.teampj.test.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teampj.test.vo.BoardVO;
import com.teampj.test.vo.DoctorVO;

@Repository
public class HostDAOImpl implements HostDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	// 의사수 구하기
	@Override
	public int doctorCnt() {
		HostDAO dao = sqlSession.getMapper(HostDAO.class);
		return dao.doctorCnt();
	}

	// 의사 리스트
	@Override
	public List<DoctorVO> getDoctorList() {
		HostDAO dao = sqlSession.getMapper(HostDAO.class);
		return dao.getDoctorList();
	}
	// 의사 가입승인 및 부서 정하기
	@Override
	public int signConfirm(DoctorVO vo) {
		HostDAO dao = sqlSession.getMapper(HostDAO.class);
		return dao.signConfirm(vo);
	}
	
	///////////////////////////////////////////////////////////////////////
	// 정화
	
	@Override
	public int insertBoard(BoardVO vo) {
		HostDAO dao = sqlSession.getMapper(HostDAO.class);
		return dao.insertBoard(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		HostDAO dao = sqlSession.getMapper(HostDAO.class);
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int boardNO) {
		HostDAO dao = sqlSession.getMapper(HostDAO.class);
		return dao.deleteBoard(boardNO);
	}
}
