package com.kh.hotel.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.model.MyFileRenamePolicy;
import com.kh.hotel.model.service.HotelService;
import com.kh.hotel.model.vo.Photo;
import com.kh.hotel.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/reviewInsert.ht")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송 용량
			int maxSize = (1024 * 1024) * 10;
			
			String savePath = request.getServletContext().getRealPath("/resources/review_upfiles/");
			
			// MultipartRequest 객체 생성
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2) multiRequest 으로부터 값 추출 => getParameter 메소드 이용
			String hoName = multiRequest.getParameter("hoName");
			String reviewTitle = multiRequest.getParameter("reviewTitle");
			String reviewContent = multiRequest.getParameter("reviewContent");
			String reviewStar = multiRequest.getParameter("reviewStar");
			String reviewId = multiRequest.getParameter("reviewId");
			
			// 3) VO 가공
			Review r = new Review();
			r.setReviewTitle(reviewTitle);
			r.setReviewContent(reviewContent);
			r.setReviewStar(Integer.parseInt(reviewStar));
			r.setReviewId(reviewId);
			
			int bookNo = new HotelService().selectRecentBno(reviewId, hoName);
			
			ArrayList<Photo> pList = new ArrayList<>();
			
			// 키값 : file1 ~ 3
			for(int i = 1; i <= 3; i++) {
				
				// 키값만 미리 변수로 세팅
				String key = "file" + i;
				
				// 원본파일명이 존재하는지 메소드를 이용해서 파악 => 조건
				if(multiRequest.getOriginalFileName(key) != null) { // 원본 파일이 존재하는 경우
					
					// 첨부파일이 존재할 경우 Attachment 객체 생성
					// 필드 : 원본명, 수정명, 폴더경로
					Photo ph = new Photo();
					ph.setOriginName(multiRequest.getOriginalFileName(key));
					ph.setChangeName(multiRequest.getFilesystemName(key));
					ph.setFilePath("resources/review_upfiles/");

					
					pList.add(ph);
								
				}
				
			}
			
			// 4) Service 단으로 전달
			int result = new HotelService().insertReview(r, pList, bookNo);
			
			
			// 5) 결과에 따른 응답뷰 지정
			if(result > 0) { // 성공
				
				request.getSession().setAttribute("alertMsg", "성공적으로 작성되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detailHotel.ht?currentPage=1&hoName=" + URLEncoder.encode(multiRequest.getParameter("hoName"), "UTF-8") + "&checkIn=" + multiRequest.getParameter("checkIn") + "&checkOut=" + multiRequest.getParameter("checkOut"));
				
			} else { // 실패

			}
			
			
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
