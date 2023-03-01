<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>\
<%
	String hotelName = (String)request.getAttribute("hotelName");
	String roomName = (String)request.getAttribute("roomName");
	int totalPay = (Integer)request.getAttribute("totalPay");
	String checkIn = (String)request.getAttribute("checkIn");
	String checkOut = (String)request.getAttribute("checkOut");
	int bookNo = (Integer)request.getAttribute("bookNo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML 결제 창</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--   Google Fonts -->
 <link rel="preconnect" href="https://fonts.gstatic.com"><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
 

<!-- Custom styles for this template -->
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="common/style_har.css">


</head>


<body id="bootstrap-overrides">
    <div class="container">
        <main>
            <div class="py-1 text-center">
              <img class="" src="resources/img/logo.png" alt="" width="100" height="100">
                <h2>결제 페이지</h2>
              </div>

              <div class="row g-5">
                <div class="col-md-5 col-lg-4 order-md-last">
                  <div class="hotel-info">
                  <h4 class="d-flex justify-content-center align-items-center mb-3">
                   
                    <span class="text-primary"></span>
                  </h4>
                  <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-center lh-sm">
                      <div>
                        <h3 class="my-0" >호텔 이름</h3>
                        <large class="text-muted"><%= hotelName %></large>
                      </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-center lh-sm">
                      <div>
                        <h4 class="my-0">체크인 체크아웃</h4>
                        <middle class="text-muted"><%= checkIn %> ~ <%= checkOut %></middle>
                      </div>
                    </li>
                    <li class="list-group-item d-flex justify-content-center lh-sm">
                      <div>
                        <h4 class="my-0">객실 정보</h4>
                        <small class="text-muted"><%= roomName %> </small>
                      </div>                  
                    </li>
                  </ul>
                  </div>
                  
           

            <div class="pay">
               <h4 class="pay">결제 금액</h4> <br>
               <hr class="my-4">
                    
                <div class="row g-3">
                  <div class="col-sm-5">
                    <h6 class="my-0">객실요금</h6>
                    </div>
                  
                    <div class="col-sm-5">
                  <span class="text-muted"></span><br>
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-sm-5">
                    <h6 class="my-0">세금 및 봉사료</h6>
                    </div>
                    <div class="col-sm-5">
                    <span class="text-muted"></span>
                    </div>      
                </div>
    
                <div class="row g-3">
                    <div class="col-sm-5">
                    <h5 class="my-3">총 요금</h5>
                    </div>
                    <div class="col-sm-5">
                    <strong><%= totalPay %></strong>
                    </div>
                </div>
              </div><br>
              
              <div class="add-sub">
                <h4 class="add-sub">추가 요청사항</h4>
                <textarea name="add-sub-1" id="add-sub-1"  rows="10" placeholder="추가 요청사항을 입력해 주세요."></textarea>
              </div><br>


              <div class="info-de">
                
                <h4 class="info-de">공지사항</h4> 
                <hr class="my-4">
                <p>
                  도착 시 프런트 데스크 직원이 도와드립니다.
                  자세한 내용은 예약 확인 메일에 나와 있는 연락처 정보로 숙박시설에 문의해 주시기 바랍니다. 
                  코로나19로,정책 상 체크인 신분증과 백신 여부 확인 증명서를 제시하셔야 합니다. 
                </p>
            </div>
          </div>

        
        <form class="needs-validation" action="<%= request.getContextPath() %>/booking.py" method="post" novalidate="">
        <div class="col-md-7 col-lg-8">

            <div class= "order-info">

            <h4 class="order-1">예약자 정보</h4> <br>
            

            <hr class="my-4">
           
            
            <div class="col-12">
              <img class="mb-2"src="resources/img/star1.png" alt="" width="15px" height="15px">
              <label for="email" class="form-label">이메일</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="html@example.com" value="" required>
              <div class="invalid-feedback">
                이메일을 꼭 입력해주세요.<br><br>
                </div>
            </div>
            <br> 
                  <div class ="row g-3">
                    <div class="col-12">
                      <img class="mb-2"src="resources/img/star1.png" alt="" width="15px" height="15px">
                  <label for="k-Name" class="form-label">한글 이름</label></div>
                  <div class="col-sm-6">
                  <input type="text" class="form-control" id="firstName" placeholder="한글 성" name="name1" value="" required>
                  <div class="invalid-feedback">
                    성을 입력해주세요.<br>
                  </div>
                </div>
                
                

                <div class="col-sm-6">
                  <input type="text" class="form-control" id="lastName" placeholder="한글 이름" name="name2" value="" required>
                  <div class="invalid-feedback">
                    이름을 입력해주세요.<br><br>
                  </div>
                </div>
              </div>
              <br>

              <div class ="row g-3">
            
                <div class="col-12">
                  <img class="mb-2"src="resources/img/star1.png" alt="" width="15px" height="15px">
                    <label for="E-Name" class="form-label">영문 이름</label></div>
                    
                    <div class="col-sm-6">
                    <input type="text" class="form-control" id="E-firstName" placeholder="영문 성" name="eng1" value="" required>
                    <div class="invalid-feedback">
                    영문 성을 입력해주세요.<br>
                    </div>
                </div>
        
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="E-lastName" placeholder="영문 이름" name="eng2" value="" required>
                    <div class="invalid-feedback">
                    영문 이름을 입력해주세요<br><br>
                    </div>
                </div>
              </div>

                <br>
                  <div class="col-12">
                    <img class="mb-1"src="resources/img/star1.png" alt="" width="15px" height="15px">
                    <label for="E-Name" class="form-label">휴대폰</label>
                    <input type="text" class="form-control" id="phone" placeholder="숫자만 입력해 주세요" name="phone" value="" required>
                    <div class="invalid-feedback">
                    번호를 입력해주세요. <br>
                    </div>
                </div>
            </div> <br>
           
            <div class="res-info">
                <h4 class="order-2">투숙객 정보</h4> <br>
                <hr class="my-4">

                    <div class="row g-3">
                      <div class="col-12">
                        <img class="mb-2"src="resources/img/star1.png" alt="" width="15px" height="15px">
                      <label for="E-Name" class="form-label">영문 이름</label></div>
                      <div class="col-sm-6">
                      <input type="text" class="form-control" id="E-firstName" placeholder="영문 성" value="" required>
                      <div class="invalid-feedback">
                        영문 성을 입력해주세요. <br>
                      </div>
                    </div>

                    <div class="col-sm-6">
                      <input type="text" class="form-control" id="E-lastName" placeholder="영문 이름" value="" required>
                      <div class="invalid-feedback">
                        영문 이름을 입력해주세요 <br><br>
                      </div>
                    </div>
                 </div>
              </div>

          <div class="event"> 
                    <h4 class="pay">할인 정보</h4> <br>
                    <hr class="my-4">

                        <form class="card p-2">
                              
                              <div class="row g-3">
                                <div class="col-sm-5">
                                <input type="text" class="form-control" placeholder="할인 쿠폰 입력">
                                </div>

                                <div class="col-sm-5">
                                <button type="submit" class="btn btn-secondary">적용</button>
                                </div>
                               </div>
                        </form>
                      </div>
    <br>

        <div class="paypal">

                <h4 class="mb-3">결제 수단</h4><br>

                <hr class="my-4">

        
          
                        <div class="form-check">
                            <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="" required><img class="mb-2"src="resources/img/card.png" alt="" width="25px" height="25px">
                            <label class="form-check-label" for="credit">카드번호</label>
                         </div>
                        
                        <div class="col-12">
                        <img class="mb-2"src="resources/img/star1.png"alt="" width="15px" height="15px">
                      <label for="cc-number" class="form-label">카드 번호</label>
                      <input type="text" class="form-control" id="cc-number" name="cardNumber" placeholder="" required>
                      <div class="invalid-feedback">
                             카드번호 입력해주세요.
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <img class="mb-1"src="resources/img/star1.png" alt="" width="15px" height="15px">
                      <label for="cc-d" class="form-label">카드 유효기간</label>
                      <input type="text" class="form-control" id="cc-d" placeholder="MM(월) / YY(년)" name="cardValidate" required>
                      <div class="invalid-feedback">
                      카드 유효기간을 입력해주세요.
                      </div>
                    </div>
        
                    <div class="col-12">
                      <img class="mb-2"src="resources/img/star1.png"alt="" width="15px" height="15px">
                      <label for="cc-n" class="form-label">카드 비밀번호 (앞 두자리)</label></div>
                      
                      <div class="row g-3">
                       <div class="col-sm-5">
                      <input type="text" class="form-control" id="cc-n" name="cardPwd" placeholder="" required>
                      </div>
                      <div class="col-sm-5">
                      <img class=""src="resources/img/x.png" alt=""  width="50px" height="50px"  >
                      </div>
                      </div>

                     <div class="invalid-feedback">
                        카드 비밀 번호를 입력해주세요
                     </div>
                    
                    <div class="col-12">
                      <div class="cvc">
                      <img class="mb-1"src="resources/img/star1.png" alt="" width="15px" height="15px">
                        <label for="cvc" class="form-label">cvc번호</label>
                        <input type="text" class="form-control" id="cvc" placeholder="카드 뒷면의 번호 3자리" name="cvc" required maxlength="3" width="40">
                        <input type="hidden" name="bookNo" value= <%= bookNo %>> 
                        <div class="invalid-feedback">
                          cvc번호를 입력해주세요
                        </div>
                        </div>
                      </div>

              <br><br>

                <div class="agree">

                  <div class="form-check">
                    <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="" required>
                    <label class="form-check-label" for="agree">전체 약관을 확인하고 결제에 동의합니다</label>
                    
                    <div class="col-12 ps-sm-4">
                    <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="" required>
                    <label class="form-check-label" for="agree">서비스 이용약관(필수) </label></div>
                    
                    <div class="col-12 ps-sm-4">
                      <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="" required>
                      <label class="form-check-label" for="argee">개인정보제3자제공동의(필수)</label></div>
                      
                      <div class="col-12 ps-sm-4">
                        <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="" required>
                        <label class="form-check-label" for="agree">개인정보처리방침(필수)</label></div>
                      
                        <div class="col-12 ps-sm-4">
                          <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="동의하지 않았습니다.">
                          <label class="form-check-label" for="agree">광고성정보수신동의(선택)</label></div>


                  </div>

                </div>
                
  
          

      		<div class="col-md-9">
        	<hr class="my-4">
        	<button class="btn-submit" type="submit" value="">결제하기</button>
        </div>
      </div>
    </form>
    </main>
  </div>
</body>
</html>