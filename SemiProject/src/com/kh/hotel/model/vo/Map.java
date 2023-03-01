package com.kh.hotel.model.vo;

public class Map {
	
	private int mapNo; //MAP_NO NUMBER CONSTRAINT MAP_PK PRIMARY KEY,
    private double mapX; //MAP_X NUMBER NOT NULL,
    private double mapY; //MAP_Y NUMBER NOT NULL,
    private int hotelNo; //HOTEL_NO NUMBER CONSTRAINT MAP_FK NOT NULL,
    private String description;
    private String hotelName;
    
    
	public Map() {
		super();
	}

	

	public Map(double mapX, double mapY, String description, String hotelName) {
		super();
		this.mapX = mapX;
		this.mapY = mapY;
		this.description = description;
		this.hotelName = hotelName;
	}



	public Map(int mapNo, double mapX, double mapY, int hotelNo, String description, String hotelName) {
		super();
		this.mapNo = mapNo;
		this.mapX = mapX;
		this.mapY = mapY;
		this.hotelNo = hotelNo;
		this.description = description;
		this.hotelName = hotelName;
	}


	public int getMapNo() {
		return mapNo;
	}


	public void setMapNo(int mapNo) {
		this.mapNo = mapNo;
	}


	public double getMapX() {
		return mapX;
	}


	public void setMapX(double mapX) {
		this.mapX = mapX;
	}


	public double getMapY() {
		return mapY;
	}


	public void setMapY(double mapY) {
		this.mapY = mapY;
	}


	public int getHotelNo() {
		return hotelNo;
	}


	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getHotelName() {
		return hotelName;
	}


	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}


	@Override
	public String toString() {
		return "Map [mapNo=" + mapNo + ", mapX=" + mapX + ", mapY=" + mapY + ", hotelNo=" + hotelNo + ", description="
				+ description + ", hotelName=" + hotelName + "]";
	}
	
	
    
}
