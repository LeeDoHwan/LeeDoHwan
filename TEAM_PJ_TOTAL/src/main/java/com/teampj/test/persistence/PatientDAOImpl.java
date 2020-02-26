package com.teampj.test.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teampj.test.vo.PatientVO;
import com.teampj.test.vo.SearchReservationVO;
import com.teampj.test.vo.SelfCheckVO;

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
	
	// 김동규
	//조울증 자가진단 인서트 되어 있는지 체크
	@Override
	public int bipolarInsertCheck(String patientID) {
		return sqlSession.getMapper(PatientDAO.class).bipolarInsertCheck(patientID);
	}

	//조울증 인서트
	@Override
	public int insertBipolar(SelfCheckVO vo) {
		return sqlSession.getMapper(PatientDAO.class).insertBipolar(vo);
	}

	//조울증 업데이트
	@Override
	public int updateBipolar(SelfCheckVO vo) {
		return sqlSession.getMapper(PatientDAO.class).updateBipolar(vo);
	}

	//우울증 인서트 되어있는지 체크
	@Override
	public int depressionInsertCheck(String patientID) {
		return sqlSession.getMapper(PatientDAO.class).depressionInsertCheck(patientID);
	}

	//우울증 인서트
	@Override
	public int insertDepression(SelfCheckVO vo) {
		return sqlSession.getMapper(PatientDAO.class).insertDepression(vo);
	}

	//우울증 업데이트
	@Override
	public int updateDepression(SelfCheckVO vo) {
		return sqlSession.getMapper(PatientDAO.class).updateDepression(vo);
	}
	
	//예약조회(박건형)
	@Override
	public SearchReservationVO searchreservation(String id) {
		SearchReservationVO vo = sqlSession.selectOne("com.teampj.test.persistence.PatientDAO.searchreservation", id);
		return vo;
	}
	//예약취소(박건형)
	@Override
	public int deleteReservation(int reservationNo) {
		int deleteCnt = sqlSession.delete("com.teampj.test.persistence.PatientDAO.deleteReservation", reservationNo);
		return deleteCnt;
	}
	
	// 허소정
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
