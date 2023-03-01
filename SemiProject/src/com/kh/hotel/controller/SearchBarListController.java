package com.kh.hotel.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.hotel.model.service.HotelService;
import com.kh.hotel.model.vo.Hotel;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

/**
 * Servlet implementation class SearchBarListController
 */
@WebServlet("/slist.ht")
public class SearchBarListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBarListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징처리
		int listCount;
		int currentPage;
		int pageLimit;
		int hotelLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		// 값 뽑기
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		
		String sort = request.getParameter("sort-by");
		
		String hotelName = request.getParameter("hotelName");
		int minPay = Integer.parseInt(request.getParameter("minPay"));
		int maxPay = Integer.parseInt(request.getParameter("maxPay"));
		int star = 0;
		if(request.getParameter("star") == null) {			
			star = 0;
		}
		else {
			star = Integer.parseInt(request.getParameter("star"));
		}
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		
		System.out.println(city);
		System.out.println(state);
		// * listCount : 총 리스트 갯수
		listCount = new HotelService().selectListCount(city, state);
		
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
		
		// vo패싱
		
		// service단으로
		ArrayList<Hotel> list = new HotelService().selectListHotelPlace(state, city, pi);
		
		
		// 뽑아온 list  request의 attribute 영역에 담아 응답페이지로
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("state", state);
		request.setAttribute("city", city);
		request.setAttribute("hotelName", hotelName);
		request.setAttribute("minPay", minPay);
		request.setAttribute("maxPay", maxPay);
		request.setAttribute("star", star);
		request.setAttribute("sort", sort);
		request.getSession().setAttribute("checkIn", checkIn); // 체크인 체크아웃날짜 세션으로 
		request.getSession().setAttribute("checkOut", checkOut);
		
		System.out.println(list);
		System.out.println(pi.getListCount());
		
		// 화면띄우기
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
