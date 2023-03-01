<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
    Member loginMember = (Member)session.getAttribute("loginMember");
%>
<%
	String contextPath = request.getContextPath();

	String alertMsg = (String)session.getAttribute("alertMsg");
	
	String errorMsg = (String)session.getAttribute("errorMsg");
%>    
     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style_pds.css">

   <style>
    #navbar-logo {
      margin-left: 38.5%;
      
    }
    #navbar-logo:hover {
      cursor: pointer;
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
</head>
<body>

	<script>

		var msg = "<%= alertMsg %>"; <%-- "메세지 문구" / "null" --%>
		
		if(msg != "null") { // 성공메세지 문구가 담겨있을 경우
			alert(msg);
		
			<% session.removeAttribute("alertMsg"); %>
		}
		
	</script>
    <% if(loginMember == null) { %>
    <!-- 로그인 전 로그인 버튼 상단바-->
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="top: 0"> 
		<div class="container"> 
		  <div class="collapse navbar-collapse" id="ftco-nav">
			<div id="navbar-logo" onclick="mainPage();">
				<img src="/html/resources/img/html.png">
				<h1>HTML</h1>
			</div>
			<ul class="navbar-nav ml-auto" style="margin-right : 5%;">
			  <li class="nav-item cta" id="log"><a  class="nav-link" onclick="loginForm();"><span><i class="fas fa-user"></i>로그인</span></a></li> <!-- 로그인 페이지 링크-->
			  <li class="nav-item cta" id="sign"><a class="nav-link" onclick="enrollForm();"><span><i class="fas fa-sign-in-alt"></i>회원가입</span></a></li> <!-- 회원가입 페이지 링크-->
			</ul>
		  </div>
		</div>
	</nav>
  <% } else { %>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="top: 0"> 
      <div class="container"> 
        <div class="collapse navbar-collapse" id="ftco-nav">
        <div id="navbar-logo" onclick="mainPage();">
          <img src="/html/resources/img/html.png">
          <h1>HTML</h1>
        </div>
        <ul class="navbar-nav ml-auto" style="margin-right : 5%;">
          <li class="nav-item cta" id="log"><a  class="nav-link" onclick="logoutForm();"><span><i class="fas fa-user"></i>로그아웃</span></a></li> <!-- 로그아웃 후 메인페이지-->
          <li class="nav-item cta" id="sign"><a class="nav-link" onclick="myPageForm();"><span><i class="fas fa-sign-in-alt"></i>마이페이지</span></a></li> <!-- 마이페이지 링크-->
          <!-- 로그인 시 회원가입버튼 대신 마이페이지 연결 (보류) 완료-->
        </ul>
        </div>
      </div>
    </nav>
   <% } %>

    
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
  
  <script>
  	function mainPage() {
  		location.href = "<%= contextPath %>";
  	}

    function logoutForm() { // 로그아웃 버튼 클릭 시, 로그인 전 메인 화면으로
      location.href = "<%= contextPath %>/logout.me"
    }


  	function loginForm() { // 로그인 버튼 클릭 시, 로그인 화면으로 이동
  		location.href = "<%= contextPath %>/loginForm.me";
  	} 
  
  	function enrollForm() { // 회원가입 버튼 클릭 시, 회원가입 화면으로 이동
  		location.href = "<%= contextPath %>/enrollForm.me";
  	}

    function myPageForm() { // 마이페이지로 이동하는 
    	location.href= "<%= contextPath %>/updateMyInfoForm.me";
    }
  </script>
    
</body>
</html>