package com.teampj.test.service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.test.persistence.LocalDAO;
import com.teampj.test.vo.AdminVO;
import com.teampj.test.vo.BoardVO;
import com.teampj.test.vo.CommentVO;
import com.teampj.test.vo.DoctorVO;
import com.teampj.test.vo.PatientVO;

@Service
public class LocalServiceImpl implements LocalService{

	@Autowired
	LocalDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;	// 비밀번호 암호화 객체
	
	@Override
	public void insertPatient(HttpServletRequest req, Model model) {
		PatientVO vo = new PatientVO();
		
		String patientID = req.getParameter("patientID");
		vo.setPatientID(patientID);
		String patientPW = req.getParameter("patientPW");
		vo.setPatientPW(passwordEncoder.encode(patientPW));
		String patientName = req.getParameter("patientName");
		vo.setPatientName(patientName);
		String jumin1 = req.getParameter("jumin1");
		vo.setJumin1(jumin1);
		String jumin2 = req.getParameter("jumin2");
		vo.setJumin2(jumin2);
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		
		if(jumin2.substring(0, 1).equals("1")) {
			int age = nYear - Integer.parseInt("19" + jumin1.substring(0, 2));
			vo.setAge(age);
			vo.setGender(1);
		}else if(jumin2.substring(0, 1).equals("2")) {
			int age = nYear - Integer.parseInt("19" + jumin1.substring(0, 2));
			vo.setAge(age);
			vo.setGender(0);
		}else if(jumin2.substring(0, 1).equals("3")) {
			int age = nYear - Integer.parseInt("20" + jumin1.substring(0, 2));
			vo.setAge(age);
			vo.setGender(1);
		}else if(jumin2.substring(0, 1).equals("4")) {
			int age = nYear - Integer.parseInt("20" + jumin1.substring(0, 2));
			vo.setAge(age);
			vo.setGender(0);
		}
		
		
		
		// 전화번호
		String tel = "";
		String ph1 = req.getParameter("hp1");
		String ph2 = req.getParameter("hp1");
		String ph3 = req.getParameter("hp1");
		
		// hp가 필수가 아니므로 null값이 들어올 수 있으므로
		if(!ph2.equals("") && !ph3.equals("")) {
			tel = ph1 + "-" + ph2 + "-" + ph3;
		}
		vo.setTel(tel);
		vo.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		vo.setAddress1(req.getParameter("postCode"));
		vo.setAddress2(req.getParameter("add1"));
		vo.setAddress3(req.getParameter("add2"));
		String email = req.getParameter("email");
		vo.setEmail(email);
		// Email 인증
		// 인증 키 부분
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i=0;i<6;i++) {
			int rIndex = rnd.nextInt(2);
			switch(rIndex) {
			case 0:
				temp.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 1:
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String key = temp.toString();
		
		vo.setKey(key);
		
		int insertCnt = dao.insertPatient(vo);

		System.out.println(insertCnt);
		if(insertCnt != 0) {
			dao.sendMail(email, key);
		}
		model.addAttribute("insertCnt", insertCnt);
	}
	
	@Override
	public void insertDoctor(HttpServletRequest req, Model model) {
		DoctorVO vo = new DoctorVO();
		
		String doctorID = req.getParameter("doctorID");
		vo.setDoctorID(doctorID);
		String doctorPW = req.getParameter("doctorPW");
		vo.setDoctorPW(passwordEncoder.encode(doctorPW));
		String doctorName = req.getParameter("doctorName");
		vo.setDoctorName(doctorName);
		String email = req.getParameter("email");
		vo.setEmail(email);
		String licence = req.getParameter("licence");
		vo.setLicence(licence);
		String tel = req.getParameter("tel");
		vo.setTel(tel);

		int insertCnt = dao.insertDoctor(vo);

		System.out.println(insertCnt);
	
		model.addAttribute("insertCnt", insertCnt);
	}
	
	@Override
	public void insertAdmin(HttpServletRequest req, Model model) {
		AdminVO vo = new AdminVO();
		
		String AdminID = req.getParameter("patientID");
		vo.setAdminID(AdminID);
		String AdminPW = req.getParameter("patientPW");
		vo.setAdminPW(passwordEncoder.encode(AdminPW));
		
		int insertCnt = dao.insertAdmin(vo);
		System.out.println(insertCnt);
		model.addAttribute("insertCnt", insertCnt);
	}
	
	
	@Override
	public void searchPatients(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		System.out.println(keyword);
		List<PatientVO> list = dao.selectPatientList(keyword);
		
		model.addAttribute("dtos",list);
	}

	@Override
	public void emailChk(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		
		int updateCnt = dao.updatePatientEnabled(key);

		model.addAttribute("updateCnt",updateCnt);
	}

	@Override
	public void confirmId_pa(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		String patientID = req.getParameter("patientID");
		
		// 5단계. 중복된 id가 있는지 확인
		PatientVO vo = dao.selectPatient(patientID);
		// 6단계. request나 session으로 처리결과를 저장(jsp에 전달하기 위함)
		if(vo == null ) {
			model.addAttribute("selectCnt", 0);
		}else {
			model.addAttribute("selectCnt", 1);
		}
		
		model.addAttribute("patientID", patientID);
	}

	@Override
	public void confirmId_dc(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		String doctorID = req.getParameter("doctorID");
		
		// 5단계. 중복된 id가 있는지 확인
		DoctorVO vo =  dao.selectDoctor(doctorID);
		// 6단계. request나 session으로 처리결과를 저장(jsp에 전달하기 위함)
		if(vo == null ) {
			model.addAttribute("selectCnt", 0);
		}else {
			model.addAttribute("selectCnt", 1);
		}
		model.addAttribute("doctorID", doctorID);
	}
	
	@Override
	public void boardList(HttpServletRequest req, Model model) {

		int pageSize = 10; 	// 페이지당 글 갯수
		int pageBlock = 1; 	// 한 블럭당 페이지 갯수
		
		int cnt = 0;	   	// 글 갯수
		int start = 0;	   	// 현재 페이지 시작 글 번호
		int end = 0;	   	// 현재 페이지 마지막 글 번호
		int number = 0;	   	// 출력용 글 번호
		String pageNum = "";// 페이지 번호
		int currentPage = 0;// 현재 페이지
		
		int pageCount = 0;	// 페이지 갯수
		int startPage = 0;  // 시작 페이지
		int endPage = 0;	// 마지막 페이지
		
		cnt = dao.getArticleCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum); // 현재페이지
		System.out.println("currentPage : " + currentPage);
	
		start = (currentPage-1) * pageSize + 1;
		
		end = start + pageSize - 1;
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		number = cnt - (currentPage - 1) * pageSize;
		
		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);
		
