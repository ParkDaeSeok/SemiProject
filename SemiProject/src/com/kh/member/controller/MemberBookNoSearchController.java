package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Booking;
import com.kh.member.model.vo.Member;

/* 
 * 박대석 

 * 
 *  */


/**
 * Servlet implementation class MemberBookNoSearchController
 */
@WebServlet("/bSearch.me")
public class MemberBookNoSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBookNoSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post - encoding
		request.setCharacterEncoding("UTF-8");
		
		
		// 값 뽑기
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(memberNo);
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		
		// vo - pass
		
		// 셀렉트문으로 원하는 결과 받아오기
		ArrayList<Booking> list = new MemberService().selectSearchBookNo(memberNo, bookNo);
		
		
		// 값 보내기
		request.setAttribute("list", list);
		
		// jsp파일로 이동
		request.getRequestDispatcher("views/member/reservationSelect.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
