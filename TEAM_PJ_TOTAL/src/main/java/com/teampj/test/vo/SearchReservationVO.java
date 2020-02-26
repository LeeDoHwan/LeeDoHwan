package com.teampj.test.vo;

import java.sql.Timestamp;

public class SearchReservationVO {

	String patientName; // 환자 이름
	private String jumin1;	//주민번호(앞)
	private String jumin2;	//주민번호(뒤)
	int reservationNo; // 진료 예약 번호
	Timestamp reservationTime; // 예약 날짜
	
	public SearchReservationVO() {}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getJumin1() {
		return jumin1;
	}

	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}

	public String getJumin2() {
		return jumin2;
	}

	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public Timestamp getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(Timestamp reservationTime) {
		this.reservationTime = reservationTime;
	}
}
