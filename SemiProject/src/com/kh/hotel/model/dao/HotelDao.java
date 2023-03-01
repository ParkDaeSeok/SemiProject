package com.kh.hotel.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.hotel.model.vo.Amenities;
import com.kh.hotel.model.vo.Attractions;
import com.kh.hotel.model.vo.Hotel;
import com.kh.hotel.model.vo.Map;
import com.kh.hotel.model.vo.Photo;
import com.kh.hotel.model.vo.Review;
import com.kh.hotel.model.vo.Room;

import static com.kh.common.JDBCTemplate.*;

public class HotelDao {
	
	private Properties prop = new Properties();
	
	public HotelDao() {
		// classes가 시작
		String fileName = HotelDao.class.getResource("/sql/hotel/hotel-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/*--------------------------박대석---------------------------------------*/
	public int selectListCount(Connection conn, String city, String state) {
		
		// select - ResultSet - but, int형으로 반환
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+state+"%");
			pstmt.setString(2, "%"+city+"%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Hotel> selectListHotelPlace(Connection conn, String state, String city,  PageInfo pi) {
		
		// select - ResultSet - ArrayList
		ArrayList<Hotel> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListHotelPlace");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
			
			//int endRow = startRow + pi.getHotelLimit() -1;
			int endRow = startRow + pi.getHotelLimit() -1;
			
			
			pstmt.setString(1, "%"+state+"%");
			pstmt.setString(2, "%"+city+"%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Hotel(rset.getInt("HOTEL_NO")
						 ,rset.getString("HOTEL_NAME")
						 ,rset.getInt("HOTEL_STAR")
						 ,rset.getString("HOTEL_DESCRIPTION")
						 ,rset.getString("LOCAL_NAME")
						 ,rset.getInt("ROOM_PRICE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int selectListCountFilter(Connection conn, String city, String state, int star, int minPay, int maxPay,
			String hotelName) {
		
		// select - ResultSet- but, int
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(star == 0) { // 호텔명 값이 있고 별점이 없을때
			String sql = prop.getProperty("listCountFilterName");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("3: "+listCount);
			return listCount;	
		}
		else { // 호텔명도 있고 별점도 있을 때
			String sql = prop.getProperty("listCountFilterNameStar");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, star);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("4: "+listCount);
			return listCount;	
		}
	}


	public ArrayList<Hotel> selectListFilter(Connection conn, String hotelName, int star, int minPay,
			int maxPay, String city, String state, PageInfo pi) {
		
		// select - ResultSet - ArrayList<hotel>
		ArrayList<Hotel> listFilter = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(star == 0) { // 호텔명 값이 있고 별점이 없을때
			
			String sql = prop.getProperty("selectListName");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
							 				,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return listFilter;
		}
		else { // 호텔명도 있고 별점도 있을 때
			
			String sql = prop.getProperty("selectListNameStar");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, star);
				pstmt.setInt(7, startRow);
				pstmt.setInt(8, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
											,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return listFilter;
			
		}
	}
	
	public ArrayList<Map> selectListMap(Connection conn, String city, String state, String hotelName, int minPay, int maxPay
			, int star) {
		
		// select - ResultSet - ArrayList
		ArrayList<Map> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(star == 0) { // 별점값이 없을 때
			String sql =  prop.getProperty("selectListMap");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setString(3, "%"+hotelName+"%");
				pstmt.setInt(4, minPay);
				pstmt.setInt(5, maxPay);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Map(rset.getDouble("MAP_X")
									,rset.getDouble("MAP_Y")
									,rset.getString("HOTEL_NAME")
									,rset.getString("HOTEL_DESCRIPTION")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
			
		}
		else { // 별점값이 있을 때
			String sql = prop.getProperty("selectListMapStar");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setString(3, "%"+hotelName+"%");
				pstmt.setInt(4, minPay);
				pstmt.setInt(5, maxPay);
				pstmt.setInt(6, star);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Map(rset.getDouble("MAP_X")
									,rset.getDouble("MAP_Y")
									,rset.getString("HOTEL_NAME")
									,rset.getString("HOTEL_DESCRIPTION")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
			
	}

	public int selectListCountSort(Connection conn, String city, String state, int star, int minPay, int maxPay,
			String hotelName) { // 정렬기준시 호텔들 카운트하는 거지만 여기서는 필터 카운트 sql문을 가져와 쓴다.
		
		// select - ResultSet- but, int
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(star == 0) { // 호텔명 값이 있고 별점이 없을때
			String sql = prop.getProperty("listCountFilterName");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("3: "+listCount);
			return listCount;	
		}
		else { // 호텔명도 있고 별점도 있을 때
			String sql = prop.getProperty("listCountFilterNameStar");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, star);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("4: "+listCount);
			return listCount;	
		}
	}

	public ArrayList<Hotel> selectListSort1(Connection conn, String hotelName, int star, int minPay, int maxPay,
			String city, String state, PageInfo pi) {
		
		// select - ResultSet - ArrayList<Hotel>
		ArrayList<Hotel> listFilter = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(star == 0) { // 호텔명 값이 있고 별점이 없을때
			
			String sql = prop.getProperty("selectListNameHigh");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
							   				,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("listFilter1 : "+listFilter);
			return listFilter;
		}
		else { // 호텔명도 있고 별점도 있을 때
			
			String sql = prop.getProperty("selectListNameStarHigh");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, star);
				pstmt.setInt(7, startRow);
				pstmt.setInt(8, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
											,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("listFilter2 : "+listFilter);
			return listFilter;
			
		}
	}

	public ArrayList<Hotel> selectListSort2(Connection conn, String hotelName, int star, int minPay, int maxPay,
			String city, String state, PageInfo pi) {
		
		
		ArrayList<Hotel> listFilter = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(star == 0) { // 호텔명 값이 있고 별점이 없을때
			
			String sql = prop.getProperty("selectListNameLow");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
											,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("listFilter3 : "+listFilter);
			return listFilter;
		}
		else { // 호텔명도 있고 별점도 있을 때
			
			String sql = prop.getProperty("selectListNameStarLow");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, star);
				pstmt.setInt(7, startRow);
				pstmt.setInt(8, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
											,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("listFilter4 : "+listFilter);
			return listFilter;
			
		}
		
	}

	public ArrayList<Hotel> selectListSort3(Connection conn, String hotelName, int star, int minPay, int maxPay,
			String city, String state, PageInfo pi) { // 별점순으로 했을 때 호텔리스트들 정렬
		
		ArrayList<Hotel> listFilter = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(star == 0) { // 호텔명 값이 있고 별점이 없을때
			
			String sql = prop.getProperty("selectListNameReview");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
											,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("listFilter5 : "+listFilter);
			return listFilter;
		}
		else { // 호텔명도 있고 별점도 있을 때
			
			String sql = prop.getProperty("selectListNameStarReview");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage()-1) * pi.getHotelLimit() +1;
				
				int endRow = startRow + pi.getHotelLimit() -1;
								
				pstmt.setString(1, "%"+state+"%");
				pstmt.setString(2, "%"+city+"%");
				pstmt.setInt(3, minPay);
				pstmt.setInt(4, maxPay);
				pstmt.setString(5, "%"+hotelName+"%");
				pstmt.setInt(6, star);
				pstmt.setInt(7, startRow);
				pstmt.setInt(8, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					listFilter.add(new Hotel(rset.getInt("HOTEL_NO")
											,rset.getString("HOTEL_NAME")
							 				,rset.getInt("HOTEL_STAR")
							 				,rset.getString("HOTEL_DESCRIPTION")
							 				,rset.getString("LOCAL_NAME")
							 				,rset.getInt("ROOM_PRICE")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			System.out.println("listFilter6 : "+listFilter);
			return listFilter;
			
		}
	}
	/*--------------------------박대석---------------------------------------*/
	
	
/* ----------------------------- 아래부터 소개 페이지 ---------------------------- */
	
	// HOTEL 테이블 STAR 와 DESCRIPTION 조회해서 가져오기
	public Hotel selectStarDescription(Connection conn, String hoName) {
				
		Hotel ho = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStarDescription");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hoName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // HOTEL_NAME은 UNIQUE 속성이기 때문에 rset에는 결과가 없거나 1개만 존재함.
				ho = new Hotel(rset.getInt("HOTEL_NO")
							 , rset.getInt("HOTEL_STAR")
							 , rset.getString("HOTEL_DESCRIPTION"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ho;
		
	}
	
	// ROOM 테이블 NAME, PEOPLE, PRICE, OPTION 조회해서 가져오기
	public ArrayList<Room> selectRoomInfo(Connection conn, int hotelNo) {
		
		ArrayList<Room> rList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRoomInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { // 객실은 최소 1개 이상이므로 while
				Room r = new Room();
				r.setRoomNo(rset.getInt("ROOM_NO"));
				r.setRoomName(rset.getString("ROOM_NAME"));
				r.setRoomPeople(rset.getInt("ROOM_PEOPLE"));
				r.setRoomPrice(rset.getString("ROOM_PRICE"));
				r.setRoomOption(rset.getString("ROOM_OPTION"));
				
				
				rList.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rList;
		
	}
	
	// ATTRACTIONS 테이블 NAME, DISTANCE 조회해서 가져오기
	public ArrayList<Attractions> selectAttInfo(Connection conn, int hotelNo) {
		
		ArrayList<Attractions> attList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attractions att = new Attractions();
				att.setAttNo(rset.getInt("ATT_NO"));
				att.setAttName(rset.getString("ATT_NAME"));
				att.setDistance(rset.getDouble("DISTANCE"));
				
				attList.add(att);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return attList;
		
	}
	
	// AMENITIES 테이블 NAME, PRICE, TIME 조회해서 가져오기
	public ArrayList<Amenities> selectAmInfo(Connection conn, int hotelNo) {
		
		ArrayList<Amenities> amList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAmInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Amenities am = new Amenities();
				am.setAmNo(rset.getInt("AM_NO"));
				am.setAmName(rset.getString("AM_NAME"));
				am.setAmPrice(rset.getString("AM_PRICE"));
				am.setAmTime(rset.getString("AM_TIME"));
				
				amList.add(am);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
			
		return amList;
	}
	
	// BOOKING 테이블 BOOK_NO, MEMBER_ID 조회해서 가져오기
	public ArrayList<Review> selectBookingMemberNo(Connection conn, String hoName) {
	
		ArrayList<Review> boList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBookingMemberNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hoName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setBookNo(rset.getInt("BOOK_NO"));
				r.setReviewId(rset.getString("MEMBER_ID"));
				
				
				boList.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return boList;
	}
	
	// REVIEW 테이블 NO, STAR, TITLE, CONTENT, ID 조회해서 가져오기
	public HashMap<Integer, Review> selectReviewList(Connection conn, int hotelNo, ArrayList<Review> boList, PageInfo pi) {
		
		HashMap<Integer, Review> rvList = new HashMap<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getHotelLimit() + 1;
			int endRow = startRow + pi.getHotelLimit() - 1;
			

			pstmt.setInt(1, hotelNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				
				Review r = new Review();
				r.setReviewNo(rset.getInt("REVIEW_NO"));
				r.setReviewStar(rset.getInt("REVIEW_STAR"));
				r.setReviewTitle(rset.getString("REVIEW_TITLE"));
				r.setReviewContent(rset.getString("REVIEW_CONTENT"));
				r.setCreateDate(rset.getString("CREATE_DATE"));
				r.setReviewId(rset.getString("REVIEW_ID"));
				
				rvList.put(rset.getInt("REVIEW_NO"), r);
					
							
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rvList;
	}
	
	// REVIEW 테이블의 값에서 사진이 첨부된 이용 후기 조회해서 덮어쓰기
	public ArrayList<Review> selectReviewPhotoList(Connection conn, int hotelNo, ArrayList<Review> boList, PageInfo pi) {
		
		ArrayList<Review> rvPhotoList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewPhotoList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Review r = new Review();
							
				r.setReviewNo(rset.getInt("REVIEW_NO"));
				r.setReviewStar(rset.getInt("REVIEW_STAR"));
				r.setReviewTitle(rset.getString("REVIEW_TITLE"));
				r.setReviewContent(rset.getString("REVIEW_CONTENT"));
				r.setCreateDate(rset.getString("CREATE_DATE"));
				r.setReviewId(rset.getString("REVIEW_ID"));
				r.setImg(rset.getString("IMG"));
				
				rvPhotoList.add(r);
										
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rvPhotoList;
	}
	
	// REVIEW 테이블 STAR 평균값과 건수 조회해서 가져오기
	public ArrayList<String> selectReviewStar(Connection conn, int hotelNo) {
		
		ArrayList<String> rvStar = new ArrayList<>();
		
		String avg = null;
		
		String count = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewStar");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				avg = rset.getString("AVG_STAR");
				count = rset.getString("COUNT(*)");
			}
			
			rvStar.add(avg);
			rvStar.add(count);
							
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rvStar;
		
	}
	
	// REVIEW 테이블 STAR 각 점수 별 후기 개수 조회해서 가져오기
	public HashMap<String, Integer> selectReviewStarCount(Connection conn) {
		
		HashMap<String, Integer> rvStarCount = new HashMap<>();
		
			
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewStarCount");
			
			try {
				
				for(int i = 1; i <= 5; i++) { // 별점은 1점 ~ 5점까지만 있기 때문에, 5번 반복
				
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, i);
					
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						rvStarCount.put(i + "점", rset.getInt("COUNT_STAR"));
					}
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
				
		
		return rvStarCount;
		
	}
	
	// BOOKING 테이블 특정 고객이 해당 호텔을 이용한 이력 중, 가장 최근의 예약번호 조회해서 가져오기
	public int selectRecentBno(Connection conn, String reviewId, String hoName) {
		
		int bookNo = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecentBno");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reviewId);
			pstmt.setString(2, hoName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // WHERE ROWNUM = 1 으로 인해, 하나의 행만 나옴
				bookNo = rset.getInt("BOOK_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bookNo;
		
	}
	
	// REVIEW 테이블에 이용후기 작성한 내용 INSERT 하기
	public int insertReview(Connection conn, Review r, int bookNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getReviewStar());
			pstmt.setString(2, r.getReviewTitle());
			pstmt.setString(3, r.getReviewContent());
			pstmt.setInt(4, bookNo);
			pstmt.setString(5, r.getReviewId());
			
			result = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	// PHOTO 테이블에 이용후기 첨부한 파일 내용 INSERT 하기
	public int insertPhoto(Connection conn, ArrayList<Photo> pList) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPhoto");
		
		try {
			
			for(Photo ph : pList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ph.getOriginName());
				pstmt.setString(2, ph.getChangeName());
				pstmt.setString(3, ph.getFilePath());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	// map에서 테이블값 가져오는 dao
	public Map selectMap(Connection conn, int hotelNo) {
		
		// select - ResultSet- map
		Map m = null;
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Map(rset.getDouble("MAP_X")
						   ,rset.getDouble("MAP_Y")
						   ,rset.getString("HOTEL_NAME")
						   ,rset.getString("HOTEL_DESCRIPTION"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	
	

}
