package com.teampj.test.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.teampj.test.vo.UserVO;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 로그인이 성공한 경우에 실행한 코드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		UserVO vo = (UserVO)authentication.getPrincipal();
		System.out.println("UserVO==> " + vo);
		
		String msg = authentication.getName() + "님 환영합니다";
		System.out.println("아이디 ==> " + authentication.getName());
		String authority = request.getParameter("authority");
		System.out.println("권한 ==> " + authority);
		
		
		request.setAttribute("msg", msg);
		request.getSession().setAttribute("mem_id", authentication.getName());
		
		
		// 페이지 다만들면 경로 변경 합시다.
		if(authority.equals("0")) {	// 관리자 페이지로 이동
			request.getSession().setAttribute("authority", "ROLE_ADMIN");
			RequestDispatcher rd = request.getRequestDispatcher("/index.lo");
			rd.forward(request, response);
		} else if(authority.equals("1")) {	// 의사 페이지로 이동
			request.getSession().setAttribute("authority", "ROLE_DOCTOR");
			RequestDispatcher rd = request.getRequestDispatcher("/index.lo");
			rd.forward(request, response);
		} else {	// 환자 페이지로 이동
			request.getSession().setAttribute("authority", "ROLE_PATIENT");
			RequestDispatcher rd = request.getRequestDispatcher("/index.lo");
			rd.forward(request, response);
		}
		
		
	}

}
