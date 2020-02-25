package com.teampj.test.persistence;


import java.util.Map;

import com.teampj.test.vo.PatientVO;

public interface PatientDAO {

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
