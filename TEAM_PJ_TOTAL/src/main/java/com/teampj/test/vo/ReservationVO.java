package com.teampj.test.vo;

import java.sql.Timestamp;

public class ReservationVO {
	int reservationNo; // 진료 예약 번호
	String patientID;  // 환자 ID
	String patientName; // 한자 이름
	Timestamp reservationTime; // 예약 날짜
	int reservationState; // 진료상태
	int delectionChk1; // 선택 검사1
	int delectionChk2; // 선택 검사2
	int delectionChk3; // 선택 검사3
	int delectionChk4; // 선택 검사4
	int delectionChk5; // 선택 검사5
	
	
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getPatientID() {
		return patientID;
	}
	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public Timestamp getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(Timestamp reservationTime) {
		this.reservationTime = reservationTime;
	}
	public int getReservationState() {
		return reservationState;
	}
	public void setReservationState(int reservationState) {
		this.reservationState = reservationState;
	}
	public int getDelectionChk1() {
		return delectionChk1;
	}
	public void setDelectionChk1(int delectionChk1) {
		this.delectionChk1 = delectionChk1;
	}
	public int getDelectionChk2() {
		return delectionChk2;
	}
	public void setDelectionChk2(int delectionChk2) {
		this.delectionChk2 = delectionChk2;
	}
	public int getDelectionChk3() {
		return delectionChk3;
	}
	public void setDelectionChk3(int delectionChk3) {
		this.delectionChk3 = delectionChk3;
	}
	public int getDelectionChk4() {
		return delectionChk4;
	}
	public void setDelectionChk4(int delectionChk4) {
		this.delectionChk4 = delectionChk4;
	}
	public int getDelectionChk5() {
		return delectionChk5;
	}
	public void setDelectionChk5(int delectionChk5) {
		this.delectionChk5 = delectionChk5;
	}
	
	
}
