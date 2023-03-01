<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList
			   , java.util.HashMap
			   , java.util.Map.Entry
			   , com.kh.hotel.model.vo.*
			   , com.kh.common.model.vo.PageInfo" 
%>
<%-- 박대석 --%>    
<%

	String checkIn = (String)request.getAttribute("checkIn");
	String checkOut = (String)request.getAttribute("checkOut");

	// 호텔 관련 Attribute
	String hoName = (String)request.getAttribute("hoName");
	int hoStar = (int)request.getAttribute("hoStar");
	String hoDesc = (String)request.getAttribute("hoDesc");
	
	// 객실 관련 Attribute
	ArrayList<Room> rList = (ArrayList<Room>)request.getAttribute("rList");
	
	// 예약 관련 Attribute
	ArrayList<Review> boList = (ArrayList<Review>)request.getAttribute("boList");
	
	// 명소 관련 Attribute
	ArrayList<Attractions> attNearBy = (ArrayList<Attractions>)request.getAttribute("attNearBy");
	ArrayList<Attractions> attAirport = (ArrayList<Attractions>)request.getAttribute("attAirport");
	ArrayList<Attractions> attHotPlace = (ArrayList<Attractions>)request.getAttribute("attHotPlace");
	
	// 편의시설 관련 Attribute
	ArrayList<Amenities> amList = (ArrayList<Amenities>)request.getAttribute("amList");
	
	// 지도 관련 Attribute
	Map m = (Map)request.getAttribute("m");
	
	// 후기 관련 Attribute
	HashMap<Integer, Review> rvList = (HashMap<Integer, Review>)request.getAttribute("rvList");
	ArrayList<Review> rvPhotoList = (ArrayList<Review>)request.getAttribute("rvPhotoList");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	ArrayList<Integer> rvStar = (ArrayList<Integer>)request.getAttribute("rvStar");
	HashMap<String, Integer> rvStarCount = (HashMap<String, Integer>)request.getAttribute("rvStarCount");
	
	

	
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>HTML - HotelMostList</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet" href="/html/views/common/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/html/views/common/css/animate.css">
    
    <link rel="stylesheet" href="/html/views/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/html/views/common/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/html/views/common/css/magnific-popup.css">

    <link rel="stylesheet" href="/html/views/common/css/aos.css">

    <link rel="stylesheet" href="/html/views/common/css/ionicons.min.css">

    
    <link rel="stylesheet" href="/html/views/common/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/html/views/common/css/jquery.timepicker.css">

    <link rel="stylesheet" href="/html/views/common/css/flaticon.css">
    <link rel="stylesheet" href="/html/views/common/css/icomoon.css">
    <link rel="stylesheet" href="/html/views/common/css/style_kcg.css?ver=14">

  </head>
  <body>

  	<%@ include file="../common/topbar.jsp" %>
    <!-- END nav -->



    <section class="ftco-section ftco-degree-bg" style="background: rgb(248, 245, 244);">
      <div class="custom-searchbar-wrap" id="container">
        <h3 class="heading mb-4" id="hotel-text" style="margin-left :0px;">호텔 찾기</h3>
			<form action="" onsubmit= "return false;" id="searchBar">
				<div class="form-group" style="width:16%;">
				<input type="text" name="city" class="form-control" placeholder="도시" style="border-radius: 10px;" id="city1">
				</div>
				<div class="form-group" style="width:18%;">
					<div class="select-wrap one-third">
						<select name="state" class="form-control" placeholder="Keyword search" style="border-radius: 10px;" id="state1">
							<option value="">지역 선택</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="강원">강원</option>
							<option value="충청">충청</option>
							<option value="전라">전라</option>
							<option value="경상">경상</option>
						</select>
					</div>
				</div>
				<div class="form-group" style="width:18%;">
					<input type="text" name="checkin" id="checkin_date" class="form-control checkin_date" placeholder="체크인" style="border-radius: 10px;" onchange="checkIn();" value="<%= checkIn %>">
				</div>
				<div class="form-group" style="width:18%;">
					<input type="text" name="checkout" id="checkout_date" class="form-control checkout_date" placeholder="체크아웃" style="border-radius:10px;" onchange="checkOut();" value="<%= checkOut %>">
				</div>
				<div class="form-group">
					<input type="submit" value="Search" class="btn btn-primary py-3 px-5" style="background : #59D6F8" id="search-2" onclick="searchBar();">
				</div>
			</form>
      </div> <!-- 결과창 값 완성시킨분한테 받거나 추후 만들기 -->

      <div class="container" id="main_container">
		<div class="scrollUp"> 
			<a href="#"><img src="<%= contextPath %>/resources/img/icons/scrollUp.png"></a>
		</div>
        <div class="row">
          <div class="col-lg-9">
          	<div class="row">
          		<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
          			<!-- <span>Our Best hotels &amp; Rooms</span> -->
					  <p id="top-tag" style="visibility: hidden;">top-tag</p>
          			<h1><%= hoName %></h1> <!-- 호텔 이름 -->
          			<p class="rate mb-5">
          				<!-- <span class="loc"><a href="#"><i class="icon-map"></i> 대한민국 서울 강남구 삼성동 112-5 06153</a></span> -->
          				<span class="star">
								<br>
								<% if(5 - hoStar == 0) { %> <!-- 호텔 별점 / 호텔 평점이 5점인 경우 -->
								
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									
								<% } else { %> <!-- 호텔 평점이 5점이 아닌 경우 -->
								
									<% int emptyStar = 5 - hoStar; %>
									
									<% for(int i = 5; i > 0; i--) { %>
										
										<% if(i > emptyStar) { %> <!-- 호텔 점수만큼 별 채우기 -->
										
											<i class="icon-star"></i>	
													
										<% } else { %> <!-- 호텔 점수만큼 채웠다면, 나머지는 빈 별로 채우기 -->
										
											<i class="icon-star-o"></i>	
											
										<% } %>
										
									<% } %>
									
								<% } %>
						</span>
    				</p>
          		</div>
				<div class="col-md-12 ftco-animate" >
					<div class="single-slider owl-carousel">
						<div class="item">
							<div class="hotel-img" style="background-image: url(<%= contextPath %>/resources/img/hotel-2-lamid.jpg);"></div>
						</div>
						<div class="item">
							<div class="hotel-img" style="background-image: url(<%= contextPath %>/resources/img/hotel-3-lamid.jpg);"></div>
						</div>
						<div class="item">
							<div class="hotel-img" style="background-image: url(<%= contextPath %>/resources/img/hotel-4-lamid.jpg);"></div>
						</div>
					</div>
				</div>

				<div class="custom-content-navbar d-md-flex mt-5 mb-5">
					<div><a id="summary-menu">개요</a></div>
					<div><a id="our-rooms-menu">객실 소개</a></div>
					<div><a id="location-menu">위치</a></div>
					<div><a id="comforts-menu">편의시설</a></div>
					<div><a id="review-menu">이용 후기</a></div>
				</div>

				<p id="summary" style="visibility: hidden;">summary-tag</p>
				<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate" >
				<h4>개요</h4>
				<p id="summary-content">
					<%= hoDesc %> <!-- 호텔 개요 -->
				</p>
				</div>

				<p id="our-rooms" style="visibility: hidden;">our-rooms-tag</p>
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">객실 소개</h4>
					<form action="<%= contextPath %>/payEnrollForm.py" id="roomChoiceForm"> <!-- 결제 페이지로 넘길 값 -->
						<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4" id="checkIn-Out">
								<h4>이곳에서 머물 기간을 설정해주세요</h4><hr><br>
								<input type="hidden" name="hotelName" value="<%= hoName %>">
								<input type="hidden" id="roomPrice_pay" name="roomPrice" value="">
								<input type="hidden" id="roomNo_pay" name="roomNo" value="">
								<input type="hidden" name="memberNo" value=<%= loginMember.getMemberNo() %>>
 								<div class="form-group check-form">
									<h5>체크인 날짜</h5> <!-- request로 넘어온 값 get Attribute -->
									<input type="text" id="checkin_date" class="form-control checkin_date" name="checkIn_pay" placeholder="체크인" value="<%= checkIn %>">
								</div>
								<div class="form-group check-form">
									<h5>체크아웃 날짜</h5> <!-- request로 넘어온 값 get Attribute -->
									<input type="text" id="checkout_date" class="form-control checkout_date" name="checkOut_pay" placeholder="체크아웃" value="<%= checkOut %>">
								</div>

								<div class="form-group check-form">
									<h5>객실 선택</h5>
									<select class="form-control" id="roomName_pay" name="roomName" style="width: 244px;">
										<option>객실 종류 선택</option> <!-- ROOM_NAME DB값 -->
										<% for(Room r : rList) { %>
											<option><%= r.getRoomName() %></option>
										<% } %>
									</select>
								</div>

								<br><br>

								<div id="booker1"> <!-- ROOM_PEOPLE DB값 유효성 검사 -->
								<label>성인</label>
									<select name="adult" id="adult">
										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
									<label>명</label>
								</div>

								<!--
								<div id="booker2">
									<label>어린이</label>
									<select>
										<option value="0" selected>0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
									<label>명</label>
								</div>
								 -->
								<button type="button" class="btn btn-primary" id="payment-button">예약 하기</button>
							</form> 
								
						</div >
						<div class="row" id="room-row">
							<% for(Room r : rList) { %>
								<div class="col-md-4">
									<div class="destination">
										<a href="hotel-single.html" class="img img-2" style="background-image: url(<%= contextPath %>/resources/img/lamid-twin.jpg);"></a>
										<div class="text p-3">
											<div class="d-flex">
												<div class="one">
													<h3><a href="hotel-single.html" class="roomName-pay"><%= r.getRoomName() %></a></h3> <!-- ROOM_NAME DB값 -->
												</div>
												<div class="two">
													<span class="price per-price">₩ <%= r.getRoomPrice() %><br><small>/1박당 요금 시작가</small></span> <!-- ROOM_PRICE DB값 -->
												</div>
											</div>
											<img src="<%= contextPath %>/resources/img/icons/wifi_signal.png" width="20px" height="20px" style="float: left;"><p> &nbsp;&nbsp; 무료 와이파이</p> <!-- ROOM_OPTION DB 값 -->
											<img src="<%= contextPath %>/resources/img/icons/people.png" width="20px" height="20px" style="float: left;"><p> &nbsp;&nbsp; 수용 인원 : <%= r.getRoomOption().split(", ")[0] %></p>
											<img src="<%= contextPath %>/resources/img/icons/bed.png" width="20px" height="20px" style="float: left;"><p> &nbsp;&nbsp; <%= r.getRoomOption().split(", ")[1] %></p>
											<% if( r.getRoomOption().split(", ")[2].equals("흡연 가능") ) { %>
												<img src="<%= contextPath %>/resources/img/icons/smoking.png" width="20px" height="20px" style="float: left;"><p> &nbsp;&nbsp; <%= r.getRoomOption().split(", ")[2] %></p>
											<% } else { %>
												<img src="<%= contextPath %>/resources/img/icons/nosmoking.png" width="20px" height="20px" style="float: left;"><p> &nbsp;&nbsp; <%= r.getRoomOption().split(", ")[2] %></p>
											<% } %>
										</div>
									</div>
								</div>
							<% } %>						
			<p id="location" style="visibility: hidden;">location-tag</p>
			<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
				<h4>위치</h4>
				<div class="row" id="hotel-location" >
					<div class="hotel-location-content" id="hotel-location-content-id1">
						<img src="<%= contextPath %>/resources/img/icons/playground.png" width="20px" height="20px" style="float: left;"> &nbsp;&nbsp; <h6>주변 장소</h6>
						<br>
						<ul>
							<% for(Attractions att : attNearBy) { %> <!-- 주변 명소 -->
								<li>
									<%= att.getAttName() %> <!-- ATT_NAME DB값 -->
									<span><%= att.getDistance() + " km" %></span> <!-- DISTANCE DB값 -->
								</li>
								<hr>
							<% } %>
						</ul>

						<img src="<%= contextPath %>/resources/img/icons/airplane.png" width="20px" height="20px" style="float: left;"> &nbsp;&nbsp; <h6>가까운 공항</h6>
						<ul>
							<% for(Attractions att : attAirport) { %> <!-- 공항 -->
								<li>
									<%= att.getAttName() %>
									<span><%= att.getDistance() + " km" %></span>
								</li>
								<hr>
							<% } %>
						</ul>
					</div>

					<div class="hotel-location-content" id="hotel-location-content-id2">
						<img src="<%= contextPath %>/resources/img/icons/playground.png" width="20px" height="20px" style="float: left;"> &nbsp;&nbsp; <h6>인기 명소</h6>
						<br>
						<ul>
							<% for(Attractions att : attHotPlace) { %> <!-- 인기 명소 -->			
								<li>
									<%= att.getAttName() %>
									<span><%= att.getDistance() + " km" %></span>
								</li>
								<hr>
							<% } %>
						</ul>
					</div>
					<div id="hotel-location-map">
						<!-- 지도가 생성되는 div 영역, id 는 naverMap 으로 설정 --> 
						<!-- API 클라이언트 ID 추가 후, 크기 조절 -->
					<div id="naverMap" style="margin:0 auto; width:300px; max-width:100%; height:400px;"></div>
					</div>
				</div>
			</div >

			<p id="comforts" style="visibility: hidden;">comforts-tag</p>
			<div class="col-md-12 hotel-single ftco-animate mb-5 mt-5">
				<h4 class="mb-4">편의 시설</h4>
				<div class="row">		

					<% for(Amenities am : amList) { %>					
					<div class="col-md-4" >
					  <div class="destination">
						<img src="<%= contextPath %>/resources/img/lamid-spa.jpg" class="img img-2" style="width: 100%;"> <!-- switch 써서 String.contain로 이미지 바꿔주기 -->
						  <div class="text p-3">
							  <div class="d-flex">
									  <div class="one">
										  <h3><%= am.getAmName() %></h3> <!-- AM_NAME DB값 -->
										  <img src="<%= contextPath %>/resources/img/icons/price.png" width="20px" height="20px" style="float: left;"><p>  &nbsp;&nbsp; <%= am.getAmPrice() %></p> <!-- AM_PRICE DB값 -->
										  <img src="<%= contextPath %>/resources/img/icons/time.png" width="20px" height="20px" style="float: left;"><p>  &nbsp;&nbsp; <%= am.getAmTime() %></p> <!-- AM_TIME DB값 -->
									  </div>
									  <div class="two">
									  </div>
								  </div>
							  </div>
						  </div>
					  </div>	
					<% } %>

			<!-- 평점 작성 누르면, modal 띄워서 값 받기 -->
			<p id="review" style="visibility: hidden;">review-tag</p>
          		<div class="col-md-12 hotel-single ftco-animate mb-5 mt-4">
          			<h4 class="mb-4">이용 후기 &amp; 평점</h4>
          			<div class="row" id="hotel-review" >
          				<div id="hotel-review-total">
							<h3><%= rvStar.get(0) %></h3> <!-- REVIEW 테이블 TRUNC(AVG(HOTEL_STAR), 1) -->
							<span>/ 5</span>
							<h6><%= rvStar.get(1) %> 건의 이용 후기 점수</h6> <!-- REVIEW 테이블 COUNT(*) -->
							<h5>훌륭함</h5>
							<div id="review-progress">
								<div>
									<label>5 - 훌륭해요</label>
									<label class="review-progress-val"><%= rvStarCount.get("5점") %></label> <!-- REVIEW 테이블 COUNT(REVIEW_STAR) WHERE 별점수 -->
									<br>
									<progress value="<%= rvStarCount.get("5점") %>" min="0" max="<%= rvStar.get(1) %>"></progress> <!-- max 값은 REVIEW 테이블 COUNT(*) -->
								</div>
								<div>
									<label>4 - 좋아요</label>
									<label class="review-progress-val"><%= rvStarCount.get("4점") %></label>
									<br>
									<progress value="<%= rvStarCount.get("4점") %>" min="0" max="<%= rvStar.get(1) %>"></progress>
								</div>
								<div>
									<label>3 - 괜찮아요</label>
									<label class="review-progress-val"><%= rvStarCount.get("3점") %></label>
									<br>
									<progress value="<%= rvStarCount.get("3점") %>" min="0" max="<%= rvStar.get(1) %>"></progress>
								</div>
								<div>
									<label>2 - 별로예요</label>
									<label class="review-progress-val"><%= rvStarCount.get("2점") %></label>
									<br>
									<progress value="<%= rvStarCount.get("2점") %>" min="0" max="<%= rvStar.get(1) %>"></progress>
								</div>
								<div>
									<label>1 - 너무 별로예요</label>
									<label class="review-progress-val"><%= rvStarCount.get("1점") %></label>
									<br>
									<progress value="<%= rvStarCount.get("1점") %>" min="0" max="<%= rvStar.get(1) %>"></progress>
								</div>
								<br><br>
								<% if(loginMember != null) { %>
									<% for(int i = 0; i < boList.size(); i++) { %>
										<% if(loginMember.getMemberId().equals( boList.get(i).getReviewId() )) { %>
											<button type="button" class="btn btn-primary" id="review-create" data-toggle="modal" data-target="#review-Modal">후기 작성</button>
											<% i = boList.size(); %>
										<% } %>
									<% } %>
								<% } %>  
							</div>
						</div>
						
						<div id="hotel-review-comment">
						
							<% for(Entry<Integer, Review> entry : rvList.entrySet()) { %>
								<% Review r = entry.getValue(); %>
								<div class="reviewer">							
										<h5 class="review-id"><%= r.getReviewId() %></h5> <!-- REVIEW_ID -->
										<span class="review-date"><%= r.getCreateDate() %></span> <!-- REVIEW CREATE_DATE DB값 -->
										<br><br>
										
									<p class="rate" style="margin-top: -25px; margin-left: 5px;">

										<% if(5 - r.getReviewStar() == 0) { %> <!-- 후기 별점이 5점인 경우 -->
										
											<i class="icon-star"></i>
											<i class="icon-star"></i>
											<i class="icon-star"></i>
											<i class="icon-star"></i>
											<i class="icon-star"></i>
											
										<% } else { %> <!-- 후기 평점이 5점이 아닌 경우 -->
										
											<% int emptyStar = 5 - r.getReviewStar(); %>
											
											<% for(int i = 5; i > 0; i--) { %>
												
												<% if(i > emptyStar) { %> <!-- 후기 점수만큼 별 채우기 -->
												
													<i class="icon-star"></i>	
															
												<% } else { %> <!-- 후기 점수만큼 채웠다면, 나머지는 빈 별로 채우기 -->
												
													<i class="icon-star-o"></i>	
													
												<% } %>
												
											<% } %>
											
										<% } %>
										
										
										&nbsp;
										<span style="font-size: 17px;"><%= r.getReviewStar() %> / 5</span> <!-- REVIEW_STAR DB값 -->								
									</p>
									<h5 style="margin-left: 5px;"><%= r.getReviewTitle() %></h5> <!-- REVIEW_TITLE -->
									<pre class="review-comment"><%= r.getReviewContent() %></pre> <!-- REVIEW_CONTENT -->
									<% for(Review ph : rvPhotoList) { %>
										<% if(r.getReviewNo() == ph.getReviewNo()) { %>
											<img class="review-photo-frame" style="width: 100px; height: 100px;" src="<%= contextPath %>/resources/review_upfiles/<%= ph.getImg() %>">
										<% } %>
									<% } %>
									<hr>
								</div>
							<% } %>		
							
							<div class="row mt-5">
								<div class="col text-center">
								  <div class="block-27">
									<ul>
									
									  <!-- 이용후기의 '<'버튼 이전 페이지로 이동 -->
									  <% if(currentPage != 1) {  %>
									  	<li><a href="<%= contextPath %>/detailHotel.ht?currentPage=<%= currentPage - 1 %>&hoName=<%= hoName %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>">
										  	&lt;
									  	</a></li>
									  <% } else { %>
									  	<li><a href="javascript:void(0);">&lt;</a></li>
									  <% } %>
									  
									  <% for(int i = startPage; i <= endPage; i++) { %>
									  	<% if(i != currentPage) { %>
									  		<li><a href="<%= contextPath %>/detailHotel.ht?currentPage=<%= i %>&hoName=<%= hoName %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>">
									  			<%= i %>
									  		</a></li>
									  	<% } else { %>
									  		<li><a href="javascript:void(0);"><%= i %></a></li>
									  	<% } %>
									  	
									  <% } %>
									  
									  <!-- 이용후기의 '>'버튼 다음 페이지로 이동 -->
									  <% if(currentPage != maxPage) { %>
									  	<li><a href="<%= contextPath %>/detailHotel.ht?currentPage=<%= currentPage + 1 %>&hoName=<%= hoName %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>">&gt;</a></li>
									  <% } %>
									  
									</ul>
								  </div>
								</div>
							</div>
							
						</div>	
          			</div>
          		</div>
          	</div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

	<!-- The Modal -->
	<div class="modal" id="review-Modal" data-backdrop="static">
		<div class="modal-dialog">
			<form id="modal-form" action="<%= contextPath %>/reviewInsert.ht" method="post" enctype="multipart/form-data">
				<div class="modal-content">
		
						<!-- Modal Header -->
						<div class="modal-header">
						<h4 class="modal-title">이용 후기</h4> <!-- loginUser 세션으로 불러오기 -->
						</div>
				
						<!-- Modal body -->
							<div class="modal-body">
								<input type="hidden" name="hoName" value="<%= hoName %>">
								<input type="hidden" name="checkIn" value="<%= checkIn %>">
								<input type="hidden" name="checkOut" value="<%= checkOut %>">
								<% if(loginMember != null) { %>
									<input type="hidden" name="reviewId" value="<%= loginMember.getMemberId() %>"> <!-- loginMember 세션 값 -->
									<h5 class="review-id"><%= loginMember.getMemberId() %></h5> <!-- loginMember 세션 값 -->
								<% } %>
								<span class="review-date" id="review-modal-date"></span> <!-- Sysdate -->
								<div class="star-rating">
									<input type="radio" id="5-stars" name="reviewStar" value="5" checked/>
									<label for="5-stars" class="star">&#9733;</label>
									<input type="radio" id="4-stars" name="reviewStar" value="4"/>
									<label for="4-stars" class="star">&#9733;</label>
									<input type="radio" id="3-stars" name="reviewStar" value="3"/>
									<label for="3-stars" class="star">&#9733;</label>
									<input type="radio" id="2-stars" name="reviewStar" value="2"/>
									<label for="2-stars" class="star">&#9733;</label>
									<input type="radio" id="1-star" name="reviewStar" value="1"/>
									<label for="1-star" class="star">&#9733;</label>
								</div>
								<hr>
								<div><input type="text" name="reviewTitle" style="width: 100%; border-style: none;" maxlength="30" placeholder="한줄평 입력" required></div>
								<hr>
								<textarea id="review-textarea" name="reviewContent" placeholder="내용 입력" maxlength="160" required></textarea>
								<img class="modal-review-photo-frame" id="photo-frame1" onclick="removeImg(this, 1);">
								<img class="modal-review-photo-frame" id="photo-frame2" onclick="removeImg(this, 2);">
								<img class="modal-review-photo-frame" id="photo-frame3" onclick="removeImg(this, 3);">
							</div>
							


							<!-- Modal footer -->
							<div class="modal-footer">
								<label id="input-file-button" onclick="changeFor(this);">
									사진 업로드
								</label>
								<label id="input-file-desc">사진 클릭 시, 제거됩니다.</label>
								<input type="file" id="input-file1" name="file1" style="display:none" onchange="loadImg(this, 1);">
								<input type="file" id="input-file2" name="file2" style="display:none" onchange="loadImg(this, 2);">
								<input type="file" id="input-file3" name="file3" style="display:none" onchange="loadImg(this, 3);">
								<button type="button" id="modal-submit" class="btn btn-info" data-dismiss="modal">등록</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							</div>
		
					</div>
				</form>
			</div>
		</div>



    <footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
		  <div class="row mb-5">
			<div class="col-md">
			  <div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">HTML Hotel</h2>
				<p>HTML Hotel은 경쟁력 있는 가격에 폭넓은 호텔 상품을 제공하는, 아시아에서 가장 빠르게 성장하고 있는 온라인 호텔예약 포털입니다. 전국 만 여개에 이르는 호텔 파트너를 보유하고 웹사이트를 통해 호텔예약 서비스를 제공함으로써, 여행자들은 다양한 예산에 맞는 객실 모든 상품을 예약하실 수 있습니다.</p>
			  </div>
			</div>
			<div class="col-md">
			  <div class="ftco-footer-widget mb-4 ml-md-5">
				<h2 class="ftco-heading-2">더 알아보기</h2>
				<ul class="list-unstyled">
				  <li><a href="#" class="py-2 d-block">호스트 되기</a></li>
				  <li><a href="#" class="py-2 d-block">최저 수수료</a></li>
				  <li><a href="#" class="py-2 d-block">개인정보 및 정책</a></li>
				</ul>
			  </div>
			</div>
			<div class="col-md">
			   <div class="ftco-footer-widget mb-4">
				<h2 class="ftco-heading-2">고객센터</h2>
				<ul class="list-unstyled">
				  <li><a href="#" class="py-2 d-block">FAQ</a></li>
				  <li><a href="#" class="py-2 d-block">결제수단</a></li>
				  <li><a href="#" class="py-2 d-block">예약팁</a></li>
				</ul>
			  </div>
			</div>
			<div class="col-md">
			  <div class="ftco-footer-widget mb-4">
				  <h2 class="ftco-heading-2">Contact</h2>
				  <div class="block-23 mb-3">
					<ul>
					  <li><span class="icon icon-map-marker"></span><span class="text">서울시 양천구 무슨동 922-2</span></li>
					  <li><a href="#"><span class="icon icon-phone"></span><span class="text">+82 10-7444-2093</span></a></li>
					  <li><a href="#"><span class="icon icon-envelope"></span><span class="text">kung132@iei.co.kr</span></a></li>
					</ul>
				  </div>
			  </div>
			</div>
		  </div>
		  <div class="row">
			<div class="col-md-12 text-center">
  
			  <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		  </div>
		</div>
	  </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/html/views/common/js/jquery.min.js"></script>
  <script src="/html/views/common/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/html/views/common/js/popper.min.js"></script>
  <script src="/html/views/common/js/bootstrap.min.js"></script>
  <script src="/html/views/common/js/jquery.easing.1.3.js"></script>
  <script src="/html/views/common/js/jquery.waypoints.min.js"></script>
  <script src="/html/views/common/js/jquery.stellar.min.js"></script>
  <script src="/html/views/common/js/owl.carousel.min.js"></script>
  <script src="/html/views/common/js/jquery.magnific-popup.min.js"></script>
  <script src="/html/views/common/js/aos.js"></script>
  <script src="/html/views/common/js/jquery.animateNumber.min.js"></script>
  <script src="/html/views/common/js/bootstrap-datepicker.js"></script>
  <script src="/html/views/common/js/jquery.timepicker.min.js"></script>
  <script src="/html/views/common/js/scrollax.min.js"></script>
  <script src="/html/views/common/js/google-map.js"></script>
  <script src="/html/views/common/js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

  <script>
	  $(function() {

		// 새로고침 시, 스크롤이 맨 위로 올라가게
		setTimeout(function() {
			scrollTo(0, 0);
		}, 100);

		// 탭 클릭 시, 부드럽게 내려가는 애니메이션
		$("#summary-menu").on('click', function() {
			var offset = $("#summary").offset();
			var searchbar = $(".custom-searchbar-wrap").height();
			$("html, body").animate({scrollTop: offset.top - (searchbar - 20) }, 400);
		})

		$("#our-rooms-menu").on('click', function() {
			var offset = $("#our-rooms").offset();
			var searchbar = $(".custom-searchbar-wrap").height();
			$("html, body").animate({scrollTop: offset.top - (searchbar - 20) }, 400);
		})

		$("#location-menu").on('click', function() {
			var offset = $("#location").offset();
			var searchbar = $(".custom-searchbar-wrap").height();
			$("html, body").animate({scrollTop: offset.top - (searchbar - 20) }, 400);
		})

		$("#comforts-menu").on('click', function() {
			var offset = $("#comforts").offset();
			var searchbar = $(".custom-searchbar-wrap").height();
			$("html, body").animate({scrollTop: offset.top - (searchbar - 20) }, 400);
		})

		$("#review-menu").on('click', function() {
			var offset = $("#review").offset();
			var searchbar = $(".custom-searchbar-wrap").height();
			$("html, body").animate({scrollTop: offset.top - (searchbar - 20) }, 400);
		})

		// 버튼 클릭 시 화면 최상단으로 이동
		$(".scrollUp").on('click', function() {
			//var offset = $('#top-tag').offset();
			$("html, body").animate({scrollTop: 0}, 400);
		})

		// 후기 작성 modal 창 클릭 시, 날짜를 오늘 날짜로 세팅
		$('#review-create').on('click', function() {
			var date = new Date();
			var month = date.getMonth() + 1; 
			var day = date.getDate();
			var year = date.getFullYear();
			$("#review-modal-date").html('<b>' + year + '년 ' + month + '월 ' + day + '일' + '</b>');
		});

		// 후기 작성 modal 창 내용물의 양에 따라 자동으로 height 크기 조절
		$("#review-textarea").on('keydown keyup paste', function() {
			$(this).css('height', 'auto');
			$(this).height(this.scrollHeight);
		});
		
		$('.review-comment').prop('readonly', true);

		$("#modal-submit").click(function() {
			$("#modal-form").submit();
		});

		// 객실 선택 시, 금액이 input에 담김
		$("#roomName_pay").on('change', function() {
			var $roomName = $(this).val();
			
			<% for(Room r : rList) { %>
				var rName = "<%= r.getRoomName() %>";
				if($roomName == rName) {
					var roomPrice = "<%= r.getRoomPrice() %>";
					var roomNo = "<%= r.getRoomNo() %>";
					$("#roomPrice_pay").val(roomPrice);
					$("#roomNo_pay").val(roomNo);
				}
			<% } %>
		});

		$("#payment-button").on('click', function() {
			var $roomName = $("#roomName_pay").val();
			
			<% for(Room r : rList) { %>
				var rName = "<%= r.getRoomName() %>"
				if($roomName == rName) {
					var roomLimit = "<%= r.getRoomPeople() %>"
					var $adult = $("#adult").val();
					if(roomLimit < $adult) {
						alert('객실 수용 인원 이상으로 선택하셨습니다.');
					} else {
						$("#roomChoiceForm").submit();
					}
				}
			<% } %>
		});

	});


	function changeFor(tagValue) {

		if( $("#input-file1")[0].files.length == 0 ) {

			$(tagValue).attr("for", "input-file1");

		} else if( $("#input-file2")[0].files.length == 0 ) {

			$(tagValue).attr("for", "input-file2");

		} else if( $("#input-file3")[0].files.length == 0 ) {

			$(tagValue).attr("for", "input-file3");
		}
	}
	
	function loadImg(inputFile, num) {
				
		// inputFile : 현재 변화가 생긴 <input type="file"> 요소 객체
		// num : 몇번째 input 요소인지 확인 후 그 해당 영역에 미리보기 하기 위한 변수

		//console.log(inputFile.files.length);
		// inputFile.files.length : 파일 선택 시 1, 파일 선택 취소 시 0이 찍힘
		// => 파일의 존재 유무를 알 수 있다.

		// files 속성 : 업로드된 파일의 정보들을 배열 형식으로 여러 개 묶어서 반환
		//              length 는 배열의 크기를 의미

		if(inputFile.files.length == 1) { // 파일이 있는 경우


			// 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기

			// 파일을 읽어들일 FileReader 객체 생성
			var reader = new FileReader();

			// FileReader 객체로부터 파일을 읽어들이는 메소드를 호출
			// 어느 파일을 읽어들일건지 매개변수로 제시해야 함!!
			// 0번 인덱스에 담긴 파일 정보를 제시
			reader.readAsDataURL(inputFile.files[0]);
			// => 해당 파일을 읽어들이는 순간
			//    해당 그 파일만의 고유한 url 이 부여됨
			// => 해당 url 을 src 속성으로 부여할 것! (attr)

			// 파일 읽기가 완료되었을 때 실행할 함수를 정의
			reader.onload = function(e) {
				// e 의 target => e.target => 이벤트 당한 객체 (this)

				// e 의 target.result 에 각 파일의 url 이 담긴다.
				// e.target.result == this.target

				// 각 영역에 맞춰서 이미지 미리보기
				switch(num) {
					case 1 : 
						$("#photo-frame1").attr("src", e.target.result);
						break;

					case 2 : 
						$("#photo-frame2").attr("src", e.target.result);
						break;

					case 3 : 
						$("#photo-frame3").attr("src", e.target.result);
						break;		

				}

			}


		} else { // 파일이 없는 경우
			// 미리보기 사라지게 하기
			// src=null 을 담아서 사라지게 할 것

			switch(num) {
				case 1 : 
					$("#photo-frame1").attr("src", "/html/resources/img/srcWhite.jpg");
					break;

				case 2 : 
					$("#photo-frame2").attr("src", "/html/resources/img/srcWhite.jpg");
					break;

				case 3 : 
					$("#photo-frame3").attr("src", "/html/resources/img/srcWhite.jpg");
					break;
			}

		}
	};

	function removeImg(img, num) {
		$("#photo-frame" + num).attr("src", "/html/resources/img/srcWhite.jpg");
		$("#input-file" + num).val("");
	}
	
	/* 체크인 날짜 선택시 오늘날짜 보다 전 날짜는 선택 안되게 */
	function checkIn() {
		var dt = new Date();
		var date = document.getElementsByClassName('checkin_date')[0].value;
		var str = dt.getFullYear() + '/' +(dt.getMonth()+1)+'/'+dt.getDate();
		var today = (Number)(str.substring(8,10));
		
		if(1<=today && today<=9) {
		  str = dt.getFullYear() + '/' +(dt.getMonth()+1)+'/0'+dt.getDate();
		}
		else {
		  str = dt.getFullYear() + '/' +(dt.getMonth()+1)+'/'+dt.getDate();
		}
		var month = (Number)(str.substring(5,7));
		var day = (Number)(str.substring(8,10));	
		var monthDate = (Number)(date.substring(5,7));
		var dayDate = (Number)(date.substring(8,10));
		
		if(month > monthDate) { // 선택한 달보다 오늘 날짜 달이 더 클때
		  alert('오늘 날짜 이전은 선택할 수 없습니다');
		  document.getElementsByClassName('checkin_date')[0].value = str;
		}
		else if (month == monthDate) { // 달이 같을때
		    if(day > dayDate) { // 달이 같은때 선택한일이 오늘 일보다 적을때
		      alert('오늘 날짜 이전은 선택할 수 없습니다');
		      document.getElementsByClassName('checkin_date')[0].value = str;
		    }
		    else {
		      document.getElementsByClassName('checkin_date')[0].value = date;
		    }
		}
		else {
		    document.getElementsByClassName('checkin_date')[0].value = date;
		}
		/*
		alert('month : ' +month);
		alert('day : ' + day);
		alert('monthCheck : '+monthCheck);
		alert('dayCheck : '+dayCheck);
		*/
	}
    
    
	/* 체크아웃 날짜 선택시 체크인 날짜보다 전에 날짜 선택안되게 (선택시 체크인 날짜보다 +1) */
	function checkOut() { // 체크인보다 이전 날짜 선택시 체크인 날짜보다 +1
		var dt = new Date();
		var dateIn = document.getElementsByClassName('checkin_date')[0].value;  // 체크인 날짜
		var dateOut = document.getElementsByClassName('checkout_date')[0].value; // 체크아웃 날짜 (이거가지고 체크인 이전이면 체크인 +1이 되게)
		var yearIn = (Number)(dateIn.substring(0,4));
		var monthIn = (Number)(dateIn.substring(5,7));
		var dayIn = (Number)(dateIn.substring(8,10));
		var yearOut = (Number)(dateOut.substring(0,4));
		var monthOut = (Number)(dateOut.substring(5,7));
		var dayOut = (Number)(dateOut.substring(8,10));
		
		if(dateIn==null) {
		  alert('체크인 날짜를 입력하세요.')
		}
		
		else {
		var str = yearIn + '/' + monthIn + '/' + (dayIn+1); // 체크인 날짜 보다 하루 뒤에 날짜 yyyy/mm/dd로
		var lastDate = new Date(yearIn, monthIn, 0);
		var yearLast = (Number)(lastDate.getFullYear());
		var monthLast = (Number)(lastDate.getMonth());
		var dayLast = (Number)(lastDate.getDate());
		var str2 = ""; // 해당 달의 마지막 날짜를 yyyy/mm/dd로 구한것
		
		if(1<=dayLast && dayLast<=9) {
		  str2 = yearLast + '/' +(monthLast+1)+'/0'+dayLast;
		}
		else {
		  str2 = yearLast + '/' +(monthLast+1)+'/'+dayLast;
		}
		
		if(dateIn == str2) {
		  if(monthIn==12) {
		    str = (yearIn+1) + '/01/01';
		  }
		  else {
		    str = yearIn + '/' + (monthIn+1) + '/01';
		  }
		}
		
		if(monthIn > monthOut) { // 체크인달이 체크아웃달보다 클때 --> 문제있
		  alert('체크인 날짜 이전은 선택할 수 없습니다');
		  document.getElementsByClassName('checkout_date')[0].value = str;
		}
		else if (monthIn == monthOut) { // 달이 같을때
		  if(dayIn >= dayOut) { // 달이 같으면서 체크인날이 체크아웃날보다 클때
		    alert('체크인 날짜 이전은 선택할 수 없습니다');
		    document.getElementsByClassName('checkout_date')[0].value = str;
		  }
		  else {
		    document.getElementsByClassName('checkout_date')[0].value = dateOut;
		  }
		}
		else {
		  document.getElementsByClassName('checkout_date')[0].value = dateOut;
		}
		}
	}
	
	
  </script>
  <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=jkmmt3spx7"></script>
  <script type="text/javascript">

	$(function() {
		
		initMap();
		
	});
	
	function initMap() { 
		var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
		areaArr.push(
				<% if(m != null) { %>
					{ descript: "<%= m.getDescription() %>" , place:"<%= m.getHotelName() %>", lat: <%= m.getMapY() %>, lng: <%= m.getMapX() %> },
				<% } %>
		);

		var markers = new Array(); // 마커 정보를 담는 배열
		var infoWindows = new Array(); // 정보창을 담는 배열


		var map = new naver.maps.Map('naverMap', {
		center: new naver.maps.LatLng(<%= m.getMapY() %>, <%= m.getMapX() %>),
		zoom: 15
		});

		for (var i = 0; i < areaArr.length; i++) {
				var marker = new naver.maps.Marker({
					map: map,
					title: areaArr[i].location, // 지역구 이름 
					position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
				});
				var infoWindow = new naver.maps.InfoWindow({
					content: '<div style="width:200px;text-align:center;padding:10px;"><b>' + areaArr[i].place + '</b><br>'+areaArr[i].descript+'</div>'
				}); // 클릭했을 때 띄워줄 정보 HTML 작성
			   
				markers.push(marker); // 생성한 마커를 배열에 담는다.
				infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
			}
			function getClickHandler(seq) {
	
				return function(e) {  // 마커를 클릭하는 부분
					var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
						infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다
	
					if (infoWindow.getMap()) {
						infoWindow.close();
					} else {
						infoWindow.open(map, marker); // 표출
					}
				}
			}
		
			for (var i=0, ii=markers.length; i<ii; i++) {
				console.log(markers[i] , getClickHandler(i));
				naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
			}
	}
</script>
  <!--
  <script> //mn7cwsrvym
	// 지도 api
	// naverMap 값은 div 의 id
	new naver.maps.Map('naverMap', {
	
		// 지도 중앙 위치 : 위도, 경도 설정
		center : new naver.maps.LatLng( 37.5782709, 126.9770043 ),
	
		// 줌 설정 : 1~14, 수치가 클수록 지도 확대(줌인), 이 옵션 생략시 기본값 9
		zoom : 10,
	
		// 줌 컨트롤 표시, 지정하지 않으면 false 가 기본값
		zoomControl : true,
	
		// 줌 컨트롤 오른쪽 위로 위치 설정
		zoomControlOptions : {
			position : naver.maps.Position.TOP_RIGHT // 오른쪽 위로 설정
		},
	
		// 일반ㆍ위성 지도보기 컨트롤 표시, 지정하지 않으면 false 가 기본값
		mapTypeControl : true,
	
	});
	</script>
	 -->
  </body>
</html>