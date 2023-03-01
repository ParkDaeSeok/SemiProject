package com.kh.member.model.vo;

public class Booking {
	
	private int bookNo; //BOOK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
    private String bookDate; //BOOK_DATE DATE NOT NULL, 문자열로 받아서 날짜를
    private String status; //STATUS CHAR(1) DEFAULT 'N' CHECK(STATUS IN('Y', 'N')), 이것도 문자열로 받는게 편함
    private String payStatus; //PAY_STATUS CHAR(1) DEFAULT 'N' CHECK(PAY_STATUS IN('Y', 'N')),
    private int memberNo; //MEM_NO NUMBER CONSTRAINT BOOK_FK_MEMBER NOT NULL,
    private int roomNo; //ROOM_NO NUMBER CONSTRAINT BOOK_FK_ROOM NOT NULL,
    private String MemberName; // 멤버이름
    private String hotelName; // 호텔이름
    private int roomPrice; // 객실 가격
    
	public Booking() {
		super();
	}
	
	
	
	public Booking(int bookNo, String bookDate, String payStatus, String memberName, String hotelName, int roomPrice) {
		super();
		this.bookNo = bookNo;
		this.bookDate = bookDate;
		this.payStatus = payStatus;
		MemberName = memberName;
		this.hotelName = hotelName;
		this.roomPrice = roomPrice;
	}



	public Booking(int bookNo, String bookDate, String status, String payStatus, int memberNo, int roomNo,
			String memberName, String hotelName, int roomPrice) {
		super();
		this.bookNo = bookNo;
		this.bookDate = bookDate;
		this.status = status;
		this.payStatus = payStatus;
		this.memberNo = memberNo;
		this.roomNo = roomNo;
		MemberName = memberName;
		this.hotelName = hotelName;
		this.roomPrice = roomPrice;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getMemberName() {
		return MemberName;
	}
	public void setMemberName(String memberName) {
		MemberName = memberName;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	@Override
	public String toString() {
		return "Booking [bookNo=" + bookNo + ", bookDate=" + bookDate + ", status=" + status + ", payStatus="
				+ payStatus + ", memberNo=" + memberNo + ", roomNo=" + roomNo + ", MemberName=" + MemberName
				+ ", hotelName=" + hotelName + ", roomPrice=" + roomPrice + "]";
	}
    
	
    
}
