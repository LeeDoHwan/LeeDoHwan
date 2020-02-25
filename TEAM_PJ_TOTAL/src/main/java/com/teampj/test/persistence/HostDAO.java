package com.teampj.test.persistence;

import java.util.List;

import com.teampj.test.vo.BoardVO;
import com.teampj.test.vo.DoctorVO;

public interface HostDAO {
	// 의사 인원
	public int doctorCnt();

	// 의사 리스트
	public List<DoctorVO> getDoctorList();
		
	// 의사 가입승인
	public int signConfirm(DoctorVO vo);
	
	// 게시판
	public int insertBoard(BoardVO vo);

	public int updateBoard(BoardVO vo);

	public int deleteBoard(int boardNO);
}
