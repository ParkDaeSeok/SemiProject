<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<style>
	
		*{
			text-align : center;
		}
		
		.ftco-footer {
			
			margin-top : 400px;
		}
		
		#div1 {
			margin-top: 250px;
		}
		
	</style>
			
			<%@ include file="../common/topbar.jsp" %>
			
			
	<section>
	
		
		<form name="findIdForm">
			<input type="hidden" name="name">
			<input type="hidden" name="email">
			<input type="hidden" name="phone">
		</form>
		
		
			<div id="div1">
		<h3>아이디 찾기</h3>
		
			<table class ="table" style="margin:0 auto;width:700px;">
				<tr>
					<td><input type="text" name="Name" id="name" class="form-control" placeholder="이름을 입력하세요"></td>
				</tr>
				<br>
				<tr>
					<td><input type="text" name="Email" id="email"class="form-control" placeholder="이메일을 입력하세요"></td>
				</tr>
				<br>
				<tr>
					<td><input type="text" name="Phone" id="phone" class="form-control" placeholder="전화번호를 입력하세요 (- 제외)"></td>
				</tr>
			</table>
			<button type="button" id="searchBtn" class= "btn btn-outline-info btn sm" onclick="findId()">검색</button>
	
			</div>
		

	</section>
		
		<script>
	      function findId(){
	         var name = document.getElementById("name").value;
	         var email = document.getElementById("email").value;
	         var phone = document.getElementById("phone").value;
	         if(name == "" && email == "" && phone == ""){
	            alert("모든 정보를 입력해주세요.");
	            return;
	         }
	         
	         var url = "<%= request.getContextPath() %>/findId.me"; // 요청 서블릿 url
	         
	         var title ="/findId"; //윈도우 창 이름
	         
	         var status = "left=100px, top=100px, width=500px, height=600px, menubar-no, status=no, scrollbar=yes";
	         
	         
	         var popup = window.open("",title,status); //빈창 오픈
	         
	         findIdForm.name.value=name;
	         findIdForm.email.value=email;
	         findIdForm.phone.value=phone;
	         
	         findIdForm.target = title;//popup창과 form태그를 연결
	         //action,method설정 후 form태그 submit
			  console.log(findIdForm.target);
	         findIdForm.action = url;	
	         findIdForm.method="post";
	         
	         findIdForm.submit();
	      }
	   </script>
	   
	
</body>

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
</html>