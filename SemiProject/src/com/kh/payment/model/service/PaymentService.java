package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;

import com.kh.hotel.model.vo.Booking;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Card;
import com.kh.payment.model.vo.Payment;

public class PaymentService {
	
	
	
	public int  cardNoCheck(String checkCardNo) {
		Connection conn = getConnection();
		
		int count = new PaymentDao().cardNoCheck(conn, checkCardNo); 
		
		close(conn);
		
		return count;
	}
	
	public int cardValiDateCheck(Date checkCardValidate) {
		Connection conn = getConnection();
		
		int count = new PaymentDao().cardValidateCheck(conn,checkCardValidate);
		close(conn);
		return count;
	}
	

	public int cardPassword(int checkCardPassword) {
		Connection conn = getConnection();
		
		int count = new PaymentDao().cardPasswordCheck(conn,checkCardPassword);
		close(conn);
		return count;
	}
	

	public int cvc(int  checkCVC) {
		Connection conn = getConnection();
		
		int count = new PaymentDao().cvcCheck(conn,checkCVC);
		close(conn);
		return count;
	}
	
	
	
	public int insertPayment(Payment p) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().insertPayment(conn, p);
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int checkMember(String email, String phone) {
		
		Connection conn = getConnection();
		
		int memberNo = new PaymentDao().checkMember(conn, email, phone);
		
		close(conn);
		
		return memberNo;
	}

	public Card selectCard(Card card, int memberNo) {
		
		Connection conn = getConnection();
		
		Card c = new PaymentDao().selectCard(conn, card, memberNo);
		
		close(conn);
		
		return c;
	}

	public int insertBook(int roomNo, int memberNo) {
		
		Connection conn = getConnection();
		
		int insertNo = new PaymentDao().insertBook(conn, roomNo, memberNo);
		
		if(insertNo>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return insertNo;
	}

	public Booking selectBook(int roomNo, int memberNo) {
		
		Connection conn = getConnection();
		
		Booking b = new PaymentDao().selectBook(conn, roomNo, memberNo);
		
		close(conn);
		
		return b;
		
	}

	public int payment(int bookNo) {
		
		Connection conn = getConnection();
		
		int result1 = new PaymentDao().updateBook(conn, bookNo); // 예약테이블에서 해당 예약번호 결제 여부 y로
		
		int result2 = new PaymentDao().insertPayment(conn, bookNo); // 결제테이블에서 인서트
		
		if(result1>0 && result2>0) { // 둘다 성공시
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		return result1*result2;
	}
	
	
}



		
