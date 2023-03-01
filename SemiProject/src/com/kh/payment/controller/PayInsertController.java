package com.kh.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Card;
import com.kh.payment.model.vo.Payment;

import java.sql.Date;

/**
 * Servlet implementation class PayInsertController
 */
@WebServlet("/booking.py")
public class PayInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayInsertController() {
        super();
     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String name1 = request.getParameter("name1");
		String name2 = request.getParameter("name2");
		String eng1 = request.getParameter("eng1");
		String eng2 = request.getParameter("eng2");
		String phone = request.getParameter("phone");
		String cardNumber = request.getParameter("cardNumber");
		String cardValidate = request.getParameter("cardValidate");
		int cardPwd = Integer.parseInt(request.getParameter("cardPwd"));
		int cvc = Integer.parseInt(request.getParameter("cvc"));
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		
		Card card = new Card(cardNumber, cardValidate, cardPwd, cvc);
		
		
		int memberNo = new PaymentService().checkMember(email,phone);
		// 회원이 맞는지 체크해서 멤버번호 가져옴
		
		
		
		if(memberNo !=0) { // 멤버번호로 카드 맞는지 확인
			
			// 카드 본인 맞는지 확인
			Card c = new PaymentService().selectCard(card,memberNo);
			
			if(c != null) { // 카드가 맞으면 예약 넣고 나서 그 예약번호로 예약결제여부 'y'로 / 결제테이블 인서트 
				int result = new PaymentService().payment(bookNo);
				
				if(result>0) { // 성공시
					request.getSession().setAttribute("alertMsg", "결제에 성공했습니다");
					response.sendRedirect(request.getContextPath());
				}
				else { // 실패시
					request.getSession().setAttribute("alertMsg", "결제에 실패했습니다");
					response.sendRedirect(request.getContextPath());
				}
			}
			else {
				request.getSession().setAttribute("alertMsg", "카드 확인에 실패했습니다");
				response.sendRedirect(request.getContextPath());
			}
			
		}
		else {
			request.getSession().setAttribute("alertMsg", "본인 확인에 실패했습니다");
			response.sendRedirect(request.getContextPath());
		}

		
	}
	
		
		
				
		
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
