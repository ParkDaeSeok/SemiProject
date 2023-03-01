package com.kh.hotel.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.common.model.vo.PageInfo;
import com.kh.hotel.model.dao.HotelDao;
import com.kh.hotel.model.vo.Amenities;
import com.kh.hotel.model.vo.Attractions;
import com.kh.hotel.model.vo.Hotel;
import com.kh.hotel.model.vo.Local;
import com.kh.hotel.model.vo.Map;
import com.kh.hotel.model.vo.Photo;
import com.kh.hotel.model.vo.Review;
import com.kh.hotel.model.vo.Room;

import static com.kh.common.JDBCTemplate.*;

public class HotelService {
	
	/* ------------------박대석------------------------------*/
	public int selectListCount(String city, String state) {
		
		Connection conn = getConnection();
		
		int listCount = new HotelDao().selectListCount(conn, city, state);
		// select 결과 ResultSet이 맞긴한데
		// 호텔리스트 총 갯수 반환
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Hotel> selectListHotelPlace(String state, String city, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new HotelDao().selectListHotelPlace(conn, state, city ,pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectListCountFilter(String city, String state, int star, int minPay, int maxPay, String hotelName) {
		
		Connection conn = getConnection();
		
		int listCount = new HotelDao().selectListCountFilter(conn, city, state, star, minPay, maxPay, hotelName);
		// select 결과지만 리스트 갯수 반환으로 int
		
		close(conn);
		
		
		return listCount;
	}
	
	public ArrayList<Hotel> selectListFilter(String hotelName, int star, int minPay, int maxPay, String city, String state, PageInfo pi) {
		
		// 모든 필터에 관한 값을 받는 메서드
		Connection conn = getConnection();
		
		ArrayList<Hotel> listFilter = new HotelDao().selectListFilter(conn, hotelName, star, minPay, maxPay, city, state, pi);
		
		close(conn);
		
		return listFilter;
	}
	

	public ArrayList<Map> selectListMap(String city, String state, String hotelName, int minPay, int maxPay, int star) {
		
		Connection conn = getConnection();
		
		ArrayList<Map> list = new HotelDao().selectListMap(conn, city, state, hotelName, minPay, maxPay, star);
		
		close(conn);
		
		return list;
	}

	public int selectListCountSort(String city, String state, int star, int minPay, int maxPay, String hotelName) {
		
		Connection conn = getConnection();
		
		int listCount = new HotelDao().selectListCountSort(conn, city, state, star, minPay, maxPay, hotelName);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Hotel> selectListSort1(String hotelName, int star, int minPay, int maxPay, String city,
			String state, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new HotelDao().selectListSort1(conn, hotelName, star, minPay, maxPay, city, state, pi);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Hotel> selectListSort2(String hotelName, int star, int minPay, int maxPay, String city,
			String state, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new HotelDao().selectListSort2(conn, hotelName, star, minPay, maxPay, city, state, pi);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Hotel> selectListSort3(String hotelName, int star, int minPay, int maxPay, String city,
			String state, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new HotelDao().selectListSort3(conn, hotelName, star, minPay, maxPay, city, state, pi);
		
		close(conn);
		
		return list;
	}
	/* ------------------박대석------------------------------*/
	
	
	
/* ----------------------------- 아래부터 소개 페이지 ---------------------------- */
	
	// HOTEL 테이블 STAR 와 DESCRIPTION 조회해서 가져오기
	public Hotel selectStarDescription(String hoName) {
		
		Connection conn = getConnection();
		
		Hotel ho = new HotelDao().selectStarDescription(conn, hoName);
		
		close(conn);
		
		return ho;
		
	}
	
	// ROOM 테이블 NAME, PEOPLE, PRICE, OPTION 조회해서 가져오기
	public ArrayList<Room> selectRoomInfo(int hotelNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Room> rList = new HotelDao().selectRoomInfo(conn, hotelNo);
		
		close(conn);
		
		return rList;
	}
	
	// ATTRACTIONS 테이블 NAME, DISTANCE 조회해서 가져오기
	public ArrayList<Attractions> selectAttInfo(int hotelNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Attractions> attList = new HotelDao().selectAttInfo(conn, hotelNo);
				
		close(conn);
		
		return attList;
	}
	
	// AMENITIES 테이블 NAME, PRICE, TIME 조회해서 가져오기
	public ArrayList<Amenities> selectAmInfo(int hotelNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Amenities> amList = new HotelDao().selectAmInfo(conn, hotelNo);
		
		close(conn);
		
		return amList;
		
	}
	
	// BOOKING 테이블 BOOK_NO, MEMBER_ID 조회해서 가져오기
	public ArrayList<Review> selectBookingMemberNo(String hoName) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> boList = new HotelDao().selectBookingMemberNo(conn, hoName); // 호텔에 숙박한 사람들의 예약번호와 아이디 조회
		
		close(conn);
		
		return boList;
	}
	
	
	// REVIEW 테이블 NO, STAR, TITLE, CONTENT, ID 조회해서 가져오기
	public HashMap<Integer, Review> selectReviewList(int hotelNo, ArrayList<Review> boList, PageInfo pi) {
		
		Connection conn = getConnection();
		
		HashMap<Integer, Review> rvList = new HotelDao().selectReviewList(conn, hotelNo, boList, pi);
		
		close(conn);
		
		return rvList;
		
	}
	
	// REVIEW 테이블의 값에서 사진이 첨부된 이용 후기 조회해서 덮어쓰기
	public ArrayList<Review> selectReviewPhotoList(int hotelNo, ArrayList<Review> boList, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> rvPhotoList = new HotelDao().selectReviewPhotoList(conn, hotelNo, boList, pi);
		
		close(conn);
		
		return rvPhotoList;
	}
	
	// REVIEW 테이블 STAR 평균값과 건수 조회해서 가져오기
	public ArrayList<String> selectReviewStar(int hotelNo) {
		
		Connection conn = getConnection();
		
		ArrayList<String> rvStar = new HotelDao().selectReviewStar(conn, hotelNo);
		
		close(conn);
		
		return rvStar;
		
	}

	// REVIEW 테이블 STAR 각 점수 별 후기 개수 조회해서 가져오기
	public HashMap<String, Integer> selectReviewStarCount() {
	
		Connection conn = getConnection();
		
		HashMap<String, Integer> rvStarCount = new HotelDao().selectReviewStarCount(conn);
		
		close(conn);
		
		return rvStarCount;
			
	}
	
	// BOOKING 테이블 특정 고객이 해당 호텔을 이용한 이력 중, 가장 최근의 예약번호 조회해서 가져오기
	public int selectRecentBno(String reviewId, String hoName) {
		
		Connection conn = getConnection();
		
		int bookNo = new HotelDao().selectRecentBno(conn, reviewId, hoName);
		
		close(conn);
		
		return bookNo;
		
	}
	
	// REVIEW 테이블과 PHOTO 테이블에 이용후기 작성한 내용 INSERT 하기
	public int insertReview(Review r, ArrayList<Photo> pList, int bookNo) {
		
		Connection conn = getConnection();
		
		if(pList.size() == 0) { // pList가 비어있다면, 후기 작성 시 사진을 첨부하지 않았다면
			int result = new HotelDao().insertReview(conn, r, bookNo);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
			
		} else { // pList가 비어있지 않다면, 후기 작성 시 사진을 첨부했다면
			int result1 = new HotelDao().insertReview(conn, r, bookNo);
			
			int result2 = new HotelDao().insertPhoto(conn, pList);
			
			if(result1 > 0 && result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result1 * result2;
		}

	}
	
	
	// map 테이블에서 값 가져오는 구문
	public Map selectMap(int hotelNo) {
		
		Connection conn = getConnection();
		
		Map m = new HotelDao().selectMap(conn, hotelNo);
		
		close(conn);
		
		return m;
		
	}
	

	
	

}
