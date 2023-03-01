package com.kh.payment.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.hotel.model.vo.Booking;
import com.kh.payment.model.vo.Card;
import com.kh.payment.model.vo.Payment;

public class PaymentDao {
	
	
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * @param conn
	 * @param checkCardNo : 사용자가 입력한 cNo 값
	 * @return : 입력 cardNo와 DB No를 비교하여, 중복되면 1 / 중복되지 않으면 0
	 */
	
	public int cardNoCheck(Connection conn, String checkCardNo) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("cardNoCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkCardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	/**
	 * @param conn
	 * @param checkCardValidate : 사용자가 입력한 validate 값
	 * @return : 입력 validate와 DB validate를 비교하여, 중복되면 1 / 중복되지 않으면 0
	 */
	
	public int cardValidateCheck(Connection conn, Date checkCardValidate) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("cardValidateCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setDate(1, checkCardValidate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	/**
	 * @param conn
	 * @param checkCardPassword : 사용자가 입력한 password 값
	 * @return : 입력 Password와 DB password를 비교하여, 중복되면 1 / 중복되지 않으면 0
	 */
	
	
	public int cardPasswordCheck(Connection conn, int checkCardPassword) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("cardPasswordCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, checkCardPassword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	/**
	 * @param conn
	 * @param checkCVC : 사용자가 입력한 cvc 값
	 * @return : 입력 cvc와 DB cvc를 비교하여, 중복되면 1 / 중복되지 않으면 0
	 */
	
	public int cvcCheck(Connection conn, int checkCVC) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("cvcCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, checkCVC);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	
	
	
	public int insertPayment(Connection conn, Payment p) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPayId());
			pstmt.setString(2, p.getPayType());
			pstmt.setInt (4,p.getBookNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	public int checkMember(Connection conn, String email, String phone) {
		
		// select - ResulstSet - but, int
		int memberNo = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, phone);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				memberNo = rset.getInt("MEMBER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memberNo;
		
		
	}
	public Card selectCard(Connection conn, Card card, int memberNo) {
		
		//select - ResultSet - Card
		
		Card c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, card.getCardNo());
			pstmt.setString(2, card.getCardValidate());
			pstmt.setInt(3, card.getCardPwd());
			pstmt.setInt(4, card.getCvc());
			pstmt.setInt(5, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Card(rset.getString("CARD_NO")
						    ,rset.getString("CARD_VALIDATE")
						    ,rset.getInt("CARD_PASSWORD")
						    ,rset.getInt("CVC")
						    ,rset.getInt("MEMBER_NO"));
						
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	
	public int insertBook(Connection conn, int roomNo, int memberNo) {
		
		// insert - int
		int insertNo = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("insertBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, roomNo);
			
			insertNo = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return insertNo;
	}
	public Booking selectBook(Connection conn, int roomNo, int memberNo) {
		
		// select - ResultSet - Booking
		Booking b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBook");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, roomNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Booking();
				
				b.setBookNo(rset.getInt("BOOK_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	public int updateBook(Connection conn, int bookNo) {
		
		// update - int 
		int result1 = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			
			result1= pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result1;
	}
	public int insertPayment(Connection conn, int bookNo) {
		
		// insert - int
		int result2 = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result2;
	}
	

}
	

