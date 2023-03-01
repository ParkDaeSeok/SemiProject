package com.kh.hotel.model.vo;

public class Review {

	private int reviewNo;//    REVIEW_NO NUMBER CONSTRAINT REVIEW_PK PRIMARY KEY,
	private int reviewStar;	//  REVIEW_STAR NUMBER NOT NULL,
	private String reviewTitle;	// REVIEW_TITLE VARCHAR2(100) NOT NULL,
	private String reviewContent;	//REVIEW_CONTENT VARCHAR2(500) NOT NULL,
	private String createDate;	//  CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
	private String status;	//       STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN ('Y', 'N')),
	private int bookNo;	//      BOOK_NO NUMBER CONSTRAINT REVIEW_FK NOT NULL,
	private String reviewId; //  REVIEW_ID VARCHAR2(20) NOT NULL
	
	// 사진 테이블의 파일 불러오기 위한 필드
	private String img;
	
	public Review() { }

	public Review(int reviewNo, int reviewStar, String reviewTitle, String reviewContent, String createDate,
			String status, int bookNo, String reviewId) {
		super();
		this.reviewNo = reviewNo;
		this.reviewStar = reviewStar;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.createDate = createDate;
		this.status = status;
		this.bookNo = bookNo;
		this.reviewId = reviewId;
	}

	public Review(int bookNo, String reviewId) {
		super();
		this.bookNo = bookNo;
		this.reviewId = reviewId;
	}

	public Review(int reviewNo, int reviewStar, String reviewTitle, String reviewContent, String reviewId) {
		super();
		this.reviewNo = reviewNo;
		this.reviewStar = reviewStar;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewId = reviewId;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getReviewId() {
		return reviewId;
	}

	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewStar=" + reviewStar + ", reviewTitle=" + reviewTitle
				+ ", reviewContent=" + reviewContent + ", createDate=" + createDate + ", status=" + status + ", bookNo="
				+ bookNo + ", reviewId=" + reviewId + ", img=" + img;
	}

	
}
