package com.teampj.test.vo;

import java.sql.Timestamp;

public class SelfCheckVO {
	
	private String patientID;			//환자 아이디
	private int chkNo;					//자가진단번호
	private String depResult;			//우울증진단 결과메시지
	private String manicResult;			//조울증진단 결과메시지
	private float manicDepression;		//조울증 진단점수
	private int depression;				//우울증진단점수
	private Timestamp chkDate;			//자가진단일
	
	
	public String getPatientID() {
		return patientID;
	}
	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}
	public int getChkNo() {
		return chkNo;
	}
	public void setChkNo(int chkNo) {
		this.chkNo = chkNo;
	}
	public String getDepResult() {
		return depResult;
	}
	public void setDepResult(String depResult) {
		this.depResult = depResult;
	}
	public String getManicResult() {
		return manicResult;
	}
	public void setManicResult(String manicResult) {
		this.manicResult = manicResult;
	}
	public float getManicDepression() {
		return manicDepression;
	}
	public void setManicDepression(float manicDepression) {
		this.manicDepression = manicDepression;
	}
	public int getDepression() {
		return depression;
	}
	public void setDepression(int depression) {
		this.depression = depression;
	}
	public Timestamp getChkDate() {
		return chkDate;
	}
	public void setChkDate(Timestamp chkDate) {
		this.chkDate = chkDate;
	}

	
}
