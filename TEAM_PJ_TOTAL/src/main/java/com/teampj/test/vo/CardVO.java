package com.teampj.test.vo;

public class CardVO {
    private int cardInNO;    	// cardInNO 	NUMBER(10)      PRIMARY KEY, -- 카드등록번호
    private String cardNum;     // cardNum		NUMBER(38)      NOT NULL,    -- 카드번호
    private String patientID;	// patientID 	VARCHAR2(20)    NOT NULL,    -- 회원아이디
    private int kind;			// kind			NUMBER(1)		NULL,
    private int gender;      	// gender 		NUMBER(1)       NULL,        -- 성별
    private String name;     	// name 		VARCHAR2(50)    NULL,        -- 카드주인
    private int birth;       	// birth 		NUMBER(10)      NULL,        -- 생년월일
    private int payment;     	// payment 		NUMBER(1)       NULL,        -- 결제
    private String bankName; 	// bankName 	VARCHAR2(50)    NULL,        -- 은행명
    private String accoutNum;   // accoutNum 	NUMBER(20)      NULL         -- 계좌번호
	
    public int getKind() {
		return kind;
	}
    public void setKind(int kind) {
		this.kind = kind;
	}
    
    public int getCardInNO() {
		return cardInNO;
	}
	
	public void setCardInNO(int cardInNO) {
		this.cardInNO = cardInNO;
	}
	
	public String getCardNum() {
		return cardNum;
	}
	
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	
	public String getPatientID() {
		return patientID;
	}
	
	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}
	
	public int getGender() {
		return gender;
	}
	
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getBirth() {
		return birth;
	}
	
	public void setBirth(int birth) {
		this.birth = birth;
	}
	
	public int getPayment() {
		return payment;
	}
	
	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	public String getBankName() {
		return bankName;
	}
	
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
	public String getAccoutNum() {
		return accoutNum;
	}
	
	public void setAccoutNum(String accoutNum) {
		this.accoutNum = accoutNum;
	}
}