		if(cnt > 0) {
			List<BoardVO> dtos = dao.getArticleList();
			req.setAttribute("dtos", dtos);	
		}

		model.addAttribute("cnt", cnt);			// 글 갯수
		model.addAttribute("number", number);		// 출력용 글번호
		model.addAttribute("pageNum", pageNum);	// 페이지 번호
		System.out.println("cnt : " + cnt);
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage);	// 시작페이지
			model.addAttribute("endPage", endPage);		// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock);	// 한 블럭당 페이지 갯수
			model.addAttribute("pageCount", pageCount);	// 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}
	
	@Override
	public void boardView(HttpServletRequest req, Model model) {
		int boardNO = Integer.parseInt(req.getParameter("boardNO"));
		
		BoardVO vo = dao.getArticle(boardNO);
		
		model.addAttribute("dto", vo);
		model.addAttribute("boardNO", boardNO);
		
	}
	
	@Override
	public void insertComments(HttpServletRequest req, Model model) {
		CommentVO vo = new CommentVO();
		String writer = (String) req.getSession().getAttribute("mem_id");
		int boardNO = Integer.parseInt(req.getParameter("boardNO"));
		String content = req.getParameter("content");
		
		vo.setWriter(writer);
		vo.setBoardNO(boardNO);
		vo.setContent(content);
		
		int insertCnt = dao.insertComments(vo);
		
	}
	
	@Override
	public List<CommentVO> selectComments(HttpServletRequest req, Model model){
		int boardNO = Integer.parseInt(req.getParameter("boardNO"));
		
		return dao.selectCommentList(boardNO);
	}

	@Override
	public void deleteComment(HttpServletRequest req, Model model) {
		int commentNO = Integer.parseInt(req.getParameter("commentNO"));
		System.out.println(commentNO);
		dao.deleteComment(commentNO);
		return;
	}

	@Override
	public void updateComment(HttpServletRequest req, Model model) {
		CommentVO vo = new CommentVO();
		String writer = (String) req.getSession().getAttribute("mem_id");
		int commentNO = Integer.parseInt(req.getParameter("commentNO")); 
		String content = req.getParameter("content");
		
		vo.setWriter(writer);
		vo.setCommentNO(commentNO);
		vo.setContent(content);
		
		dao.updateComment(vo);
		
		//model.addAttribute("writer", writer);
		model.addAttribute("commentNO", commentNO);
		//model.addAttribute("content", content);
		
	}
	
}
