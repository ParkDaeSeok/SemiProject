package com.kh.hotel.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.hotel.model.service.HotelService;
import com.kh.hotel.model.vo.Hotel;

/**
 * Servlet implementation class SortHotelController
 */
@WebServlet("/hSort.ht")
public class SortHotelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortHotelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 값 뽑기
		String sort = request.getParameter("sort-by");
		
		String hotelName = request.getParameter("hotelName");
		
		int star = 0;
		if(request.getParameter("star").equals("0")) {
			star = 0;
		}
		else {
			star = Integer.parseInt(request.getParameter("star"));
		}
		int minPay = Integer.parseInt(request.getParameter("minPay"));
		int maxPay = Integer.parseInt(request.getParameter("maxPay"));
		
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		
		System.out.println("star : "+star);
		System.out.println("hotelName : "+hotelName);
		System.out.println("minPay : "+ minPay);
		System.out.println("maxPay : "+maxPay);
		System.out.println("state : "+state);
		System.out.println("city : "+city);
		System.out.println("sort : "+sort);
		
		// 페이징처리
		int listCount;
		int currentPage;
		int pageLimit;
		int hotelLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		// * listCount : 총 리스트 갯수
		listCount = new HotelService().selectListCountSort(city, state, star, minPay, maxPay, hotelName);
		
		// * currentPage : 현재페이지(== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 페이징바의 페이지 최대 갯수
		pageLimit = 10;
		
		// * hotelLimit : 한 페이지에 보여질 게시글의 최대 갯수
		hotelLimit = 6;
		
		// * maxPage : 가장 마지막 페이지가 몇번  페이지인지 (총 페이지 갯수)
		maxPage = (int)Math.ceil((double)listCount / hotelLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		startPage = ((currentPage-1) / pageLimit) * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 마지막 수
		endPage = startPage + pageLimit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// page관련 객체 만들기
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, hotelLimit
				                  ,maxPage, startPage, endPage);
		
		
		ArrayList<Hotel> list;
		// service단으로
		if(sort.equals("highPay")) {
			list = new HotelService().selectListSort1(hotelName, star, minPay, maxPay, city, state, pi);			
		}
		else if(sort.equals("lowPay")) {
			list = new HotelService().selectListSort2(hotelName, star, minPay, maxPay, city, state, pi);
		}
		else {
			list = new HotelService().selectListSort3(hotelName, star, minPay, maxPay, city, state, pi);
		}
		
		// 값 보내기
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("state", state);
		request.setAttribute("city", city);
		request.setAttribute("hotelName", hotelName);
		request.setAttribute("minPay", minPay);
		request.setAttribute("maxPay", maxPay);
		request.setAttribute("star", star);
		request.setAttribute("sort", sort);
		request.getSession().setAttribute("checkIn", checkIn);
		request.getSession().setAttribute("checkOut", checkOut);
		
		request.getRequestDispatcher("views/hotel/hotelResult.jsp").forward(request, response);
		
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
