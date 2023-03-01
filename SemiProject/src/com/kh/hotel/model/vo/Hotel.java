package com.kh.hotel.model.vo;

public class Hotel {
	
	private int hotelNo; //HOTEL_NO NUMBER CONSTRAINT HOTEL_PK PRIMARY KEY,
    private String hotelName; //HOTEL_NAME VARCHAR2(200) NOT NULL UNIQUE,
    private int hotelStar; //HOTEL_STAR NUMBER NOT NULL,
    private String description; //HOTEL_DESCRIPTION VARCHAR2(500),
    private String hotelStatus; //HOTEL_STATUS CHAR(1) DEFAULT 'N' CHECK (HOTEL_STATUS IN('Y', 'N')),
    private int locNo; //LOC_NO NUMBER CONSTRAINT HOTEL_FK NOT NULL,
    private String localName; // 지역 이름을 받는
    private int hotelPrice; // hotel가격 제일 싼 가격
    
    
	
    public Hotel() {
    	super();
    }

    
	public Hotel(int hotelNo, int hotelStar, String description) {
		super();
		this.hotelNo = hotelNo;
		this.hotelStar = hotelStar;
		this.description = description;
	}


	public Hotel(int hotelNo, String hotelName, int hotelStar, String description, String hotelStatus, int locNo,
			String localName, int hotelPrice) {
		super();
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.hotelStar = hotelStar;
		this.description = description;
		this.hotelStatus = hotelStatus;
		this.locNo = locNo;
		this.localName = localName;
		this.hotelPrice = hotelPrice;
	}



	public Hotel(int hotelNo, String hotelName, int hotelStar, String description, String localName, int hotelPrice) {
		super();
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.hotelStar = hotelStar;
		this.description = description;
		this.localName = localName;
		this.hotelPrice = hotelPrice;
	}

	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public int getHotelStar() {
		return hotelStar;
	}

	public void setHotelStar(int hotelStar) {
		this.hotelStar = hotelStar;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getHotelStatus() {
		return hotelStatus;
	}

	public void setHotelStatus(String hotelStatus) {
		this.hotelStatus = hotelStatus;
	}

	public int getLocNo() {
		return locNo;
	}

	public void setLocNo(int locNo) {
		this.locNo = locNo;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public int getHotelPrice() {
		return hotelPrice;
	}

	public void setHotelPrice(int hotelPrice) {
		this.hotelPrice = hotelPrice;
	}

	@Override
	public String toString() {
		return "Hotel [hotelNo=" + hotelNo + ", hotelName=" + hotelName + ", hotelStar=" + hotelStar + ", description="
				+ description + ", hotelStatus=" + hotelStatus + ", locNo=" + locNo + ", localName=" + localName
				+ ", hotelPrice=" + hotelPrice + "]";
	}

	
	
    
    
}
