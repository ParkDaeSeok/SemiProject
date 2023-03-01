package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindIdController
 */
@WebServlet("/findId.me")
public class MemberFindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindIdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
	
		String memberName = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		MemberService service = new MemberService();
		Member member = service.findMemberId(memberName, email, phone);
		
		
		if(member != null) {
			
			RequestDispatcher view = request.getRequestDispatcher("/views/member/findIdPop.jsp");
			request.setAttribute("findMember", member);
			view.forward(request, response);
			
		} else { 
				
			request.getSession().setAttribute("errorMsg", "일치하는 아이디가 없습니다. 다시입력해주세요.");
			
			response.sendRedirect(request.getContextPath() + "/findIdForm.me");
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
