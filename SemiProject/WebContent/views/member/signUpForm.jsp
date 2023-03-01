<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>HTML - HotelMostList</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	<link rel="stylesheet" href="/html/views/common/css/style-signup.css">

	<link href="/html/views/common/css/datepicker.min_kcg.css" rel="stylesheet" type="text/css" media="all">
	<!-- Air datepicker css -->
	<script src="/html/views/common/js/datepicker_kcg.js"></script>
	<script src="/html/views/common/js/i18n/datepicker.ko_kcg.js"></script>

</head>
<body>

	<%@ include file="../common/topbar.jsp" %>
	
	
	<div class="row justify-content-center" style="background-color: rgb(248, 250, 255);">
		<div class="col-md-6">
			<div class="card" style="margin-top : 100px;">
				<header class="card-header">
					<h4 class="card-title mt-2" style="text-align: center;">회원가입</h4>
				</header>
				<article class="card-body">
				
				<form action="<%= contextPath %>/insert.me" method="post">
					<div class="form-group">
						<label>* 이름</label>
						<input type="text" class="form-control" id="userName" name="memberName" maxlength="6" required>
						
					</div>
					<div class="form-row" id="id-form">
						<div class="col form-group">
							<label>* 아이디</label> 
							<label id="gender-label">* 성별</label><br>
							<input type="text" class="form-control" id="userId" name="memberId" required>
							<select class="form-control" id="gender" name="gender">
								<option value="M" selected>남성</option>
								<option value="F">여성</option>
							</select>
							<div id="userIdAlert"></div>
						</div>
					</div>
	
					<div class="form-row" id="pwd-form">
						<div class="col form-group">
							<label>* 비밀번호 </label>   
							<input type="password" class="form-control" id="userPwd" name="memberPwd" required>
							<div id="userPwdAlert"></div>
						</div>
						<div class="col form-group">
							<label>* 비밀번호 확인</label>
							<input type="password" class="form-control" id="pwdCheck" required>
						</div>
					</div>
	
					<div class="form-group" id="email-form">
						<label>* 이메일</label> <br>
						<input type="hidden" id="email" name="email" value=""> <!-- js 로 email-front + at + back 합쳐서 value에 담고 넘길 예정 -->
						<input type="text" class="form-control" id="email-front" required>
						<span id="email-at">@</span>
						<input type="text" class="form-control" id="email-back" maxlength="14" disabled required>
						<select class="form-control" id="email-select">
							<option value="X" selected>선택</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="1">직접 입력</option>
						</select>
						<div id="emailAlert"></div>
					</div>
						<div class="form-group" id="phone-form">
						<label>* 휴대폰번호</label> <br>
						<input type="hidden" id="phone" name="phone" value=""> <!-- js 로 phone-front + mid + back 합쳐서 value에 담고 넘길 예정 -->
						<select class="form-control" id="phone-front">
							<option value="N" selected>선택</option>
							<option>010</option>
							<option>011</option>
							<option>016</option>
						</select>
	
						<label class="phone-dash">-</label>
	
						<input type="text" class="form-control" id="phone-mid" maxlength="4" required>
	
						<label class="phone-dash">-</label>
	
						<input type="text" class="form-control" id="phone-back" maxlength="4" required>
						<div id="phoneAlert"></div>
					</div>
					<div class="form-group">
						<label>* 생년월일</label> <br>
						<input type="text" class="form-control" id="birth" name="birth" required>
						<button type="button" class="btn btn-secondary btn-sm" id="form-check">입력 완료 시 클릭</button>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block" id="submit" disabled> 가입하기 </button>
					</div>      
				</form>
				
				</article> <!-- card-body end .// -->
			</div> <!-- card.// -->
		</div> <!-- col.//-->
	
	</div> <!-- row.//-->
	
	
	<br>
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
		
	<script>

		/* 생년월일 달력 폼 설정 */
		$("#birth").datepicker({
			dateformat : "yy-mm-dd",
			language: 'ko',
			maxDate: new Date()
		}); 
	
		// 회원가입 폼 유효성 검사 정규표현식
		var nameReg = /^[가-힣]{2,6}$/; // 한글 단어만 2글자 ~ 6글자
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/; // 앞글자는 영소문자, 영소문자와 숫자만 6 ~ 20자
		var pwdReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/; // 비밀번호 8 ~ 20 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자
		var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; // 앞부분은 영문자, 영문자와 숫자만 6 ~ 15자 / 뒷부분은 14자까지 도메인 형식으로
		var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 숫자만
		var birthReg = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/; // yyyymmdd 형식으로 숫자만
		var iCnt = 0;
		var pCnt = 0;
		var eCnt = 0;


		/* ---------- 실시간 아이디 중복 체크 ---------- */
	    $("#id-form #userId").on("propertychange change keyup paste input", function() { // 아이디 input 태그 변경 감지
		    if( ! idReg.test($("#userId").val() ) ) { // 정규식에 맞지 않을 때

		        $("#id-form #userIdAlert").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.").css("color", "red");
				iCnt = 0;

		    } else { // 정규식에 맞다면, ajax로 DB 값과 비교
		
					var $userId = $("#id-form #userId");
					var $idAlert = $("#id-form #userIdAlert");
					
					$.ajax ({
							
						url : "idCheck.me",
						data : { checkId : $userId.val() },
						success : function(result) {
							if(result == "NNNNN") { // 중복된 아이디 == 사용불가
		    					$idAlert.text("이미 존재하거나 탈퇴한 회원의 아이디입니다.").css("color", "red");
								iCnt = 0;
		    				
		    				} else { // 중복되지 않은 아이디 == 사용가능
		    					
		    					$idAlert.text("사용 가능한 아이디 입니다.").css("color", "blue");
								iCnt = 1;
		    				}
						},
						error : function() {
							console.log('ajax ID 체크 실패');
						}
						
					});
					
		    	}
	    });
	    /* ---------------------------------------- */
	    
	    /* ---------- 비밀번호 같은지 체크 ---------- */
		$("#pwd-form #userPwd").on("propertychange change keyup paste input", function() { // 비밀번호 input 태그 변경 감지
			var $pwdAlert = $("#pwd-form #userPwdAlert");
		    if( ! pwdReg.test($("#userPwd").val() ) ) { // 정규식에 맞지 않을 때
		        $pwdAlert.text("비밀번호는 8 ~ 20 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함해야 합니다.").css("color", "red");
				pCnt = 0;
		    } else { // 정규식에 맞을 때
				if( $("#userPwd").val() != $("#pwdCheck").val() ) { // 비밀번호와 비밀번호 확인이 서로 일치하지 않을 때
					$pwdAlert.text("입력한 비밀번호가 일치하지 않습니다.").css("color", "red");
					pCnt = 0;
				} else { // 비밀번호와 비밀번호 확인이 서로 일치할 때
					$pwdAlert.text("사용 가능한 비밀번호 입니다.").css("color", "blue");
					pCnt = 1;
				}
			}
		});

		$("#pwd-form #pwdCheck").on("propertychange change keyup paste input", function() { // 비밀번호 확인 input 태그 변경 감지
			var $pwdAlert = $("#pwd-form #userPwdAlert");
		    if( ! pwdReg.test($("#userPwd").val() ) ) { // 정규식에 맞지 않을 때
		        $pwdAlert.text("비밀번호는 8 ~ 20 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함해야 합니다.").css("color", "red");
				pCnt = 0;
		    } else { // 정규식에 맞을 때
				if( $("#userPwd").val() != $("#pwdCheck").val() ) { // 비밀번호와 비밀번호 확인이 서로 일치하지 않을 때
					$pwdAlert.text("입력한 비밀번호가 일치하지 않습니다.").css("color", "red");
					pCnt = 0;
				} else { // 비밀번호와 비밀번호 확인이 서로 일치할 때
					$pwdAlert.text("사용 가능한 비밀번호 입니다.").css("color", "blue");
					pCnt = 1;
				}
			}
		});
		/* ---------------------------------------- */

		/* ---------- 실시간 이메일 중복 체크 ---------- */
		$("#email-form #email-front").on("propertychange change keyup paste input", function() {  // 이메일 input 태그 변경 감지
			var $emailMerge = $("#email-front").val() + '@' + $("#email-back").val();
		
		    if( ! emailReg.test( $emailMerge ) ) { // 정규식에 맞지 않을 때
		    	
		        $("#email-form #emailAlert").text("이메일은 영문자로 시작하며, 최대 15자의 영문자 또는 숫자이어야 합니다.").css("color", "red");
				eCnt = 0;
		    
		    } else { // 정규식에 맞다면, ajax로 DB 값과 비교
	
					var $emailAlert = $("#email-form #emailAlert");
					
					$.ajax ({
							
						url : "emailCheck.me",
						data : { checkEmail : $emailMerge },
						success : function(result) {
							if(result == "NNNNN") { // 중복된 아이디 == 사용불가
		    					$emailAlert.text("이미 존재하거나 탈퇴한 회원의 이메일입니다.").css("color", "red");
								eCnt = 0;
		    				
		    				} else { // 중복되지 않은 아이디 == 사용가능
		    					
		    					$emailAlert.text("사용 가능한 이메일 입니다.").css("color", "blue");
								eCnt = 1;
		    					
		    				}
						},
						error : function() {
							console.log('ajax EMAIL 체크 실패');
						}
						
					});
					
		    	}
	    });
		
		$("#email-form #email-select").on("change", function() { // 이메일 input 태그 변경 감지
			$("#email-select option:selected").each(function () { 

				if($(this).val()== '1'){ //직접입력일 경우

					$("#email-back").val(''); //값 초기화 
					$("#emailAlert").text('');
					$("#email-back").attr("disabled",false); //활성화
					
					$("#email-form #email-back").on("propertychange change keyup paste input", function() { // 직접입력 시, input 태그 변경 감지
						var $emailMerge = $("#email-front").val() + '@' + $("#email-back").val();
						
					    if( ! emailReg.test( $emailMerge ) ) { // 정규식에 맞지 않을 때
					    	
					        $("#email-form #emailAlert").text("이메일은 영문자로 시작하며, 최대 15자의 영문자 또는 숫자이어야 합니다.").css("color", "red");
							eCnt = 0;
					    
					    } else { // 정규식에 맞다면, ajax로 DB 값과 비교
				
								var $emailAlert = $("#email-form #emailAlert");
								
								$.ajax ({
										
									url : "emailCheck.me",
									data : { checkEmail : $emailMerge },
									success : function(result) {
										if(result == "NNNNN") { // 중복된 아이디 == 사용불가
					    					$emailAlert.text("이미 존재하거나 탈퇴한 회원의 이메일입니다.").css("color", "red");
											eCnt = 0;

					    				
					    				} else { // 중복되지 않은 아이디 == 사용가능
					    					
					    					$emailAlert.text("사용 가능한 이메일 입니다.").css("color", "blue");
											eCnt = 1;
					    					
					    				}
									},
									error : function() {
										console.log('ajax EMAIL 체크 실패');
									}
									
								});
								
					    	}
					});

				} else { // 직접입력이 아닐경우 

					$("#email-back").val($(this).text()); //선택값 입력 
					$("#email-back").attr("disabled",true); //비활성화
					
					var $emailMerge = $("#email-front").val() + '@' + $("#email-back").val();
					
				    if( ! emailReg.test( $emailMerge ) ) { // 정규식에 맞지 않을 때
				    	
				        $("#email-form #emailAlert").text("이메일은 영문자로 시작하며, 최대 15자의 영문자 또는 숫자이어야 합니다.").css("color", "red");
						eCnt = 0;
				    
				    } else { // 정규식에 맞다면, ajax로 DB 값과 비교
			
							var $emailAlert = $("#email-form #emailAlert");
							
							$.ajax ({
									
								url : "emailCheck.me",
								data : { checkEmail : $emailMerge },
								success : function(result) {
									if(result == "NNNNN") { // 중복된 아이디 == 사용불가
				    					$emailAlert.text("이미 존재하거나 탈퇴한 회원의 이메일입니다.").css("color", "red");
										eCnt = 0;
				    				
				    				} else { // 중복되지 않은 아이디 == 사용가능
				    					
				    					$emailAlert.text("사용 가능한 이메일 입니다.").css("color", "blue");
										eCnt = 1;

																		
				    				}
								},
								error : function() {
									console.log('ajax EMAIL 체크 실패');
								}
							});
				    	}
				}
			}); 
	    });
		/* ---------------------------------------- */


		/* ---------- 모든 값이 유효한지 최종 검사 ---------- */
		$("#form-check").click(function() {
			$("#email").val($("#email-front").val() + '@' + $("#email-back").val()); // Servlet으로 넘길 값
			$("#phone").val($("#phone-front").val() + $("#phone-mid").val() + $("#phone-back").val()); // Servlet으로 넘길 값
		
			var userName = $("#userName").val();
			var phone = $("#phone").val();
			var phoneCheck = phone.indexOf('N');
			var birth = $("#birth").val();
			var count = iCnt + pCnt + eCnt;

			if( userName != "" && phone != "" && birth != "" && phoneCheck == -1) {
				if( nameReg.test( userName ) ) {
					if( birthReg.test( birth ) ) {
						if( phoneReg.test( phone ) ) {
							if( count == 3 ) {
								alert('모든 정보가 올바르게 작성되었습니다.');
								$("#submit").attr("disabled", false);
								$("#userName").attr("readonly", true);
								$("#userId").attr("readonly", true);
								$("#userPwd").attr("readonly", true);
								$("#pwdCheck").attr("readonly", true);
								$("#email-front").attr("disabled", true);
								$("#email-back").attr("disabled", true);
								$("#email-select").attr("disabled", true);
								$("#phone-front").attr("disabled", true);
								$("#phone-mid").attr("disabled", true);
								$("#phone-back").attr("disabled", true);
								$("#birth").attr("readonly", true);
							} else {
								alert('아이디 또는 비밀번호 또는 이메일이 올바르지 않습니다.');
							} 
						} else {
							alert('전화번호가 올바르지 않습니다. 숫자만 입력해주세요.');		
						}
					} else {
						alert('생년월일이 올바르지 않습니다. 달력에서 선택해주세요.');	
					}
				} else{
					alert('이름이 올바르지 않습니다. 이름 형식에 맞게 2글자 이상 입력해주세요.');
				}
					
			} else {
				alert('모든 정보를 입력해주세요.');
			}
		});
		/* ---------------------------------------- */
		
		
		/* 달력 그림 클릭 시, 생년월일 input 으로 focus */
		/*
		$("#calendar").click(function() {
			$('#birth').focus();
		});
		*/
		

	</script>

</body>
</html>

