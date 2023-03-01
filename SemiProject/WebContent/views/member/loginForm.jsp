<%@ page language="java" contentType="text/html; charset=UTF-8" 
  pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">            
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인 폼</title>
	
	  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- Bootstrap CSS -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/style_htk.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="./style.css">

	<link rel="stylesheet" href="views/common/css/style_nkp.css">
    <link rel="stylesheet" href="views/common/style_nkp.css" />

	<style type="text/css">
		
		#pop{
		
		  text-decoration: none;
		  z-index:1; 
		  position:absolute;
		  width:300px;
		  height:400px;
		  padding: 30px, 20px;
		  background-color:#ffffff;
		  text-align:center;
		  top:65%;
		  left:50%;
		  transform: translate(-50%,-50%);
		  border-radius: 15px;
		}
		
		.loginForm h2{
		  text-align: center;
		  margin: 30px;
		}
		
		.idForm{
		  border-bottom: 2px solid #adadad;
		  margin: 30px;
		  padding: 10px 10px;
		}
		
		.passForm{
		  border-bottom: 2px solid #adadad;
		  margin: 30px;
		  padding: 10px 10px;
		}
		
		.id {
		  width: 100%;
		  border:none;
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:25px;
		  background: none;
		}
		
		.pwd {
		  width: 100%;
		  border:none;
		  outline:none;
		  color: #636e72;
		  font-size:16px;
		  height:25px;
		  background: none;
		}
		
		#logBtn {
		  position:relative;
		  left:40%;
		  transform: translateX(-50%);
		  margin-bottom: 40px;
		  width:80%;
		  height:40px;
		  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
		  background-position: left;
		  background-size: 200%;
		  color:white;
		  font-weight: bold;
		  border:none;
		  cursor:pointer;
		  transition: 0.4s;
		  display:inline;
		}
		
		.btn:hover {
		  background-position: right;
		}
		
		#mainLog {
		  position:relative;
		  left:40%;
		  transform: translateX(-50%);
		  margin-bottom: 40px;
		  width:80%;
		  height:40px;
		  background-position: left;
		  background-size: 200%;
		  font-weight: bold;
		  border:none;
		  cursor:pointer;
		  transition: 0.4s;
		  display:inline;
		  text-decoration:none
		}
		
		#mainLog:hover {
		  background-position: right;
		}
		
		.bottomText>a {
		  text-align: center;
		  color: #636e72;
		  font-size: 14px;
		}
		
		#mask {  
		    position:absolute;  
		    background-color:rgb(40, 110, 241);   
		    left:0;
		    top:0;
		    width: 100%;

			float: left;
		} 
		#footer {
			position: relative;
			float: left;
			top: 900px;
			height: 10%;
			

		}
	
	
	</style>

</head>
<body style="background-color:rgb(40, 110, 241);"   >
	
	<%@ include file="../common/topbar.jsp" %>

	<div id="mask">
	<div id="pop">
		<form action="<%= request.getContextPath() %>/login.me" method="post" class="loginForm">
			<h2>Login</h2>
			<div class="idForm">
				<input type="text" class="id" name="memberId" placeholder="ID" required>
			</div>
			<div class="passForm">
				<input type="password" class="pwd" name="memberPwd" placeholder="PW" required>
			</div>
			<button type="submit" id="logBtn">LOG IN</button>              
			
			<div class="bottomText">
				<a onclick="enrollForm()">회원가입</a>  
				<a onclick="findIdForm()">ID찾기</a>/ 	
				<a onclick="findPwdForm()">PW찾기</a>
			</div>
		</form>
	</div>
	<footer class="ftco-footer ftco-bg-dark ftco-section" id="footer">
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
		
	  </footer>  
	  </div>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>	
		function enrollForm() { // 회원가입 버튼 클릭 시, 회원가입 화면으로 이동
			location.href = "<%= contextPath %>/enrollForm.me";
		}

		function findIdForm() {
			location.href = "<%= contextPath %>/findIdForm.me";
		}
		
		function findPwdForm() {
			location.href = "<%= contextPath %>/findPwdForm.me";
		}

	</script>   



</body>
</html>