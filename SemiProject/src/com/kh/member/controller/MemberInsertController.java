package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController 	
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 값 가져오기
		String memberName = request.getParameter("memberName");
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		
		// 3) 매개변수 생성자를 이용해서 Member 객체에 담기
		Member m = new Member(memberName, memberId, memberPwd, gender, email, phone, birth);
		
		// 4) 요청 처리 (Service 단으로 전달)
		int result = new MemberService().insertMember(m);
		
		// 5) 처리 결과를 가지고 사용자가 보게 될 응답화면 지정
		if(result > 0) { // 성공 => /jsp 를 요청 => url 재요청방식 (sendRedirect)
			
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다."); // 로그인페이지에서 topbar.jsp를 include하지 않을 경우, 로그인 페이지에 스크립틀릿 내용 추가 필요함.
			
			//request.getRequestDispatcher("views/member/loginForm.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
			// index.jsp에서 로그인관련 location.href 할때, 서블릿 매핑값으로 변경해야함.
			// 이 상태에선 url 값이 insert.me로 나오고있음.
			
		} else {
			request.getSession().setAttribute("errorMsg", "회원가입에 실패했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/enrollForm.me");
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
