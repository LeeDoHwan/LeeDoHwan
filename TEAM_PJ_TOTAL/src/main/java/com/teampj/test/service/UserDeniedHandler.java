package com.teampj.test.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;

@Service
public class UserDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

		request.setAttribute("errMsg", "관리자만 접근할 수 있는 페이지입니다. 관리자가 아닙니다.");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/denied.jsp");
		rd.forward(request, response);
	}

}
