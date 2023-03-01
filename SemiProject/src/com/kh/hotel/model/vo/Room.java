package com.kh.hotel.model.vo;

public class Room {

	private int roomNo;		//ROOM_NO NUMBER CONSTRAINT ROOM_PK PRIMARY KEY,
	private String roomName;		//ROOM_NAME VARCHAR2(30) NOT NULL,
	private int roomPeople;		//ROOM_PEOPLE NUMBER NOT NULL,
	private String roomPrice;		//ROOM_PRICE NUMBER NOT NULL,
	private String roomOption;	//ROOM_OPTION VARCHAR2(50),
	private int hotNo;		//HOT_NO NUMBER CONSTRAINT ROOM_FK NOT NULL
	
	public Room() { }

	public Room(int roomNo, String roomName, int roomPeople, String roomPrice, String roomOption, int hotNo) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.roomPeople = roomPeople;
		this.roomPrice = roomPrice;
		this.roomOption = roomOption;
		this.hotNo = hotNo;
	}
	
	
	public Room(int roomNo, String roomName, int roomPeople, String roomPrice, String roomOption) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.roomPeople = roomPeople;
		this.roomPrice = roomPrice;
		this.roomOption = roomOption;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomPeople() {
		return roomPeople;
	}

	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}

	public String getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}

	public String getRoomOption() {
		return roomOption;
	}

	public void setRoomOption(String roomOption) {
		this.roomOption = roomOption;
	}

	public int getHotNo() {
		return hotNo;
	}

	public void setHotNo(int hotNo) {
		this.hotNo = hotNo;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomName=" + roomName + ", roomPeople=" + roomPeople + ", roomPrice="
				+ roomPrice + ", roomOption=" + roomOption + ", hotNo=" + hotNo + "]";
	}
	
	
}
