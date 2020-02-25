package com.teampj.test.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.test.persistence.HostDAO;
import com.teampj.test.persistence.LocalDAO;
import com.teampj.test.vo.BoardVO;
import com.teampj.test.vo.DoctorVO;

@Service
public class HostServiceImpl implements HostService{

	@Autowired
	HostDAO dao;
	
	@Autowired
	LocalDAO ldao;
	
	// 의사 리스트 가져오기
	@Override
	public void getDoctorList(HttpServletRequest req, Model model) {
		// 등록된 의사 수 구하기
		int cnt = dao.doctorCnt();
		List<DoctorVO> dto = null;
		System.out.println("cnt : " + cnt);
		if(cnt > 0) {
			// 등록된 의사가 있을경우 리스트 가져오기
			dto = dao.getDoctorList();
			model.addAttribute("dtos",dto);
		}
		model.addAttribute("cnt",cnt);
	}
		
	// 의사 가입 승인 및 부서정해주기
	@Override
	public void signConfirm(HttpServletRequest req, Model model) {
		// 승인할 의사 정보 가져오기
		int departmentNum = Integer.parseInt(req.getParameter("departmentNum"));
		String enabled = req.getParameter("enabled");
		String doctorID = req.getParameter("doctorID");
		
		DoctorVO vo = new DoctorVO();
		
		// 바구니에 담기
		vo.setDepartmentNum(departmentNum);
		vo.setEnabled(enabled);
		vo.setDoctorID(doctorID);
		System.out.println(vo.getDepartmentNum());
		System.out.println(vo.getEnabled());
		System.out.println(vo.getDoctorID());
		// 가입승인 및 부서 업데이트
		int updateCnt = dao.signConfirm(vo);
			
		model.addAttribute("updateCnt",updateCnt);
	}
	
	// 게시판

	@Override
	public void boardWritePro(HttpServletRequest req, Model model) {
		BoardVO vo = new BoardVO();
		
		String writer = (String) req.getSession().getAttribute("mem_id");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		vo.setWriter(writer);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		int insertCnt = dao.insertBoard(vo);
		
		model.addAttribute("writer", writer);
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void boardModifyForm(HttpServletRequest req, Model model) {
		int boardNO = Integer.parseInt(req.getParameter("boardNO"));
		BoardVO vo = null;
		
		vo = ldao.getArticle(boardNO);
		
		model.addAttribute("dto", vo);
		model.addAttribute("boardNO", boardNO);
	}
	
	@Override
	public void boardModifyPro(HttpServletRequest req, Model model) {
		int boardNO = Integer.parseInt(req.getParameter("boardNO"));
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		int updateCnt = 0;
		BoardVO vo = new BoardVO();
		
		vo.setBoardNO(boardNO);
		vo.setSubject(subject);
		vo.setContent(content);
		
 		updateCnt = dao.updateBoard(vo);
 		
 		model.addAttribute("updateCnt", updateCnt);
	}
	
	@Override
	public void boardDeletePro(HttpServletRequest req, Model model) {
		int boardNO = Integer.parseInt(req.getParameter("boardNO"));
		int deletCnt = 0;
	
		deletCnt = dao.deleteBoard(boardNO);
		System.out.println(deletCnt);
		
		model.addAttribute("deletCnt", deletCnt);
		model.addAttribute("boardNO", boardNO);
	}
}
