package com.teampj.test.vo;

import java.sql.Timestamp;

public class BoardVO {
	
	private int boardNO; // 게시글 번호
	
	private String subject; // 제목
	
	private String content; // 내용
	
	private Timestamp regDate; // 작성일 
	
	private String writer; // 작성자
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getBoardNO() {
		return boardNO;
	}

	public void setBoardNO(int boardNO) {
		this.boardNO = boardNO;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp timestamp) {
		this.regDate = timestamp;
	}
}
