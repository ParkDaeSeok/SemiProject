<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%@ page import="java.util.Date" %>
   
<%
	//Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : topbar.jsp 가 로딩될때 null
	// 로그인 후 : topbar.jsp 가 로딩될때 로그인한 회원의 정보가 담겨있음
	
	// 성공 / 경고 메시지 뽑기
	//String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : alertMsg = null
	// 서비스 요청 후 성공 시 : alertMsg = 메시지 문구
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


</head>

<body>
	
	<%@ include file="../common/topbar.jsp" %>
	
    <div class="wrap">
        <div id="header">
            <a href="#"></a>  
            <div class="header_area">
           
                <div class="login_area">
                     <!-- 로그인 전에 보여지는 로그인 form -->  

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

                    <!-- 계정 및 비밀번호 page -->
                    
                    <div id="password_change">
                        <label>비밀번호</label><br>
                        ****** 
                        <!-- Button to Open the Modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="button_move">
                                                     비밀번호 변경
                        </button>

                        <!-- The Modal -->
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                            <div class="modal-content">
                                <div id="password_pop">
                                    <br>
                                    &nbsp;&nbsp;&nbsp;<span id="font10">비밀번호 변경</span>
                                    <br><br>
            
                                    <form action="<%= contextPath %>/updatePwd.me" method="post">
                                    <!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 확인 (재입력) -->
                                    
                                    	<!-- 확실하게 주인을 판별할 수 있는 id 도 같이 넘겨야 한다. -->
                                        <input type="hidden" name="userId" value="<%= loginMember.getMemberId() %>">
                                        
                                        <table id="password_space">
	                                        <tr>
	                                            <td><label>* 현재 비밀번호</label></td>
	                                            <td><input type="password" name="userPwd" required></td>
	                                        </tr>
	                                        <tr>
	                                            <td><label>* 새 비밀번호</label></td>
	                                            <td><input type="password" name="updatePwd" id="userPwd1" required></td>
	                                        </tr>
	                                        <tr>
	                                            <td><label>* 새 비밀번호 확인&nbsp;&nbsp;</label></td>
	                                            <td><input type="password" name="checkPwd" id="userPwd2" required></td>
	                                        </tr>
                                    	</table>
            
                                    <br>
                                        <input type="submit" value="수정하기" onclick="return validatePwd();" id="value1">
                                    
                                    </form>
                                </div>    
                                <!-- Modal footer -->
                                <div class="modal-footer" id="close_button">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                                </div>
                                
                            </div>
                            </div>
                        </div>
                        
                        <br>
                        <label>이메일</label> <br>
                        <span><%= loginMember.getEmail() %></span>
                        <br><br>
                        
                        <label>회원가입일</label><br>
                        <span><%= loginMember.getEnrollDate() %></span>
                    
                    </div>
                    <br>
                    
                    <!--
                    <script>
                      function validatePwd() {

                          if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
                              alert("비밀번호가 일치하지 않습니다.");

                              return false;
                          }
                          else {
                              return true;
                          }

                      }
                    </script>
                    -->

                    <script>
                    // 유효성 검사 : 사용자가 입력한 값들이 유효한 값의 형태인지
                    function validatePwd() {
        
                    // 유효성 검사 : 아이디, 비밀번호, 비밀번호 일치, 이름
                    var userPwd1 = document.getElementById('userPwd1').value;
                    var userPwd2 = document.getElementById('userPwd2').value;
                  
                    // 1) 비밀번호 검사
                    // 영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.
                    // 특수문자 : !@#$%^
                    regExp = /^[a-z\d!@#$%^]{8,15}$/i;
                    if(!regExp.test(userPwd1)) {
        
                        alert('영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.');
        
                        // 재입력 유도
                        document.getElementById('userPwd1').value = '';
                        document.getElementById('userPwd1').focus();
        
                        return false;
        
                    }
        
                    // 3) 비밀번호 일치
                    if(userPwd1 != userPwd2) {
        
                        alert('동일한 비밀번호를 입력해주세요.');
        
                        // 재입력 유도
                        document.getElementById('userPwd2').value = '';
                        document.getElementById('userPwd2').focus();
        
                        return false;
                    }
        
                    return true;
        
                }
              </script>
              
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