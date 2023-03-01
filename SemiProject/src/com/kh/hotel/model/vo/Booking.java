package com.kh.hotel.model.vo;

public class Booking {
	private int bookNo;	//    BOOK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
	private	String bookDate;//  BOOK_DATE DATE NOT NULL,
	private String status;	//     STATUS CHAR(1) DEFAULT 'N' CHECK(STATUS IN('Y', 'N')),
	private String payStatus;	// PAY_STATUS CHAR(1) DEFAULT 'N' CHECK(PAY_STATUS IN('Y', 'N')),
	private	int memNo;//  MEM_NO NUMBER CONSTRAINT BOOK_FK_MEMBER NOT NULL,
	private int roomNo;	//    ROOM_NO NUMBER CONSTRAINT BOOK_FK_ROOM NOT NULL,
	
	public Booking() { }

	public Booking(int bookNo, String bookDate, String status, String payStatus, int memNo, int roomNo) {
		super();
		this.bookNo = bookNo;
		this.bookDate = bookDate;
		this.status = status;
		this.payStatus = payStatus;
		this.memNo = memNo;
		this.roomNo = roomNo;
	}

	public Booking(int bookNo, String bookDate, String status, String payStatus) {
		super();
		this.bookNo = bookNo;
		this.bookDate = bookDate;
		this.status = status;
		this.payStatus = payStatus;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "Booking [bookNo=" + bookNo + ", bookDate=" + bookDate + ", status=" + status + ", payStatus="
				+ payStatus + ", memNo=" + memNo + ", roomNo=" + roomNo + "]";
	}
	
	
}
