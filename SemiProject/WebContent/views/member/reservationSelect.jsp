<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.member.model.vo.Booking, com.kh.member.model.vo.Member" %>
<%
	ArrayList<Booking> list = (ArrayList<Booking>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" type="text/css" href="/html/views/common/css/mypage.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- 글자 폰트 관련 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comforter&family=Comforter+Brush&family=Dancing+Script&family=Oswald:wght@600&display=swap" rel="stylesheet">
    
    <!-- 경필님 꺼 -->
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
    <link rel="stylesheet" href="/html/views/common/css/style.css">

	<style>
		input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button { -webkit-appearance: none; margin: 0; }
	</style>
</head>

<body>
  

  	<%@ include file="../common/topbar.jsp" %>

    <div class="wrap">
        <div id="header">
            <a href="#"></a>  
            <div class="header_area">
           
                <div class="login_area">
                     <!-- 로그인 전에 보여지는 로그인 form -->
                     <!-- 
                     <div id="login-before">
                        <form id="login-form" action="/jsp/login.me" method="post">
                            <span><a href="" style="font-size:15px;" id="login_font">로그인</a></span>
                        </form>
                    </div>
                     -->
                    

                    <!-- 로그인 성공 후 화면 -->
                    
                    <div id="login-after">
                        <b style="font-size:15px;"><%= loginMember.getMemberName() %></b>님 환영합니다.
                        
                    </div>
                    
                </div>
                
            </div>  
            
        </div> <!-- /header -->

        <div id="content">
            <div id="content_1">
                
                <div id="userclass">
                    <img src="resources/img/logo_2.PNG">
                    <span style="font-family:굴림" id="hotel_name"><b>여기서 쉬시조 회원</b></span>
                </div>
                <p id="MyPage">마이페이지</p>
                <div id="list" align="center">
                    <input id="check-btn1" type="checkbox" />
                    <label for="check-btn1" class="font_1">My 예약</label>
                    <ul class="menubars1">
                        <li><a href="#" onclick="selectBook();">예약 조회</a></li>
                        <li><a href="#" onclick="cancelBook();">예약 취소</a></li>
                    </ul><br>
                    <input id="check-btn2" type="checkbox" />
                    <label for="check-btn2" class="font_1">My 계정</label>
                    <ul class="menubars2">
                        <li><a href="#" onclick="myInfo();">내 정보</a></li>
                        <li><a href="#" onclick="updatePwd();">계정 및 비밀번호</a></li>
                    </ul>
                </div>    
                
            </div> <!-- content_1 -->
            
            <script>
                function selectBook() {
                    
                    var url = "<%= request.getContextPath() %>/myPageForm.me"
                    var memberNo = <%= loginMember.getMemberNo() %>;

                    var form = document.createElement('form');
                    form.setAttribute('method', 'post');
                    form.setAttribute('action', url);
                    document.charset ="UTF-8";

                    var hiddenField = document.createElement('input');
                    hiddenField.setAttribute('type', 'hidden');
                    hiddenField.setAttribute('name', 'memberNo');
                    hiddenField.setAttribute('value', memberNo);
					form.appendChild(hiddenField);
					
					document.body.appendChild(form);
					
					form.submit();

                }
                
                function cancelBook() {
                	
                	var url = "<%= request.getContextPath() %>/bCancelForm.me"
                    var memberNo = <%= loginMember.getMemberNo() %>;

                    var form = document.createElement('form');
                    form.setAttribute('method', 'post');
                    form.setAttribute('action', url);
                    document.charset ="UTF-8";

                    var hiddenField = document.createElement('input');
                    hiddenField.setAttribute('type', 'hidden');
                    hiddenField.setAttribute('name', 'memberNo');
                    hiddenField.setAttribute('value', memberNo);
					form.appendChild(hiddenField);
					
					document.body.appendChild(form);
					
					form.submit();
                }
                
 				function myInfo() {
                	
                	location.href = '<%= request.getContextPath() %>/updateMyInfoForm.me';
                	
                }
 				
				function updatePwd() {
                	
                	location.href = '<%= request.getContextPath() %>/updatePwdForm.me';
                }
            </script>
               
            <div id="content_2">

                    <!-- 예약 조회 page-->

                    
                    <div>
                        <p>
                            <label>예약 조회</label>
                        </p>
                        <form action="bSearch.me" method="post">
                            <input type="number" name="bookNo" id="search_number" placeholder="예약번호를 입력하세요" required>
                            <input type="submit" value="검색" id="search_click">
                            <input type="hidden" value= <%= loginMember.getMemberNo() %> name="memberNo">
                        </form>
                    </div>
                    
                    <br>
                    
                    <div>
                        <table id="search_table">
                        <% if(!(list.isEmpty())) { %>
                          <tr>
                            <td width="100px;" style="text-align:center">예약번호</td>
                            <td width="80px;" style="text-align:center">성함</td>
                            <td width="320px;" style="text-align:center">상세정보</td>
                            <td width="100px;" style="text-align:center">총금액</td>
                            <td width="100px;" style="text-align:center">결제유무</td>
                          </tr>
                          <% for(Booking b : list)  {%>
                            <tr>
                                <td style="text-align:center"> <%= b.getBookNo() %> </td>
                                <td style="text-align:center"> <%= b.getMemberName() %></td>
                                <td style="text-align:center"><%= b.getBookDate() %> / <%= b.getHotelName() %></td>
                                <td style="text-align:center"><%= b.getRoomPrice() %>원</td>
                                <td style="text-align:center"><%= b.getPayStatus() %></td>
                            </tr>
                            <% } %>
                          </table>
                            <% } else { %>
                        <div id="border_line"></div> <br>
                            <p style=height:50px;>
                                <label>&nbsp;&nbsp;&nbsp;&nbsp;예약 내역이 존재하지 않습니다.</label>
                            </p>
                        </div>
                        <div style="margin-bottom : 350px"></div>
                        <% } %>
                    <br>
                </div> <!-- content_2 -->
            
        </div><!-- #content -->

    </div> <!-- wrap -->    
  
  
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
   

    



</body>
</html>