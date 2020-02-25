package com.teampj.test.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.teampj.test.vo.AdminVO;
import com.teampj.test.vo.DoctorVO;
import com.teampj.test.vo.PatientVO;

public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder ) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	// 로그인이 실패할 경우 자동으로 실행되는 코드 
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
		System.out.println("실패 ");
		String strId =  request.getParameter("id");
		String strPwd = request.getParameter("pwd");
		String authority = request.getParameter("authority");
		
		if(authority.equals("0")) {	// 관리자
			AdminVO vo = sqlSession.selectOne("com.teampj.test.persistence.LocalDAO.selectAdmin",strId);
			if(vo==null) {
				System.out.println("널");
				request.setAttribute("errMsg", "아이디가 일치하지 않습니다.");
			}else {
				String pwd = vo.getAdminPW();
				if(passwordEncoder.matches(strPwd, pwd)) {
					request.setAttribute("errMsg", "이메일 인증하세요.");
				}else {
					request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
				}
			}
		} else if(authority.equals("1")) {	// 의사
			DoctorVO vo = sqlSession.selectOne("com.teampj.test.persistence.LocalDAO.selectDoctor",strId);
			if(vo==null) {
				request.setAttribute("errMsg", "아이디가 일치하지 않습니다.");
			}else {
				String pwd = vo.getDoctorPW();
				if(passwordEncoder.matches(strPwd, pwd)) {
					request.setAttribute("errMsg", "이메일 인증하세요.");
				}else {
					request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
				}
			}
		} else {	// 환자
			PatientVO vo = sqlSession.selectOne("com.teampj.test.persistence.LocalDAO.selectPatient",strId);
			if(vo==null) {
				request.setAttribute("errMsg", "아이디가 일치하지 않습니다.");
			}else {
				String pwd = vo.getPatientPW();
				if(passwordEncoder.matches(strPwd, pwd)) {
					request.setAttribute("errMsg", "이메일 인증하세요.");
				}else {
					request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
				}
			}
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/start.jsp");
		rd.forward(request, response);
	}

}
