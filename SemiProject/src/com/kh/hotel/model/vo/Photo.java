package com.kh.hotel.model.vo;

public class Photo {

	private int photoNo;//    PHOTO_NO NUMBER CONSTRAINT PHOTO_PK PRIMARY KEY,
	private String originName;	// ORIGIN_NAME VARCHAR2(255) NOT NULL,
	private String changeName;	// CHANGE_NAME VARCHAR2(255) NOT NULL,
	private String filePath;	//   FILE_PATH VARCHAR2(1000) NOT NULL,
	private String uploadDate;	// UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
	private String status;	//      STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN ('Y', 'N')),
	private int reviewNo;	//   REVIEW_NO NUMBER CONSTRAINT PHOTO_FK NOT NULL,
	
	public Photo() { }

	public Photo(int photoNo, String originName, String changeName, String filePath, String uploadDate, String status,
			int reviewNo) {
		super();
		this.photoNo = photoNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.reviewNo = reviewNo;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	@Override
	public String toString() {
		return "Photo [photoNo=" + photoNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", status=" + status + ", reviewNo=" + reviewNo + "]";
	}
	
	
	
}
