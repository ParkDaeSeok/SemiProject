package com.kh.hotel.model.vo;

public class Local {
	
	private int localNo; //LOCAL_NO NUMBER CONSTRAINT LOCAL_PK PRIMARY KEY,
    private String localName; //LOCAL_NAME VARCHAR2(100) NOT NULL
    
	public Local() {
		super();
	}
	public Local(int localNo, String localName) {
		super();
		this.localNo = localNo;
		this.localName = localName;
	}
	public int getLocalNo() {
		return localNo;
	}
	public void setLocalNo(int localNo) {
		this.localNo = localNo;
	}
	public String getLocalName() {
		return localName;
	}
	public void setLocalName(String localName) {
		this.localName = localName;
	}
	@Override
	public String toString() {
		return "Local [localNo=" + localNo + ", localName=" + localName + "]";
	}
    
    
}
