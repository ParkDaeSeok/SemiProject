package com.kh.hotel.model.vo;

public class Amenities {
	private int amNo;	//    AM_NO NUMBER CONSTRAINT AM_PK PRIMARY KEY,
	private String amName;	//  AM_NAME VARCHAR2(20) NOT NULL,
	private String amPrice;	// AM_PRICE VARCHAR2(6) NOT NULL CHECK (AM_PRICE IN('무료', '유료')),
	private String amTime;	//  AM_TIME VARCHAR2(50) NOT NULL,
	private int hotelNo;	// HOTEL_NO NUMBER CONSTRAINT AM_FK NOT NULL
	
	public Amenities() { }

	public Amenities(int amNo, String amName, String amPrice, String amTime, int hotelNo) {
		super();
		this.amNo = amNo;
		this.amName = amName;
		this.amPrice = amPrice;
		this.amTime = amTime;
		this.hotelNo = hotelNo;
	}

	public int getAmNo() {
		return amNo;
	}

	public void setAmNo(int amNo) {
		this.amNo = amNo;
	}

	public String getAmName() {
		return amName;
	}

	public void setAmName(String amName) {
		this.amName = amName;
	}

	public String getAmPrice() {
		return amPrice;
	}

	public void setAmPrice(String amPrice) {
		this.amPrice = amPrice;
	}

	public String getAmTime() {
		return amTime;
	}

	public void setAmTime(String amTime) {
		this.amTime = amTime;
	}

	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	@Override
	public String toString() {
		return "Amenities [amNo=" + amNo + ", amName=" + amName + ", amPrice=" + amPrice + ", amTime=" + amTime
				+ ", hotelNo=" + hotelNo + "]";
	}
	
	
}
