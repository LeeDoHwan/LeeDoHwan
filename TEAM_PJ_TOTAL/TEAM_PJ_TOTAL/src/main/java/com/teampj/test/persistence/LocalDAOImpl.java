package com.teampj.test.persistence;

import java.net.InetAddress;
import java.util.List;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.teampj.test.vo.AdminVO;
import com.teampj.test.vo.BoardVO;
import com.teampj.test.vo.CommentVO;
import com.teampj.test.vo.DoctorVO;
import com.teampj.test.vo.PatientVO;

@Repository
public class LocalDAOImpl implements LocalDAO{

	@Autowired
	SqlSession sqlSession;

	@Autowired
    private JavaMailSender mailSender; // xml에 등록한 bean autowired
	
	@Override
	public AdminVO selectAdmin(String adminID) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.selectAdmin(adminID);
	}

	@Override
	public DoctorVO selectDoctor(String doctorID) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.selectDoctor(doctorID);
	}

	@Override
	public PatientVO selectPatient(String patientID) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.selectPatient(patientID);
	}
	
	@Override
	public List<PatientVO> selectPatientList(String keyword) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.selectPatientList(keyword);
	}

	@Override
	public void sendMail(String toEmail, String key) {
		try{
			InetAddress local = InetAddress.getLocalHost();
			String ip = local.getHostAddress();
			System.out.println("ip : " + ip);
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "회원가입 인증 메일입니다. 링크를 눌러 회원가입을 완료하세요." 

			+ "<a href='http://"+ip+"/test/emailChk.lo?key=" + key + "'>Please click</a>";
            System.out.println(txt);
          message.setSubject("회원가입 인증 메일입니다.");
          message.setText(txt, "UTF-8", "html");
          message.setFrom(new InternetAddress("admin@mss.com"));
          message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
          mailSender.send(message);
		}catch(Exception e){
		          e.printStackTrace();
		}  
	}

	@Override
	public int updatePatientEnabled(String key) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.updatePatientEnabled(key);
	}

	@Override
	public int insertPatient(PatientVO vo) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.insertPatient(vo);
	}

	@Override
	public int insertDoctor(DoctorVO vo) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.insertDoctor(vo);
	}

	@Override
	public int insertAdmin(AdminVO vo) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.insertAdmin(vo);
	}
	
	@Override
	public int getArticleCnt() {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.getArticleCnt();
	}

	@Override
	public List<BoardVO> getArticleList() {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		return dao.getArticleList();
	}

	@Override
	public BoardVO getArticle(int boardNO) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		return dao.getArticle(boardNO);
	}
	
	@Override
	public int insertComments(CommentVO vo) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		return dao.insertComments(vo);
	}

	@Override
	public List<CommentVO> selectCommentList(int boardNO) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.selectCommentList(boardNO);
	}

	@Override
	public int deleteComment(int commentNO) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.deleteComment(commentNO);	
	}

	@Override
	public int updateComment(CommentVO vo) {
		LocalDAO dao = sqlSession.getMapper(LocalDAO.class);
		
		return dao.updateComment(vo);
	}


	
}
