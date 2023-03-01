package com.kh.payment.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hotel.model.vo.Booking;
import com.kh.payment.model.service.PaymentService;

/**
 * Servlet implementation class PaymentEnrollForm
 */
@WebServlet("/payEnrollForm.py")
public class PaymentEnrollForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentEnrollForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hotelName = request.getParameter("hotelName");
        String roomName = request.getParameter("roomName");
        String roomPrice = request.getParameter("roomPrice");
        String checkIn = request.getParameter("checkIn_pay");
        String checkOut = request.getParameter("checkOut_pay");
        String adult = request.getParameter("adult");
        int roomNo = Integer.parseInt(request.getParameter("roomNo"));
        int memberNo = Integer.parseInt(request.getParameter("memberNo"));
        
        System.out.println("hotelName : "+hotelName);
        System.out.println("roomName : "+roomName);
        System.out.println("roomPrice : "+roomPrice);
        System.out.println("checkIn : "+checkIn);
        System.out.println("checkOut : "+checkOut);
        System.out.println("adult : "+adult);
        System.out.println("roomNo : "+roomNo);
        
        String[] temp = roomPrice.split(",");
        System.out.println("temp[0] : "+temp[0]);
        System.out.println("temp[1] : "+temp[1]);
        
        int roomPay = Integer.parseInt(temp[0] + temp[1]);
        
        System.out.println("roomPay : "+roomPay);
        
        int dayIn = Integer.parseInt(checkIn.substring(8,10));
        int dayOut = Integer.parseInt(checkOut.substring(8,10));
        
        int minus = dayOut - dayIn;
        
        int totalPay = roomPay*minus;
        
        // 예약 넣기
        int insertNo = new PaymentService().insertBook(roomNo, memberNo);
        
        // 예약 조회
        Booking b = new PaymentService().selectBook(roomNo, memberNo);
        
        
        
        if(insertNo>0) {
        	
        	if(b!= null) {        		
        		request.setAttribute("hotelName", hotelName);
        		request.setAttribute("roomName", roomName);
        		request.setAttribute("totalPay", totalPay);
        		request.setAttribute("checkIn", checkIn);
        		request.setAttribute("checkOut", checkOut);
        		request.setAttribute("roomNo", roomNo);
        		request.setAttribute("bookNo", b.getBookNo());
        		
        		request.getRequestDispatcher("views/payment/payment.jsp").forward(request, response);
        	}
        	else {
        		request.getSession().setAttribute("alertMsg", "예약에 실패하셨습니다");
            	response.sendRedirect(request.getContextPath());
        		
        	}
        	
        }
        
        else {
        	request.getSession().setAttribute("alertMsg", "예약에 실패하셨습니다");
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
