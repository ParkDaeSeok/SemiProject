package com.kh.hotel.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.hotel.model.service.HotelService;
import com.kh.hotel.model.vo.Map;

/**
 * Servlet implementation class IntoMapListController
 */
@WebServlet("/intoMap.ht")
public class IntoMapListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntoMapListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 값 뽑기
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		
		
		String hotelName;
		if(request.getParameter("hotelName").equals("없음") || request.getParameter("hotelName").equals("")) {
			hotelName = "";
		}
		else {
			hotelName = request.getParameter("hotelName");
		}
		
		int minPay = Integer.parseInt(request.getParameter("minPay"));
		int maxPay = Integer.parseInt(request.getParameter("maxPay"));
		int star = 0;
		if(request.getParameter("star").equals("0")) {
			star = 0;
		}
		else {
			star = Integer.parseInt(request.getParameter("star"));
		}
		
		
		// 맵화면 띄우도록 맵 데이터 가져오기
		ArrayList<Map> list = new HotelService().selectListMap(city, state, hotelName, minPay, maxPay, star);
		
		// 값 보내기
		request.setAttribute("list", list);
		
		// 화면 딴으로
		request.getRequestDispatcher("views/hotel/map.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
