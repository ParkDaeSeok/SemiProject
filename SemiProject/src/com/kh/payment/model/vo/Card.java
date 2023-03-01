package com.kh.payment.model.vo;

public class Card {
	private String cardNo;
	private String cardValidate;
	private int cardPwd;
	private int cvc;
	private int memberNo;
	public Card() {
		super();
	}
	
	public Card(String cardNo, String cardValidate, int cardPwd, int cvc) {
		super();
		this.cardNo = cardNo;
		this.cardValidate = cardValidate;
		this.cardPwd = cardPwd;
		this.cvc = cvc;
	}

	public Card(String cardNo, String cardValidate, int cardPwd, int cvc, int memberNo) {
		super();
		this.cardNo = cardNo;
		this.cardValidate = cardValidate;
		this.cardPwd = cardPwd;
		this.cvc = cvc;
		this.memberNo = memberNo;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardValidate() {
		return cardValidate;
	}
	public void setCardValidate(String cardValidate) {
		this.cardValidate = cardValidate;
	}
	public int getCardPwd() {
		return cardPwd;
	}
	public void setCardPwd(int cardPwd) {
		this.cardPwd = cardPwd;
	}
	public int getCvc() {
		return cvc;
	}
	public void setCvc(int cvc) {
		this.cvc = cvc;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "Card [cardNo=" + cardNo + ", cardValidate=" + cardValidate + ", cardPwd=" + cardPwd + ", cvc=" + cvc
				+ ", memberNo=" + memberNo + "]";
	}
	
	
	
}
