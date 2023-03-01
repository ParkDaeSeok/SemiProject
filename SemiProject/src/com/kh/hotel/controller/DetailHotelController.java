package com.kh.hotel.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.hotel.model.service.HotelService;
import com.kh.hotel.model.vo.Amenities;
import com.kh.hotel.model.vo.Attractions;
import com.kh.hotel.model.vo.Booking;
import com.kh.hotel.model.vo.Hotel;
import com.kh.hotel.model.vo.Map;
import com.kh.hotel.model.vo.Review;
import com.kh.hotel.model.vo.Room;

/* 
 * 박대석 
 * 
 *  */


/**
 * Servlet implementation class DetailHotelController
 */
@WebServlet("/detailHotel.ht")
public class DetailHotelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailHotelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿼리 스트링으로 전달된 값 추출
		String hoName = request.getParameter("hoName");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		
		// HOTEL(호텔) 테이블 조회 및 값 세팅
		Hotel ho = new HotelService().selectStarDescription(hoName);
		
		int hotelNo = ho.getHotelNo();
		
		System.out.println(hotelNo);
		
		request.setAttribute("hoName", hoName);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("hoStar", ho.getHotelStar());
		request.setAttribute("hoDesc", ho.getDescription());
		
		// ROOM(객실) 테이블 조회 및 값 세팅
		ArrayList<Room> rList = new HotelService().selectRoomInfo(hotelNo);
		
		System.out.println("rList : " +rList);
		
		request.setAttribute("rList", rList);
		
		
		// ATTRACTIONS(명소) 테이블 조회 및 값 세팅
		ArrayList<Attractions> attList = new HotelService().selectAttInfo(hotelNo);
		ArrayList<Attractions> attNearBy = new ArrayList<>(); // 주변 장소가 담기는 리스트
		ArrayList<Attractions> attAirport = new ArrayList<>(); // 공항이 담기는 리스트
		ArrayList<Attractions> attHotPlace = new ArrayList<>(); // 인기 장소가 담기는 리스트
		
		
		// map(지도) 테이블에서 값 가져오기
		Map m = new HotelService().selectMap(hotelNo);
		request.setAttribute("m", m);
		
		for(int i = 0; i < attList.size(); i++) {
			if(i < 3) {
				attNearBy.add(attList.get(i));
			} else if (i == 3) {
				attAirport.add(attList.get(i));
			} else {
				attHotPlace.add(attList.get(i));
			}
		}
		
		request.setAttribute("attNearBy", attNearBy);
		request.setAttribute("attAirport", attAirport);
		request.setAttribute("attHotPlace", attHotPlace);
		
		// AMENITIES(편의시설) 테이블 조회 및 값 세팅
		ArrayList<Amenities> amList = new HotelService().selectAmInfo(hotelNo);
		
		request.setAttribute("amList", amList);
		
		// REVIEW(이용후기) 테이블 조회 및 값 세팅
		ArrayList<Review> boList = new HotelService().selectBookingMemberNo(hoName);
		
		request.setAttribute("boList", boList);
		
		ArrayList<String> rvStar = new HotelService().selectReviewStar(hotelNo); // 호텔의 평균 평점과 이용후기 건수 조회
		
		request.setAttribute("rvStar", rvStar);
		
		HashMap<String, Integer> rvStarCount = new HotelService().selectReviewStarCount();
		
		request.setAttribute("rvStarCount", rvStarCount);
		
		// PHOTO(사진) 테이블 조회 및 값 세팅
		
		// 이용 후기 페이징 처리
		int listCount; // 현재 일반게시판의 게시글 총 개수
		int currentPage; // 현재 페이지 (죽, 사용자가 요청한 페이지) => request.getParameter("currentPage");
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 개수
		int HotelLimit; // 한 페이지에 보여질 게시글의 최대 개수
		
		int maxPage; // 가장 마지막 페이지의 번호 (== 총 페이지 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 마지막수
		
		// * listCount : 총 게시글 개수
		listCount = Integer.parseInt(rvStar.get(1));
		
		// * currentPage : 현재 페이지 (== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 페이징바의 페이지 최대 개수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 개수
		HotelLimit = 5;
		
		// * maxPage : 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 개수)
		maxPage = (int)Math.ceil((double)listCount / HotelLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 마지막수
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 3) VO 로 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit
				 , HotelLimit, maxPage, startPage, endPage);
				
		// 4) Service 단으로 전달
		HashMap<Integer, Review> rvList = new HotelService().selectReviewList(hotelNo, boList, pi); // 이용후기 리스트 조회
		ArrayList<Review> rvPhotoList = new HotelService().selectReviewPhotoList(hotelNo, boList, pi);
		
		// 5) 응답페이지 지정 => list, pi 를 넘기기
		request.setAttribute("rvList", rvList); // 직접 조회한 한 페이지 당 게시글 수
		request.setAttribute("rvPhotoList", rvPhotoList); // 사진이 포함된 이용 후기
		request.setAttribute("pi", pi); // 페이징 바를 만들때 필요한 변수
		
		request.getRequestDispatcher("views/hotel/hotelIntroduce.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
