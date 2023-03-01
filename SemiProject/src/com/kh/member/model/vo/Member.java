	package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;	//    MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
	private String memberName;		//  MEMBER_NAME VARCHAR2(20) NOT NULL,
	private String memberId;		//    MEMBER_ID VARCHAR2(20) NOT NULL UNIQUE,
	private String memberPwd;		//   MEMBER_PWD VARCHAR2(20) NOT NULL,
	private String gender;		//       GENDER CHAR(1) NOT NULL CHECK (GENDER IN('M', 'F')),
	private String email;		//        EMAIL VARCHAR2(30) NOT NULL UNIQUE,
	private String phone;		//        PHONE VARCHAR2(11) NOT NULL UNIQUE,
	private String birth;		//        BIRTH DATE,
	private Date enrollDate;		//  ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	private Date modifyDate;		//  MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	private String status;		//       STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN('Y', 'N'))
	
	
	public Member() { }
	
	
	
	public Member(int memberNo, String memberName, String gender, String email, String phone) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}



	public Member(int memberNo, String memberName, String memberId, String memberPwd, String gender, String email,
			String phone, String birth, Date enrollDate, Date modifyDate, String status) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Member(String memberName, String memberId, String memberPwd, String gender, String email, String phone,
			String birth) {
		super();
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberName=" + memberName + ", memberId=" + memberId + ", memberPwd="
				+ memberPwd + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", birth=" + birth
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
	
	
}
