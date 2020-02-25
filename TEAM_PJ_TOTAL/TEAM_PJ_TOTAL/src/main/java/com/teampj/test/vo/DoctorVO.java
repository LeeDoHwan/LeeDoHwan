package com.teampj.test.vo;

public class DoctorVO {
	
	private String doctorID;	// 의사 ID
	private String doctorPW;	// 의사 PW
	private String email;	// 이메일주소
	private String doctorName;	// 의사 이름
	private String licence;	// 의사면허
	private String tel;	// 전화번호
	public int departmentNum;
	private String enabled;	// 사용가능여부
	private String authority;	// 권한
	
	
	public String getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}
	public String getDoctorPW() {
		return doctorPW;
	}
	public void setDoctorPW(String doctorPW) {
		this.doctorPW = doctorPW;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getLicence() {
		return licence;
	}
	public void setLicence(String licence) {
		this.licence = licence;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getDepartmentNum() {
		return departmentNum;
	}
	public void setDepartmentNum(int departmentNum) {
		this.departmentNum = departmentNum;
	}
	
	
}
