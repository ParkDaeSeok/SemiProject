package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;


/* 
 * 박대석 
 * 
 *  */

/**
 * Servlet implementation class ReservationCancelController
 */
@WebServlet("/bCancel.me")
public class ReservationCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCancelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//post - encoding
		request.setCharacterEncoding("UTF-8");
		
		// 값 뽑기
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int bookNo = Integer.parseInt(request.getParameter("reservation_number"));
		String name = request.getParameter("reservation_name");
		
		System.out.println("name : "+name);
		System.out.println("bookNo : "+bookNo);
		System.out.println("memberNo : "+memberNo);
		
		// 서버에 저장된 멤버숫자로 멤버 정보를 받아오기 그리그 그 정보와 작성받은 정보가 같은지 확인
		Member m = new MemberService().loadMemberInfo(memberNo);
		
		int result = 0;
		
		if(m.getMemberName().equals(name)) { // 로그인한 멤버정보의 멤버이름과 받아온 멤버이름이 같을때
			
			//service단으로
			result = new MemberService().reservationCancel(bookNo, m.getMemberNo());
			
			if(result>0) { // 업데이트 성공시 일단 예약 확인 창으로
				request.getSession().setAttribute("alertMsg", "예약 취소에 성공했습니다");
				response.sendRedirect(request.getContextPath()+"/myPageForm.me?memberNo="+memberNo);
			}
			else { // 업데이트 실패 -> 예약 취소 창으로
				request.getSession().setAttribute("alertMsg", "예약 취소에 실패했습니다");
				response.sendRedirect(request.getContextPath()+"/bCancelForm.me?memberNo="+memberNo);
			}
		}
		else { // 로그인한 멤버이름과 받아온 멤버이름이 다를 때
			request.getSession().setAttribute("alertMsg", "작성하신 이름은 없는 회원입니다");
			response.sendRedirect(request.getContextPath()+"/bCancelForm.me?memberNo="+memberNo);
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
