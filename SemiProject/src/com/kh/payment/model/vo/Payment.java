package com.kh.payment.model.vo;

import java.sql.Date;

public class Payment {
	
	private String payId;		//PAY_ID VARCHAR2(20) CONSTRAINT PAY_PK PRIMARY KEY,               
    private String payType;			// PAY_TYPE VARCHAR2(20) NOT NULL,   
    private Date payDate;			// PAY_DATE DATE NOT NULL,
    private int bookNo;			// BOOK_NO NUMBER CONSTRAINT PAY_FK NOT NULL,
    								//FOREIGN KEY (BOOK_NO) REFERENCES BOOKING(BOOK_NO)
    
   
    public Payment() {}
    	
    	public Payment(String payId, String payType, Date payDate, int bookNo) {
    		this.payId = payId;
    		this.payType = payType;
    		this.payDate = payDate;
    		this.bookNo = bookNo;
    	
    	
    }
    
   
    	
    	public Payment(String payId, String payType,  int bookNo) {
    	
    	super();
    	
    	this.payId=payId;
    	this.payType=payType;
    	this.bookNo=bookNo;
    	
    	
    
    	
    }
 

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	@Override
	public String toString() {
		return "Payment [payId=" + payId + ", payType=" + payType + ", payDate=" + payDate + ", bookNo=" + bookNo + "]";
	}
    
    

}
