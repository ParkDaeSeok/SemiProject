<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.hotel.model.vo.Hotel, com.kh.common.model.vo.PageInfo" %>

<% 
     ArrayList<Hotel> list = (ArrayList<Hotel>)request.getAttribute("list");
     PageInfo pi = (PageInfo)request.getAttribute("pi");
     String state = (String)request.getAttribute("state");
     String city = (String)request.getAttribute("city");
     String hotelName = (String)request.getAttribute("hotelName");
     int minPay = (int)request.getAttribute("minPay");
     int maxPay = (int)request.getAttribute("maxPay");
     int star = (int)request.getAttribute("star");
	 String sort = (String)request.getAttribute("sort");
     String checkIn = (String)session.getAttribute("checkIn");
     String checkOut = (String)session.getAttribute("checkOut");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>검색결과 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식-->

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

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
    <link rel="stylesheet" href="/html/views/common/css/style_pds.css">
	<link rel="stylesheet" href="/html/views/common/css/mystyle.css">
	<style>
		
		.cancel-button1:hover, .cancel-button2:hover, .cancel-button3:hover {
			background-color: #CEE3F6;
			cursor: pointer;
		}
		.cancel-button1 {
			border: 0px !important;
			border-radius : 15px !important; 
			width : 90px; 
			height: 30px; 
			background :rgb(248, 250, 255);
		}

		.cancel-button2 {
			border: 0px !important;
			border-radius : 15px !important; 
			width : 90px; 
			height: 30px; 
			background :rgb(248, 250, 255);
		}
		.cancel-button3 {
			border: 0px !important;
			border-radius : 15px !important; 
			width : 90px; 
			height: 30px; 
			background :rgb(248, 250, 255);
		}
		.Abutton:hover {
			background-color: #f85959;
			color : white;
		}

		#enrollHotel {
			border : 1px solid #A4A4A4;
			margin-right : 180px;
		}
		#enrollHotel:hover {
			cursor: pointer;
			background-color: #A4A4A4;
			color : white;
		}
		
	</style>
  </head>
  <body>
    <!-- END nav -->
	 

	  <%@ include file="../common/topbar.jsp" %>
	  
	  <div class="overlay" style="height : 120px;" id="overlay">
		
	  </div>


      <div class="container" id="container">
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
					<input type="text" name="checkin" id="checkin_date" class="form-control" placeholder="체크인" style="border-radius: 10px;" onchange="checkIn();" value="<%= checkIn %>">
				</div>
				<div class="form-group" style="width:18%;">
					<input type="text" name="checkout" id="checkout_date" class="form-control" placeholder="체크아웃" style="border-radius:10px;" onchange="checkOut();" value="<%= checkOut %>">
				</div>
				<div class="form-group">
					<input type="submit" value="Search" class="btn btn-primary py-3 px-5" style="background : #59D6F8" id="search-2" onclick="searchBar();">
				</div>
			</form>
      </div>
	  
	  <script>
		/* 체크인 날짜 선택시 오늘날짜 보다 전 날짜는 선택 안되게 */
		function checkIn() {
			var dt = new Date();
			var date = document.getElementById('checkin_date').value;

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
				document.getElementById('checkin_date').value = str;
			}
			else if (month == monthDate) { // 달이 같을때
				  if(day > dayDate) { // 달이 같은때 선택한일이 오늘 일보다 적을때
					  alert('오늘 날짜 이전은 선택할 수 없습니다');
					  document.getElementById('checkin_date').value = str;
				  }
				  else {
					  document.getElementById('checkin_date').value = date;
				  }
			}
			else {
				  document.getElementById('checkin_date').value = date;
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
		  var dateIn = document.getElementById('checkin_date').value;  // 체크인 날짜
		  var dateOut = document.getElementById('checkout_date').value; // 체크아웃 날짜 (이거가지고 체크인 이전이면 체크인 +1이 되게)

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
				document.getElementById('checkout_date').value = str;
			}
			else if (monthIn == monthOut) { // 달이 같을때
				if(dayIn >= dayOut) { // 달이 같으면서 체크인날이 체크아웃날보다 클때
					alert('체크인 날짜 이전은 선택할 수 없습니다');
					document.getElementById('checkout_date').value = str;
				}
				else {
					document.getElementById('checkout_date').value = dateOut;
				}
			}
			else {
				document.getElementById('checkout_date').value = dateOut;
			}

		  }

		  
		  
		}
	</script>

	  <script>
		/* 검색바로 새로 검색 시 */
	  	function searchBar() {
			var city = document.getElementById('city1').value;
			var state = document.getElementById('state1').value;
			
			var star = 0;
            var minPay = 0;
            var maxPay = 500000;
            var hotelName = '';
			var sort = 'all';

			var checkIn = document.getElementById('checkin_date').value;
			var checkOut = document.getElementById('checkout_date').value;
								
			if(checkIn=='' || checkOut=='' ) {
				alert('체크인/체크아웃 날짜가 있어야 합니다');
				if(checkIn=='') {
					document.getElementById('checkin_date').focus();										
				}
				else {
					document.getElementById('checkout_date').focus();										
				}
			}
			else {
				location.href = "<%= request.getContextPath() %>/slist.ht?currentPage=1&city="+city+"&state="+state+"&hotelName="+hotelName+"&minPay="+minPay+"&maxPay="+maxPay+"&star="+star+"&sort-by="+sort+"&checkIn="+checkIn+"&checkOut="+checkOut;
			}
		}
	  	
	  </script>
	  

    <section class="ftco-section ftco-degree-bg" id="container1">
      <div class="container" id="filter">
		<div id="into-map">
			<a href="#" onclick="intoMap();">
				<img src="/html/resources/img/2d-map.png" alt="지도그림"><div>지도로 이동</div>
			</a>
		</div>

		<script>
			/* 지도로 이동 시*/
			function intoMap() {

				var city = document.getElementById('city1').value;
				var state = document.getElementById('state1').value;

				var starRate = document.getElementsByName('starRate');
				var star = 0;
				
				for(i=0; i<starRate.length; i++) {
					if(starRate[i].checked) {
						star = starRate[i].value;
					}
				}
				
				var minPay = document.getElementById('minPay').value;
				var maxPay = document.getElementById('maxPay').value;

				var hotelName = document.getElementById('search-hotel').value;


				location.href = "<%= request.getContextPath() %>/intoMap.ht?city="+city+"&state="+state+"&hotelName="+hotelName+"&minPay="+minPay+"&maxPay="+maxPay+"&star="+star;
			}
		</script>
		
		<form action="" onsubmit="return false;" method="get">
		<div id="hotel-search">
			<!--
			<form action="<%= request.getContextPath() %>/searchName.ht" method="get">
			-->
			<div align="center">
				<div style="font-weight: bold; background :rgb(248, 250, 255)">호텔명 검색</div>
				<div style="background-color: rgb(248, 250, 255);">
					<i class="icon-search" ></i>
					<span><input type="text" name="hotelName" id="search-hotel" style="width : 60%;"></span>
					<span><input type="submit" style="background-color: lightgray;" value="검색" onclick="filter();"></span>
				</div>
			</div>
			<!--
			</form>
			-->
		</div>
        <div class="row" id="range">
			<div class="sidebar-wrap bg-light ftco-animate" style="padding : 10px; width:100%; height:215px;">
				<!--
				<form action="<%= request.getContextPath() %>/searchPay.ht" method="get">
				-->
					<div class="pay-range">요금 범위</div>
					<div class="form-group">
						<div class="range-slider" style="text-align: center;">
							<span>
								<input type="text" id="minPay" class="payment" value="0" oninput="range11(this);" onchange="payCheck();">	
								<span>-</span>
								<input type="text" id="maxPay" class="payment" value="500000" oninput="range22(this);" onchange="payCheck();">
							</span>
							<input value="0" name="minPay" min="0" max="500000" step="10000" type="range" id="minRange" oninput="range1(this);" onchange="payCheck();"/>
							<input value="500000" name="maxPay" min="30000" max="500000" step="10000" type="range" id="maxRange" oninput="range2(this);" onchange="payCheck();"/>
							</svg>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" value="Search" class="btn btn-primary py-3 px-5" style="background : #59D6F8" onclick="filter();">
					</div>	
				<!--
				</form>
				-->
			</div>

			<script>
				/* 요금범위에서 min요금이 max요금보다 클때 안되도록 */
				function payCheck() {
					var minPay = document.getElementById('minPay').value;
					var maxPay = document.getElementById('maxPay').value;

					var minRange = document.getElementById('minRange').value;
					var maxRange = document.getElementById('maxRange').value;

					if(minPay>maxPay && minRange>maxRange) {
						alert('요금범위가 맞지 않습니다');
						console.log("minPay : " +minPay);
						console.log("maxPay : "+maxPay);
						console.log("minRange : "+minRange);
						console.log("maxRange : "+maxRange);
						document.getElementById('minPay').value = 0;
						document.getElementById('maxPay').value = 500000;
						document.getElementById('minRange').value = 0;
						document.getElementById('maxRange').value = 500000;
					}
				}
			</script>

		</div>
    	<div class="sidebar-wrap bg-light ftco-animate">
        	<h3 class="heading mb-4">별점</h3>
			<!--
    		<form action="<%= request.getContextPath() %>/searchStar.ht" method="post" class="star-rating">
			-->
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="star5" name="starRate"  value="5" onclick='checkOnlyOne(this);'>
					<label class="form-check-label" for="star5">
						<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
					</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="star4" name="starRate"  value="4" onclick='checkOnlyOne(this);'>
					<label class="form-check-label" for="star4">
						<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
					</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="star3" name="starRate" value="3" onclick='checkOnlyOne(this);'>
					<label class="form-check-label" for="star3">
						<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
					</label>
				</div>
					<div class="form-check">
					<input type="checkbox" class="form-check-input" id="star2" name="starRate" value="2" onclick='checkOnlyOne(this);'>
					<input type="hidden" name="rank" value="2">
					<label class="form-check-label" for="star2">
						<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
					</label>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="star1" name="starRate" value="1" onclick='checkOnlyOne(this);'>
					<input type="hidden" name="rank" value="1">
					<label class="form-check-label" for="star1">
						<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
					</label>
				</div>
				<div>
					<input type="submit" value="Search" class="btn btn-primary py-3 px-5" style="background : #59D6F8; border-radius : 0; width : 100%;" onclick="filter();">
				</div>
			<!--
			</form>
			-->
    		</div>
		</form>
		
		<script>
			/* 필터를 체크해서 보낼때*/
			function filter() {
				var city = document.getElementById('city1').value;
				var state = document.getElementById('state1').value;

				var starRate = document.getElementsByName('starRate');
				var star = 0;
				var sort = 'all';

				for(i=0; i<starRate.length; i++) {
					if(starRate[i].checked) {
						star = starRate[i].value;
					}
				}
				
				var minPay = document.getElementById('minPay').value;
				var maxPay = document.getElementById('maxPay').value;

				var hotelName = document.getElementById('search-hotel').value;
				
				var checkIn = document.getElementById('checkin_date').value;
				var checkOut = document.getElementById('checkout_date').value;
									
				if(checkIn=='' || checkOut=='' ) {
					alert('체크인/체크아웃 날짜가 있어야 합니다');
					if(checkIn=='') {
						document.getElementById('checkin_date').focus();										
					}
					else {
						document.getElementById('checkout_date').focus();										
					}
				}
				else {
					location.href = "<%= request.getContextPath() %>/searchFilter.ht?currentPage=1&city="+city+"&state="+state+"&hotelName="+hotelName+"&minPay="+minPay+"&maxPay="+maxPay+"&star="+star+"&sort-by="+sort+"&checkIn="+checkIn+"&checkOut="+checkOut;
				}

				//location.href = "<%= request.getContextPath() %>/searchFilter.ht?currentPage=1&city="+city+"&state="+state+"&hotelName="+hotelName+"&minPay="+minPay+"&maxPay="+maxPay+"&star="+star+"&sort-by="+sort;

				
			}
		</script>
		

		<!--
		<script>
			function filter() {
				var starRate = document.getElementsByName('starRate');
				var star;
				
				for(i=0; i<starRate.length; i++) {
					if(starRate[i].checked) {
						star = starRate[i].value;
					}
				}

				$.ajax({
					url : "searchFilter.ht",
					data : {
							currentPage : 1,
							city : document.getElementById('city1').value ,
				            state : document.getElementById('state1').value,
							star : star,
							minPay : document.getElementById('minPay').value,
							maxPay : document.getElementById('maxPay').value,
							hotelName : document.getElementById('search-hotel').value 
							},
					type : "get",
					success : function(list) {
						
					},
					error : function() {
						alert(2);
					}

				})
			}
		</script>
		-->
    </div>
          <div class="col-lg-9" id="hotel-list">
          	<div class="row" id="hotels" >
				<div style="margin-bottom: 0px; margin-left: 15px;" class="button">
					<% if(!(hotelName.equals(""))) { %>
					<button type="button" class="cancel-button1" onclick="cancelHotelName();">호텔명 &nbsp; ✖</button>
					<% } %>
					<% if(!(minPay==0 && maxPay==500000)) { %>
					<button type="button" class="cancel-button2" onclick="cancelPayRange();">요금범위 &nbsp;✖</button>
					<% } %>
					<% if(star!=0) { %>
					<button type="button" class="cancel-button3" onclick="cancelStar();">별점 &nbsp; ✖</button>
					<% } %>
					
					<div style="float : right; margin-right: 13.8%;">
						<span style="text-align: center;">
							<b style="font-weight: 400;">정렬 기준</b>
						</span>
						<select name="sort-by" id="sort" style="text-align: center;" onchange="array();">
							<option value="all">전체</option>
							<option value="highPay">높은 가격순</option>
							<option value="lowPay">낮은 가격순</option>
							<option value="starReivew">별점순</option>
						</select>
					</div>
				</div>

				<script>
					/* 정렬기준 이동 시 */
					function array() {

						var sort = document.getElementById('sort').value;
						
						location.href = "<%= request.getContextPath() %>/hSort.ht?currentPage=1&city=<%= city%>&state=<%= state%>&hotelName=<%= hotelName%>&minPay=<%= minPay%>&maxPay=<%= maxPay %>&star=<%= star %>&sort-by="+sort+"&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>";
					}

					
				</script>

            <% if(list.isEmpty()) { %>
                <div align="center" style="font-size: 25px; font-weight : 400;">검색 결과가 없습니다.</div>
            <% } else { %>
				
					<% for(Hotel h : list) { %>
					<div class="col-md-4 ftco-animate" >
					<div class="destination">
						<a href="#" onclick="hotelDetail(<%= h.getHotelNo() %>);" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(/html/resources/img/hotel-<%= h.getHotelNo() %>.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<div class="d-flex">
								<div class="one">
									<h3><a href="#" onclick="hotelDetail(<%= h.getHotelNo() %>);" id="hotelName<%= h.getHotelNo() %>"><%= h.getHotelName() %></a></h3>
									<p class="rate">
										<% for(int i=1; i<=h.getHotelStar(); i++) { %>
										<i class="icon-star"></i>
										<% } %>
										
										<% for(int i=1; i<=(5-h.getHotelStar()); i++) { %>
										<i class="icon-star-o"></i>
										<% } %>
										<span><%= h.getHotelStar() %></span>
									</p>
								</div>
								<div class="two">
									<span class="price per-price"><small>￦<%= h.getHotelPrice() %></small><br><small>/1박 기준</small></span>
								</div>
							</div>
							<p><%= h.getDescription() %></p>
							<hr>
							<p class="bottom-area d-flex">
								<span><i class="icon-map-o"></i> <%= h.getLocalName() %></span> 
								<span class="ml-auto"><a href="#" onclick="hotelDetail(<%= h.getHotelNo() %>);" style="background-color: #59D6F8;">예약하기</a></span>
							</p>
						</div>

						<script>
							/* 호텔상세페이지로 갈때 */
							function hotelDetail(number) {
								/* hoName에서 hoName은 호텔이름을 받는데 id를 hotelName + i로 줬기 때문에 */
								/* 호텔이름 가지고 올때 함수에서 매개변수로 보낸 number로 각자 다른 호텔 이름이 가도록 했다 */
								var hoName = document.getElementById('hotelName'+number).innerText;
								var checkIn = document.getElementById('checkin_date').value;
								var checkOut = document.getElementById('checkout_date').value;
								if(checkIn=='' || checkOut=='' ) {
									alert('체크인/체크아웃 날짜가 있어야 합니다');
									if(checkIn=='') {
										document.getElementById('checkin_date').focus();										
									}
									else {
										document.getElementById('checkout_date').focus();										
									}
								}
								else {
									location.href = "<%= request.getContextPath() %>/detailHotel.ht?currentPage=1&hoName="+hoName+"&checkIn="+checkIn+"&checkOut="+checkOut;
								}
								
							}
						</script>
					</div>
				</div>
				<% } %>
				<% } %>
					</div>
				</div>
          		
          		<script>
					/*각 필터별 취소시 */
					function cancelHotelName() {
						/*document.getElementById('search-hotel').value = '없음';*/

						var hotelName = '';
						var state = '<%= state %>';
						var city = '<%= city %>';
						var minPay = <%= minPay %>;
						var maxPay = <%= maxPay %>;
						var star = <%= star %>;
						var sort = 'all';

						location.href = "<%= request.getContextPath() %>/searchFilter.ht?currentPage=1&city="+city+"&state="+state+"&hotelName="+hotelName+"&minPay="+minPay+"&maxPay="+maxPay+"&star="+star+"&sort-by="+sort+"&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>";
					}
					
					function cancelPayRange() {

						var hotelName = '<%= hotelName %>';
						var state = '<%= state %>';
						var city = '<%= city %>';
						var minPay = 0;
						var maxPay = 500000;
						var star = <%= star %>;
						var sort = 'all';

						location.href = "<%= request.getContextPath() %>/searchFilter.ht?currentPage=1&city="+city+"&state="+state+"&hotelName="+hotelName+"&minPay="+minPay+"&maxPay="+maxPay+"&star="+star+"&sort-by="+sort+"&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>";
					}

					function cancelStar() {

						var hotelName = '<%= hotelName %>';
						var state = '<%= state %>';
						var city = '<%= city %>';
						var minPay = <%= minPay %>;
						var maxPay = <%= maxPay %>;
						var star = 0;
						var sort = 'all';

						location.href = "<%= request.getContextPath() %>/searchFilter.ht?currentPage=1&city="+city+"&state="+state+"&hotelName="+hotelName+"&minPay="+minPay+"&maxPay="+maxPay+"&star="+star+"&sort-by="+sort+"&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>";
					}
				</script>

          		<% if(list.size()==1)  { %>
          		<div class="row mt-5" style="margin-left: 55%;">
          		<% }  else { %>
          		<div class="row mt-5" style="margin-left: 52%;">
          		<% } %>
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
					
		              <% if(pi.getCurrentPage() != 1) { %>
		              	<% if(sort.equals("highPay")||sort.equals("lowPay")||sort.equals("starReview")) { %>
		              		<li><a href="<%= request.getContextPath() %>/hSort.ht?currentPage=<%= pi.getCurrentPage()-1 %>&city=<%= city%>&state=<%= state%>
							&hotelName=<%= hotelName%>&minPay=<%= minPay%>&maxPay=<%= maxPay %>&star=<%= star %>&sort-by=<%= sort %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>" >&lt;</a></li>
		              	<% } else { %>
		                	<li><a href="<%= request.getContextPath() %>/slist.ht?currentPage=<%= pi.getCurrentPage()-1 %>&city=<%= city%>&state=<%= state%>
							&hotelName=<%= hotelName%>&minPay=<%= minPay%>&maxPay=<%= maxPay %>&star=<%= star %>&sort-by=<%= sort %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>" >&lt;</a></li>
							<% } %>
		              <% }  %>
		                
						<!--<li><a href="#">&lt;</a></li>-->
		                
		                
		                <% for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++) { %>
		                    <% if(i != pi.getCurrentPage())  { %>
		                    	<% if(sort.equals("highPay")||sort.equals("lowPay")||sort.equals("starReview")) { %>
		                    		<li><a href="<%= request.getContextPath() %>/hSort.ht?currentPage=<%= i %>&city=<%= city%>&state=<%= state%>
									&hotelName=<%= hotelName%>&minPay=<%= minPay%>&maxPay=<%= maxPay %>&star=<%= star %>&sort-by=<%= sort %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>" class="Abutton"><%= i %></a></li>
		                    	<% } else { %>
		                        	<li><a href="<%= request.getContextPath() %>/slist.ht?currentPage=<%= i %>&city=<%= city%>&state=<%= state%>
									&hotelName=<%= hotelName%>&minPay=<%= minPay%>&maxPay=<%= maxPay %>&star=<%= star %>&sort-by=<%= sort %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>" class="Abutton"><%= i %></a></li>
								<%} %>
		                    <% } else { %>
		                         <li><a href="#"><%= i %></a></li>
		                    <% } %>
		                <% } %>
		                
		                <% if(pi.getCurrentPage() != pi.getMaxPage()) { %>
			              	<% if(sort.equals("highPay")||sort.equals("lowPay")||sort.equals("starReview")) { %>
			              	<li><a href="<%= request.getContextPath() %>/hSort.ht?currentPage=<%= pi.getCurrentPage()+1 %>&city=<%= city%>&state=<%= state%>
							&hotelName=<%= hotelName%>&minPay=<%= minPay%>&maxPay=<%= maxPay %>&star=<%= star %>&sort-by=<%= sort %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>" >&gt;</a></li>
		                	<% } else { %>
		                	<li><a href="<%= request.getContextPath() %>/slist.ht?currentPage=<%= pi.getCurrentPage()+1 %>&city=<%= city%>&state=<%= state%>
							&hotelName=<%= hotelName%>&minPay=<%= minPay%>&maxPay=<%= maxPay %>&star=<%= star %>&sort-by=<%= sort %>&checkIn=<%= checkIn %>&checkOut=<%= checkOut %>">&gt;</a></li>
							<% } %>
		                <% } %>
		              </ul>
		            </div>
		          </div>
		        </div>

          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

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
	           Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>			</div>
		  </div>
		</div>
	  </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  


  <script>
	

	function checkOnlyOne(chk){
		var obj = document.getElementsByName("starRate");
		for(var i=0; i<obj.length; i++){
			if(obj[i] != chk){
				obj[i].checked = false;
			}
		}
	}

	// 새로고침 시, 스크롤이 맨 위로 올라가게
	window.onload = function() {
	setTimeout(function() {
		scrollTo(0, 0);
	}, 100);
		
		document.getElementById('city1').value = '<%= city %>';
	    document.getElementById('state1').value = '<%= state %>';
	    document.getElementById('search-hotel').value = '<%= hotelName %>';

	    document.getElementById('minRange').value = '<%= minPay %>';
		document.getElementById('minPay').value = '<%= minPay %>';

	    document.getElementById('maxRange').value = '<%= maxPay %>';
		document.getElementById('maxPay').value = '<%= maxPay %>';
	    
		<% if(star!=0) { %>
	    document.getElementById('star<%= star%>').checked = true;
	    <% } %>
		
	    document.getElementById('sort').value = '<%= sort %>';
	}
	
	

	function range1(range) {
		document.getElementById('minPay').value = range.value;
	}

	function range11(range) {
		document.getElementById('minRange').value = range.value;
	}

	function range2(range) {
		document.getElementById('maxPay').value = range.value;
	}

	function range22(range) {
		document.getElementById('maxRange').value = range.value;
	}
	  

  </script>

  
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/html/views/common/js/google-map.js"></script>
  <script src="/html/views/common/js/main.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
    
  </body>
</html>