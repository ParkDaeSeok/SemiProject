package com.kh.hotel.model.vo;

public class Attractions {

	private int attNo;//  ATT_NO NUMBER CONSTRAINT ATT_PK PRIMARY KEY, 
	private String attName;	//  ATT_NAME VARCHAR2(20) NOT NULL,
	private double distance;	//  DISTANCE NUMBER NOT NULL,
	private int hotelNo;	//  HOTEL_NO NUMBER CONSTRAINT ATT_FK NOT NULL,
	
	public Attractions() { }

	public Attractions(int attNo, String attName, double distance, int hotelNo) {
		super();
		this.attNo = attNo;
		this.attName = attName;
		this.distance = distance;
		this.hotelNo = hotelNo;
	}

	public Attractions(String attName, double distance) {
		super();
		this.attName = attName;
		this.distance = distance;
	}

	public int getAttNo() {
		return attNo;
	}

	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	public String getAttName() {
		return attName;
	}

	public void setAttName(String attName) {
		this.attName = attName;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	@Override
	public String toString() {
		return "Attractions [attNo=" + attNo + ", attName=" + attName + ", distance=" + distance + ", hotelNo="
				+ hotelNo + "]";
	}
	
	
	
}
