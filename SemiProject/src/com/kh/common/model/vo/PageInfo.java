package com.kh.common.model.vo;

public class PageInfo {
	
	
	// 7 개의 변수들을 필드로 정의할 것
	private int listCount; // 현재 일반게시판의 게시글 총 갯수 => hotel 로부터 조회 COUNT(*) 활용 (STATUS='Y')
	private int currentPage; // 현재페이지 (즉, 사용자가 요청한 페이지) => request.getParameter("currenPage") 
	private int pageLimit; // 페이지하단에 보여질 페이징바의 페이지 최대 갯수 => 10개로 고정
	private int HotelLimit; // 한 페이지에 보여질 게시글의 최대 갯수 => 개로 고정
	private int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수)
	private int startPage; // 페이지 하단에 보여질 페이징바의 시작수
	private int endPage; // 페이지 하단에 보여질 페이징바의 마지막수
	
	public PageInfo() {
		super();
	}
	
	public PageInfo(int listCount, int currentPage, int pageLimit, int hotelLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		HotelLimit = hotelLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getHotelLimit() {
		return HotelLimit;
	}

	public void setHotelLimit(int hotelLimit) {
		HotelLimit = hotelLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", HotelLimit=" + HotelLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
	
	
		
}
