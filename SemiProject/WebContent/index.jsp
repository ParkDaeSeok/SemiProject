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
  
      input[id="menuicon"] { 
        display: none;
      }
      input[id="menuicon"] + label {
        display: block;
        width: 60px;
        height: 40px;
        position: fixed;
        left: 4px;
        top: 25px;
        cursor: pointer;
        z-index: 2;
      }
      
      input[id="menuicon"] + label span {
        display: block;
        position: absolute;
        width: 100%;
        height: 5px;
        border-radius: 30px;
        background: #000;
        transition: all .35s;
      }
      input[id="menuicon"] + label span:nth-child(1){
        top : 0;
      }
      input[id="menuicon"] + label span:nth-child(2){
        top: 50%;
        transform: translateY(-50%);
      }
      input[id="menuicon"] + label span:nth-child(3){
        bottom : 0;
      }
      
      input[id="menuicon"]:checked + label span:nth-child(1){
        top : 50%;
        transform: translateY(-50%) rotate(45deg);
      }
      input[id="menuicon"]:checked + label span:nth-child(2){
        opacity: 0;
      }
      input[id="menuicon"]:checked + label span:nth-child(3){
        bottom : 50%;
        transform: translateY(50%) rotate(-45deg);
      }
      
      
      input[id="menuicon"]:checked + label {
        z-index: 2;
        left: 193px;
      }
      
        li {
        list-style: none;
        }       
        a {
        font-family: "돋움";
        font-size: 12px;
        color: #000;
        text-decoration: none;
        }        
        #visual {
        position: relative;
        width: 1200px;
        height: 300px;
        margin: 0 auto;
        overflow: hidden;           
        box-shadow: 1px 5px 10px 2px #666;
        
        }      
        #visual>div {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        transition: 0.3s ease;
        opacity: 0;
        }
        #visual>div.on{
        opacity: 1;
        }
        #control { 
        position: absolute;
        width: 100%;
        bottom: 30px;
        text-align: center;         
        }
        #control a {
        display: inline-block;
        width: 20px;
        height: 20px;
        background: #f6f5f5;                       
        line-height: 26px;
        font-size: 0.8em;
        border-radius: 14px;
        margin: 0 2px
        }
        
        #control a.on {
        background: #9ab3f5;
        }
        div#left>span:first-child{
        position: absolute;
        display: inline-block;
        width: 50px;
        height: 8px;
        background-color: black;
        border-radius: 10px;
        transform: translateY(63px) rotate(50deg);  
        }
        
        div#left>span:last-child{
        position: absolute;
        width: 50px;
        height: 8px;
        background-color: black;
        border-radius: 10px;
        transform: translateY(30px) rotate(-50deg);  
        }
        
        div#left:hover span{
        background-color: #fff;
        transition: 0.2s ease;
        }
        
        
        div#left{
        position: absolute;
        width: 50px;
        height: 100px;
        top: 50%;
        left: 2.5%;
        transform: translate(0%, -50%);
        cursor: pointer;
        opacity: 0;
        transition: .4s ease;
        }
        
        div#right{
        position: absolute;
        width: 50px;
        height: 100px;
        top: 50%;
        left: 90%;
        transform: translate(0%, -50%);
        cursor: pointer;
        opacity: 0;
        transition: .4s ease;
        }
        
        div#right>span:first-child{
        position: absolute;
        display: inline-block;
        width: 50px;
        height: 8px;
        background-color: black;
        border-radius: 10px;
        transform: translateY(63px) rotate(-50deg);  
        }
        
        div#right>span:last-child{
        position: absolute;
        width: 50px;
        height: 8px;
        background-color: black;
        border-radius: 10px;
        transform: translateY(30px) rotate(50deg);  
        }
        
        div#right:hover span{
        background-color: #fff;
        transition: 0.2s ease;
        }
      
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
      
          .sub {
            width: 72px;
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

  <div class="sub sidebar" style="z-index: 3;"> <%-- style 추가 --%>
    <input type="checkbox" id="menuicon" onclick="folder();">
    <label for="menuicon">
      <span></span>
      <span></span>
      <span></span>
    </label>


    <br><br><br><br>


    <h2><i class="fas fa-hotel"></i></h2>
    <ul class="nav">
        <% if(loginMember == null) { %>
        <li>
           <a href="#" onclick="location.href='<%= contextPath %>/loginForm.me'">
           <i class="fas fa-user"></i>
       	   </a>
        </li>
        <% } else if(loginMember != null){ %>
        <li>
          <a href="#" onclick="location.href='<%= contextPath %>/updateMyInfoForm.me'">
          <i class="fas fa-user"></i>
       	  </a>
        </li>
        <% } %>
      <% if(loginMember != null) { %>
      	<li>
            <a href="#" onclick="winopen(), winopen2();">
	            <i class="fas fa-comment-dots"></i>
          	</a>
         </li>
      <% } else { %>
          <li>
             <a href="#" onclick="location.href='<%= contextPath %>/loginForm.me'">
          		<i class="fas fa-comment-dots"></i>
           	 </a>
          </li>
 		<% } %>
   	 	<li>
	       	<a href="views/notice/FAQ.jsp">
	         	<i class="fas fa-question-circle"></i>
	       	</a>
   	    </li>
  	 </ul>
  </div>


  <div class="sidebar" style="display: none; z-index: 4;" id="bar">
      
      <h2><a href="#" onclick="location.href ='<%= contextPath %>'"><img src="resources/img/logo_main.png" alt="logo" class="logo" ></a></h2>
      <ul class="nav">
      <!--  마이페이지 부분 바꿈 마이페이지로 가도록 -->
        <% if(loginMember == null) { %>
        <li>
           <a href="#" onclick="location.href='<%= contextPath %>/loginForm.me'">
           <i class="fas fa-user"></i>
             <span>마이페이지</span>
       	   </a>
        </li>
        <% } else if(loginMember != null){ %>
        <li>
           <a href="#" onclick="location.href='<%= contextPath %>/updateMyInfoForm.me'">
           <i class="fas fa-user"></i>
   		  	 <span>마이페이지</span>
           </a>
        </li>
        <% } %>
        <% if(loginMember != null) { %>
         <li>  
            <a href="#" onclick="winopen(), winopen2();">
	            <i class="fas fa-comment-dots"></i>
	      	    <span>1대1상담</span>
          	</a>
        </li>
           <% } else { %>
         <li>
            <a href="<%= request.getContextPath() %>/loginForm.me">
            	<i class="fas fa-comment-dots"></i>
	        	<span>1대1상담</span>
            </a>
        </li>
           <% } %>
        <li>
          <a href="views/notice/FAQ.jsp">
            <i class="fas fa-question-circle"></i>
            <span>FAQ</span>
          </a>
        </li>
      </ul>
    </div>

    <script>
      function winopen() {
        window.open('views/notice/socket.jsp', 'newWindow1', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbar=yes, resizable=no, copyhistory=yes, width=635, height=300');
      }

      function winopen2() {
        window.open('views/notice/admin.jsp', 'newWindow2', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbar=yes, resizable=no, copyhistory=yes, width=635, height=300');
      }
    </script>
    
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
                  <div class="textfield-search one-third" style="width:100%;">
                  	<input type="text" name="city" class="form-control" placeholder="Ex: HTML 호텔, 쉐라톤 등.." id="city1">
                  </div>
                  <div class="textfield-search one-third">
                    <input type="text" class="form-control" id="checkin_date" placeholder="체크인" onchange="checkIn();" style="font-size:13px;">
                  </div>  
                  <div class="textfield-search one-third">
                    <input type="text" class="form-control" id="checkout_date" placeholder="체크아웃" onchange="checkOut();" style="font-size:13px;">
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
  
        // 오늘날짜를 yyyy/dd/mm 식으로 만듬
        if(1<=(dt.getMonth()+1) && (dt.getMonth()+1)<=9) { // 오늘날짜에서 월이 1~9월이면
        	if(1<=dt.getDate() && dt.getDate()<=9) { // 일이 1~9일 일때
        		// str = 오늘날짜
      	      	var str = dt.getFullYear() + '/0' +(dt.getMonth()+1)+'/0'+dt.getDate();
     	   	}
     	    else {
     	      	var str = dt.getFullYear() + '/0' +(dt.getMonth()+1)+'/'+dt.getDate();
     	    }        	
        }
        else { // 오늘날짜에서 월이 10,11,12월이면
        	if(1<=(dt.getMonth()+1) && (dt.getMonth()+1)<=9) { // 일이 1~9일 일때
        	  	var str = dt.getFullYear() + '/' +(dt.getMonth()+1)+'/0'+dt.getDate();
       	   	}
       	    else {
       	      	var str = dt.getFullYear() + '/' +(dt.getMonth()+1)+'/'+dt.getDate();
       	    }
        }
        console.log("str : "+ str);
  
        // 오늘날짜에서 일만
        var today = (Number)(str.substring(8,10));
        console.log("today : "+ today);
        
        // 오늘날짜에서 달만
        var month = (Number)(str.substring(5,7));
        console.log("month : "+month);
  
        // 오늘 날짜에서 
        //var day = (Number)(str.substring(8,10));	
        
        // 내가 선택한 날짜(체크인)
        var monthDate = (Number)(date.substring(5,7));
        var dayDate = (Number)(date.substring(8,10));
  
        if(month > monthDate) { // 선택한 달보다 오늘 날짜 달이 더 클때
          alert('오늘 날짜 이전은 선택할 수 없습니다');
          document.getElementById('checkin_date').value = str;
        }
        else if (month == monthDate) { // 달이 같을때
            if(today > dayDate) { // 달이 같을때 선택한일이 오늘 일보다 적을때
              alert('오늘 날짜 이전은 선택할 수 없습니다');
              document.getElementById('checkin_date').value = str;
            }
            else { // 달이 같을때 선택한일이 오늘일보다 클때
              document.getElementById('checkin_date').value = date;
            }
        }
        else { // 오늘날짜보다 선택한날이 달이 더 클때
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
        
        if(dateIn==null) { // 체크인 날짜가 없을때
          alert('체크인 날짜를 입력하세요.')
        }
        else {
			
        	var str=""; // 체크인 날짜 보다 하루 뒤에 날짜 yyyy/mm/dd로
        	
        	if(1<=monthIn && monthIn<=9) {
        		if(1<=(dayIn+1) && (dayIn+1)<=9) {
        			str = yearIn + '/0' + monthIn + '/0' + (dayIn+1); 		
        		}
        		else {
        			str = yearIn + '/0' + monthIn + '/' + (dayIn+1); 
        		}
        	}
        	else {
        		if(1<=(dayIn+1) && (dayIn+1)<=9) {
        			str = yearIn + '/' + monthIn + '/0' + (dayIn+1); 		
        		}
        		else {
        			str = yearIn + '/' + monthIn + '/' + (dayIn+1); 
        		}
        	}
	        
	        // 체크인달의 마지막날짜
	        var lastDate = new Date(yearIn, monthIn, 0);
	        
	        var yearLast = (Number)(lastDate.getFullYear());
	        var monthLast = (Number)(lastDate.getMonth());
	        var dayLast = (Number)(lastDate.getDate());
	        
	        console.log("yearLast : "+yearLast);
	        console.log("monthLast : "+monthLast);
	        console.log("dayLast : "+dayLast);
	  
	        var str2 = ""; // 해당 달의 마지막 날짜를 yyyy/mm/dd로 구한것
	  		
	        if(1<=monthLast && monthLast<=9) { // 체크인달에 마지막날이 날짜가 월이 1~9월이면
		        if(1<=dayLast && dayLast<=9) { // 체크인달에 마지막날이 날짜가 일이 1~9일이면
		          str2 = yearLast + '/0' +(monthLast+1)+'/0'+dayLast;
		        }
		        else {
		          str2 = yearLast + '/0' +(monthLast+1)+'/'+dayLast;
		        }	        	
	        }
	        else { // 체크인달에 마지막날이  날짜가 월이 10,11,12월
	        	if(1<=dayLast && dayLast<=9) { // 체크인달에 마지막날이 날짜가 일이 1~9일이면
			      str2 = yearLast + '/' +(monthLast+1)+'/0'+dayLast;
			        }
		        else {
		          str2 = yearLast + '/' +(monthLast+1)+'/'+dayLast;
		        }
	        }
	  
	        if(dateIn == str2) { // 체크인날짜와 체크인달에 마지막날이 만약같을때
	          if(monthIn==12) { // 체크인달이 12월이면
	            str = (yearIn+1) + '/01/01'; 
	          }
	          else if(1<=monthIn && monthIn<=8) { // 체크인달이 1~8월이면 
	            str = yearIn + '/0' + (monthIn+1) + '/01';
	          }
	          else { // 체크인달이 9,10,11월이면
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

    <section>
      <div id="visual">     
        <div class="on"><img src="resources/img/event3.png" alt="1" width="100%" height="100%"></div>
        <div><img src="https://cdn.pixabay.com/photo/2020/09/28/10/07/face-mask-5609287_960_720.png" alt="2" width="100%" height="100%"></div>
        <div><img src="resources/img/event1.png" alt="3" width="100%" height="100%"></div>
        <div><img src="resources/img/event2.png" alt="4" width="100%" height="100%"></div>   
     <section>   
       <div id="left">
           <span></span>
           <span></span>
         </div>
         <div id="right">
           <span></span>
           <span></span>
         </div>
      </section>
   <section id="control">
       <a class="on" href="#"></a>
       <a href="#"></a>
       <a href="#"></a>
       <a href="#"></a>
   </section>
  </div>
  </section>

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
		    					<a href="https://brunch.co.kr/@hotelscomkr/910" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/seoul.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="https://brunch.co.kr/@hotelscomkr/910">서울, 대한민국</a></h3>
		    						<span class="listing">10개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="https://brunch.co.kr/@hotelscomkr/863" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/kangwon.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="https://brunch.co.kr/@hotelscomkr/863">강원도, 대한민국</a></h3>
		    						<span class="listing">10개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="https://brunch.co.kr/@expediakr/806" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/전라도.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="https://brunch.co.kr/@expediakr/806">전라도, 대한민국</a></h3>
		    						<span class="listing">6개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="https://brunch.co.kr/@hotelscomkr/1012" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/kyungsang.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="https://brunch.co.kr/@hotelscomkr/1012">경상도, 대한민국</a></h3>
		    						<span class="listing">5개의 목록</span>
		    					</div>
		    				</div>
	    				</div>
	    				<div class="item">
		    				<div class="destination">
		    					<a href="https://brunch.co.kr/@hotelscomkr/601" class="img d-flex justify-content-center align-items-center" style="background-image: url(resources/img/kyungki.jfif);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="https://brunch.co.kr/@hotelscomkr/601">경기도, 대한민국</a></h3>
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
                <li><a href="views/notice/FAQ.jsp" class="py-2 d-block">FAQ</a></li>
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

  <script>
    var idx_lgth = $("#visual>div").length;
    var srt = 1;
    var idx = 0;
    
    $("section>a").click(function(){
      idx = $(this).index();
      srt = idx;
      $(this).addClass('on').siblings().removeClass('on');
      $("#visual>div").eq(idx).addClass('on').siblings().removeClass('on');
    });
    
  var AutoSlide = setInterval(AutoRun, 1000);
  
  function AutoRun(){
    srt++;  
    
    if(srt == idx_lgth){
        srt = 0;  
    }
  $("section>a").eq(srt).addClass('on').siblings().removeClass('on');
    $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
  }
  
  $("#visual").mouseover(function(){
    clearInterval(AutoSlide);
    $("#right").css({opacity : '1'});
    $("#left").css({opacity : '1'});
  });
  $("#visual").mouseleave(function(){
     AutoSlide = setInterval(AutoRun, 1000);
      $("#right").css({opacity : '0'});
    $("#left").css({opacity : '0'});
  });
  
  $("#right").click(function(){
    srt++;
   if(srt == idx_lgth){
        srt = 0;   
   } 
   $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on'); $("section>a").eq(srt).addClass('on').siblings().removeClass('on');
  });
  
  $("#left").click(function(){
    srt--;
    if(srt == -1){
        srt = idx_lgth-1; 
    }
   $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
    $("section>a").eq(srt).addClass('on').siblings().removeClass('on'); 
  });
  
  $("#menuicon+label").on(click, function() {
	  console.log('test');
  });
  
  
  
  function folder(){
	  var con = document.getElementById("bar");
	  if(con.style.display=='block'){
	  	con.style.display = 'none';
	  }else{
	  	con.style.display = 'block';
	  }
  }
  </script>

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