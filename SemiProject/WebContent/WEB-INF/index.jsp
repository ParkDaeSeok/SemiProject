<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>5조-html호텔 메인화면</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="views/common/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="views/common/css/animate.css">
    
    <link rel="stylesheet" href="views/common/css/owl.carousel.min.css">
    <link rel="stylesheet" href="views/common/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="views/common/css/magnific-popup.css">

    <link rel="stylesheet" href="views/common/css/aos.css">

    <link rel="stylesheet" href="views/common/css/ionicons.min.css">

    <link rel="stylesheet" href="views/common/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="views/common/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="views/common/css/flaticon.css">
    <link rel="stylesheet" href="views/common/css/icomoon.css">
    <link rel="stylesheet" href="views/common/css/style_nkp.css">

    <link rel="stylesheet" href="views/common/style_nkp.css" />

    <!-- 추가함 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- 추가함 -->
    <style>
    #navbar-logo {
      margin-left: 400px;
    }

    #navbar-logo>img {
      padding-top: 0px;
      padding-bottom: 18px;
      width: 110px; 
      height: 110px;
    }

    #navbar-logo>h1 {
      padding-top: 30px;
      padding-bottom: 0px;
      font-weight: bold;
      color: #59D6F8;
      display: inline-block;
    }
    </style>

    <script>
      $(window).scroll(function() {
        var float = $("#ftco-nav").height();	
        if($(this).scrollTop() > float) {
          $("#navbar-logo").css("visibility", "visible");
        } else {
          $("#navbar-logo").css("visibility", "hidden");
        }
      });
    </script>
    <!-- 추가함 // -->

  </head>
  <body>
      
  <%@ include file="views/common/topbar.jsp" %>

    <div class="sidebar">
      
      <h2><a href="index.html"><img src="resources/img/logo_main.png" alt="logo" class="logo" ></a></h2>
      <ul class="nav">
      <!--  마이페이지 부분 바꿈 마이페이지로 가도록 -->
        <li>
           <% if(loginMember == null) { %>
           <a href="#" onclick="location.href='<%= contextPath %>/loginForm.me'">
           <i class="fas fa-user"></i>
           <span>마이페이지</span>
       	   </a>
           <% } else if(loginMember != null){ %>
           <a href="#" onclick="location.href='<%= contextPath %>/myPageinto.me'">
           <i class="fas fa-user"></i>
           <span>마이페이지</span>
           <% } %>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-concierge-bell"></i>
            <span>고객센터</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-comment-dots"></i>
            <span>1대1상담</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-question-circle"></i>
            <span>FAQ</span>
          </a>
        </li>
        
      </ul>
    </div>
    
    <div class="hero-wrap js-fullheight" style="background-image: url('resources/img/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong><i class="fas fa-umbrella-beach"></i>  Explore <br></strong>당신만을 위한</h1>
            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><b>당신이 원하는 최고의 쉼터를 찾아보세요.</b></p>
            <div class="block-17 my-4">
              <form action="" class="d-block d-flex" onsubmit="return false;">
                <div class="fields d-block d-flex">
                  <div class="textfield-search one-third">
                  	<input type="text" name="city" class="form-control" placeholder="Ex: HTML 호텔, 쉐라톤 등.." id="city1">
                  </div>
                  <div class="textfield-search one-third">
                    <input type="text" class="form-control" id="checkin_date" placeholder="체크인" onchange="checkIn();">
                  </div>  
                  <div class="textfield-search one-third">
                    <input type="text" class="form-control" id="checkout_date" placeholder="체크아웃" onchange="checkOut();">
                  </div>
                  <div class="select-wrap one-third">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="state" class="form-control" placeholder="Keyword search" id="state1">
                      <option value="">지역</option>
                      <option value="서울">서울</option>
                      <option value="경기">경기</option>
                      <option value="강원">강원</option>
                      <option value="충청">충청</option>
                      <option value="경상">경상</option>
                      <option value="전라">전라</option>
                    </select>
                  </div>
                </div>
                <input type="submit" class="search-submit btn btn-primary" value="Search" id="search-1">

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <script>
     /* 호텔 검색 페이지로 갈때 필요함!!!!!!! */
      $(function() {
          $("#search-1").click(function() {
               var state = $("#state1").val();
               var city = $("#city1").val();
               
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
               
          });
      });
    </script>

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

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-guarantee"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">최저 가격 보장</h3>
                <p>타 사이트보다 낮은 가격으로 보답합니다.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-like"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">여행자들의 많은 관심</h3>
                <p>수 많은 여행자들이 저희 사이트를 사랑해주고 계십니다.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-detective"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">최고의 예약사이트</h3>
                <p>저희는 수년간 입지를 다져 최고의 사이트로 자리매김 했습니다.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-support"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">고객에 대한 헌신</h3>
                <p>저희는 고객에 대해 최선을 다해 서비스 할 것을 다짐합니다.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section ftco-destination">
    	<div class="container">
    		<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">대표적인</span>
            <h2 class="mb-4"><strong>추천</strong> 여행지</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="destination-slider owl-carousel ftco-animate">
    					<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/seoul.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">서울, 대한민국</a></h3>
		    						<span class="listing">15개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/kangwon.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">강원도, 대한민국</a></h3>
		    						<span class="listing">20개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/전라도.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">전라도, 대한민국</a></h3>
		    						<span class="listing">10개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/kyungsang.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">경상도, 대한민국</a></h3>
		    						<span class="listing">3개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/kyungki.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">경기도, 대한민국</a></h3>
		    						<span class="listing">3개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(resources/img/bg_1.jpg);">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4">몇 가지 재미있는 사실들</h2>
            <span class="subheading">전국 10000개 이상의 호텔이 호스팅됨</span>
          </div>
        </div>
    		<div class="row justify-content-center">
    			<div class="col-md-10">
		    		<div class="row">
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="10000">0</strong>
		                <span>만족한 여행자들</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="500">0</strong>
		                <span>여행지</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="13520">0</strong>
		                <span>호텔들</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="56400">0</strong>
		                <span>고객들의 후기</span>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>

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


  <script src="views/common/js/jquery.min.js"></script>
  <script src="views/common/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="views/common/js/popper.min.js"></script>
  <script src="views/common/js/bootstrap.min.js"></script>
  <script src="views/common/js/jquery.easing.1.3.js"></script>
  <script src="views/common/js/jquery.waypoints.min.js"></script>
  <script src="views/common/js/jquery.stellar.min.js"></script>
  <script src="views/common/js/owl.carousel.min.js"></script>
  <script src="views/common/js/jquery.magnific-popup.min.js"></script>
  <script src="views/common/js/aos.js"></script>
  <script src="views/common/js/jquery.animateNumber.min.js"></script>
  <script src="views/common/js/bootstrap-datepicker.js"></script>
  <script src="views/common/js/jquery.timepicker.min.js"></script>
  <script src="views/common/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="views/common/js/google-map.js"></script>
  <script src="views/common/js/main.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
    
  </body>
</html>