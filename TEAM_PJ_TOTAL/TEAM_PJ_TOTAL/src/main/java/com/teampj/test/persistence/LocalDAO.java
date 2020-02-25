package com.teampj.test.persistence;

import java.util.List;

import com.teampj.test.vo.AdminVO;
import com.teampj.test.vo.BoardVO;
import com.teampj.test.vo.CommentVO;
import com.teampj.test.vo.DoctorVO;
import com.teampj.test.vo.PatientVO;

public interface LocalDAO {

	// 관리자 정보 읽어오기(한명)
	public AdminVO selectAdmin(String adminID);
	
	// 의사 정보 읽어오기(한명) 
	public DoctorVO selectDoctor(String doctorID);
	
	// 환자 정보 읽어오기(한명)
	public PatientVO selectPatient(String patientID);
	
	// 환자들 정보 읽어오기(여러명)
	public List<PatientVO> selectPatientList(String keyword);
	
	// 이메일 인증
	public void sendMail(String toEmail, String key);
	
	// 이메일 인증 처리
	public int updatePatientEnabled(String key);
	
	// 회원가입 - 임시
	public int insertPatient(PatientVO vo);
	// 회원가입 - 임시
	public int insertDoctor(DoctorVO vo);
	// 회원가입 - 임시
	public int insertAdmin(AdminVO vo);
	
	// 게시판 갯수
	public int getArticleCnt();
	// 게시글 전체 읽어오기
	public List<BoardVO> getArticleList();
	// 게시글 하나 읽어오기
	public BoardVO getArticle(int boardNO);
	
	public int insertComments(CommentVO vo);
	
	public List<CommentVO> selectCommentList(int boardNO);
	
	public int deleteComment(int commentNO);
	
	public int updateComment(CommentVO vo);
	
	
}
