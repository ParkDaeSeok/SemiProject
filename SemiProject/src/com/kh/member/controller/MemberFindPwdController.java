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
 * Servlet implementation class MemberFindPwdController
 */
@WebServlet("/findPwd.me")
public class MemberFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
	
		String memberId = request.getParameter("id");
		String memberName = request.getParameter("name");
		String email = request.getParameter("email");
		
		MemberService service = new MemberService();
		Member member = service.findMemberPwd(memberId, memberName, email);
		
		if(member != null) {
			
			RequestDispatcher view = request.getRequestDispatcher("/views/member/findPwdPop.jsp");
			request.setAttribute("members", member);
			view.forward(request, response);
			
		} else { 
				
			request.getSession().setAttribute("errorMsg", "정확한 정보를  다시 입력해주세요");
			response.sendRedirect(request.getContextPath() + "/findPwdForm.me");
			
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
