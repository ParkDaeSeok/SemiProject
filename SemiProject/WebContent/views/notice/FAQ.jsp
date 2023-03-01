<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>FAQ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="../common/css/icomoon.css">
    <link rel="stylesheet" href="../common/css/style_htk.css">

  
      
   <style>
    
    html, body{
  margin: 0;
  padding: 0;
    }
    .item{
      margin: 20px;
      text-indent: 20px;
      padding: 20px 0;
      border: 1px solid black;
      border-radius: 10px;  
    }
    .icon{
      font-size: 16px;
      font-weight: bolder;
    }
    #imgText{
      position: absolute;
      z-index: 1;
      color: white;
      font-size: 25px;
      left: 100px;
      top: 280px;

    }
     
     #wrap {
          width: 100%;
          float: left; 
     }
   
     #top {
       background: lightgreen;
         width: 100%;
         text-align: center;
         height: 50px;
         position: relative;
     }
     #info {
       width: 100%;
         height: 400px;
         float: left;
         position: relative;
         background: lightpink;
     }

     #info > img {
       background: lightsalmon;
         height: 100%;
         width: 100%;
     }
     
     #content {
      width: 80%;
      position: relative;
      text-align: left;
      height: 70px;
      left: 15px;
      font-size: 30px;
      font-weight: 900;
      
     }
    
     .container{
      float: left;
      position: relative; 
      left: 14%;
      width: 80%;
      height: 100%;
      
      
     }
     
     #value {
      
      background-position: 5px center;
      padding-left: 40px;
      border: 1px solid #2e3238;
      width: 100%;
      height: 30px;
      box-sizing: border-box;
      outline: none;
      border-radius: 3px;
      position: relative;
      top: -22px;
      
      
     }

     #title{
       font-size: 23px;
       font-weight: 1000;
       margin: auto;
      position: relative;
      left: 16px;
     }
     #bottom{
       float: left;
       height: 350px;
       position: relative;       
       background: #2e3238; 
       width: 100%;
     }


     #footer {
     background: black;
      display: flex;
      width: 98%;
      height: 300px;
      min-width: 300px;
      margin: auto;
      float: right;
      position: relative;
      left: 30px;
      color: white;
         
     }

     #first {
         float: left;
         width: 30%;
         min-width: 200px;
         height: 250px;
         margin: auto;
         
     }

     #second {
         float: left;
         width: 10%;
         height: 250px;
         min-width: 150px;
         margin: auto;
     }

     #third {
         float: left;
         width: 15%;
         min-width: 150px;
         height: 250px;
         margin: auto;
     }

     #fourth{
         float: left;
         width: 25%;
         min-width: 200px;
         height: 250px;
         margin: auto;
     }

     #footcenter{
        background: black;
         float: left;
         text-align: center;
         position: relative;
          width: 100%;
         margin: auto;   
     }
     .direct{
       float: right;
       width: 30px;
       height: 30px;
       position: relative;
       right: 15px;
       top: -5px;
     }
     .item:hover{
       cursor: pointer;
      
     }
     .sample {
       display: none;
       width: 90%;
       position: relative;
       left: 20px;
       top: 15px;
       font-size: 13px;
     }

     .ftco-footer{
       float: left;
     }
     
     #navbar-logo {
      margin-left: 10% !important;
      
    }
    
 </style>
  </head>
  <body>
 <%@ include file="../common/topbar.jsp" %>
 
    <div id="left"></div>
    <div id="wrap">
      
       
        <div id="imgText"><h1 style="color:blanchedalmond">무엇을 도와드릴까요?</h1></div>
        <div id="info">
            <img src="../../resources/img/FNA화면.jpg";>
            
        </div>
      
        <form>
        <div id="anoQ">
          <form action="">
            <div class="container">
              <div id="content">자주 묻는 질문 (FAQ)</div>
                <div class="mat" id="title" >호텔</div>
               
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon click">예약을 변경/취소하고 싶어요. <img class="direct" src="../../resources/img/FNA버튼.png"></span>
                 <div class="sample" id="sample">HTML에서는 다양한 예약 사이트의 가격을 비교하고 최저가를 찾습니다. 원하는 최저가를 선택하면 예약 사이트로 이동하여 예약을 완료합니다. <br>
                    실제 예약은 예약 사이트와 연결되어 있기 때문에 HTML에서는 예약 및 결제에 관여하지 않습니다. <br>
                    따라서, 예약 변경 및 취소에 관한 문의는 예약하신 예약 사이트의 고객 센터로 연락하시기 바랍니다. <br>
                     업체명이 기억나지 않는 경우, 예약 시 사용한 신용카드 명세서에서 결제를 청구한 업체명을 확인하실 수 있습니다.
                    <br><br>
                    </div>
                </div>
              
           </form>
                
              
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon click">검색 결과에서 상품을 선택하면 가격이 올랐다고 뜨는데 왜 그런 거죠? <img class="direct" src="../../resources/img/FNA버튼.png"></span>
                  <div class="sample" id="sample">수백 개의 다른 여행 사이트를 한 번에 검색하기 때문에, 
                    간혹 해당 사이트로부터 전달받는 정보의 정확성 문제가 발생할 수 있습니다. <br>
                    이러한 문제는 해당 사이트에서 최신 재고 정보를 저희 측과 공유하지 않거나,
                     잘못된 정보를 전달하는 경우, 또는 다른 사용자가 마지막 상품을 예약한 경우에 발생할 수 있습니다.
                    <br><br>
                    </div>
                </div>
               

               
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon click">HTML의 환불 정책을 알려주세요. <img class="direct" src="../../resources/img/FNA버튼.png"> </span>
                  <div class="sample" id="sample">HTML은 판매 업체가 아닌 검색 엔진으로 별도의 환불 정책이 없으며
                     최종 예약을 진행한 예약 업체의 환불 정책이 적용됩니다.<br>
                     예약 업체가 기억이 안 날 경우에는 신용카드 명세서를 확인하거나 예약 확인에서 예약 업체 정보를 확인하세요.
                    <br><br>
                    </div>
                </div>
           

               
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon click">가격 알리미는 어떻게 생성하나요? <img class="direct" src="../../resources/img/FNA버튼.png"> </span>
                  <div class="sample" id="sample">웹사이트 이용 시, 고객님 계정으로 로그인한 다음 가격 알리미 페이지를 방문하거나,
                     항공권 검색 결과 페이지 왼쪽의 "가격 추적" 버튼을 클릭하시면 생성하실 수 있답니다.<br>
                      호텔을 검색 중이시라면, 호텔 결과 목록 우측 상단의 "가격 알리미" 버튼을 선택하세요. <br>
                     앱을 사용하시는 경우에는, 앱 내 내비게이션 메뉴를 통해 가격 알리미 페이지로 가셔서 사용설명을 따라주시면 돼요.
                    <br><br>
                    </div>
                </div>
            
        
              
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon">호텔 등급 출처는 어디인가요? <img class="direct" src="../../resources/img/FNA버튼.png"> </span>
                  <div class="sample" id="sample">각 호텔명 우측에 별등급 또는 원형등급으로 호텔 등급이 안내되어 있습니다.<br>
                     별 등급은 관광공사에서 자체 등급 평가 기준에 따라 공식적으로 부여한 등급이며,
                     원형 등급은 저희 공급사들의 평균 성급으로 표시됩니다.
                    <br><br>
                    </div>
                </div>
             

              
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon">호텔 후기 평점은 믿을 만 한가요? 숙박 후기는 누가 작성하나요? <img class="direct" src="../../resources/img/FNA버튼.png"> </span>
                  <div class="sample" id="sample">HTML에서는 각 예약 사이트들의 실제 후기를 취합하여 보여드리고 있습니다.<br>
                     이는 검증된 투숙객에 의해 작성된 후기로 신뢰하여 참고하실 수 있습니다. <br>
                     더 자세한 후기는 각 예약 사이트에 들어가시면 확인 가능하며,
                     투숙하신 호텔에 대한 후기를 남기고 싶으실 경우, 실제로 예약인 진행된 사이트에 접속하신 후 기재 부탁드립니다.
                    <br><br>
                    </div>
                </div>
            
        
         
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon">"주변 날짜 포함 일정"이 뭔지 알려주세요. <img class="direct" src="../../resources/img/FNA버튼.png"> </span>
                  <div class="sample" id="sample">여행을 계획하다 보면 일정이 확정되지 않는 경우가 종종 있습니다.<br>
                     여행 날짜에 여유를 두고 검색을 원하시면 "+/- 일정" 선택 시, 원하시는 날짜로부터 전후 최대
                      3일까지 포함된 항공권 검색이 가능합니다.<br>
                       이렇게 하면 하루 이틀 일찍 출발 시 더 저렴한 항공권을 발견할 수도 있습니다.<br>
                     또한 "주말" 또는 "월 단위" 검색 옵션을 선택하여 검색 범위를 넓히고 가장 저렴한 가격을 찾을 수 있습니다.
                    <br><br>
                    </div>
                </div>
         

                <div class="mat" id="title" >계정</div>
        
            
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon">HTML 계정의 이메일 주소를 변경하고 싶습니다. <img class="direct" src="../../resources/img/FNA버튼.png"></span>
                  <div class="sample" id="sample">계정 페이지에서 개인 정보를 수정하실 수 있답니다.
                    <br><br>
                    </div>
                </div>
             
        
            
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon">비밀번호 재설정을 하고 싶습니다. <img class="direct" src="../../resources/img/FNA버튼.png"></span>
                  <div class="sample" id="sample">로그인 시 이메일 주소를 입력하신 후, 우측 하단의 '비밀번호 찾기'를 클릭해 주십시오.<br>
                     계정에 연결된 이메일 주소를 입력해 주시면 비밀번호 재설정을 위한 링크를 보내드립니다.
                    <br><br>
                    </div>
                </div>
          
        
           
                <div class="item down" id="item" onclick="dispaly(this);">
                  <span class="icon">이메일 그만 수신하고 싶습니다. <img class="direct" src="../../resources/img/FNA버튼.png"></span>
                  <div class="sample" id="sample">이메일 수신 정보 변경은 가격 알리미 페이지에서 하실 수 있습니다.<br>
                     계정 삭제를 원하시면 계정 관리 페이지를 방문해주세요.
                    <br><br>
                    </div>
                </div>
                  

              

       
        

    </div>
   
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


 <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.0/../js/swiper.min.js"></script>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>



  <script type="text/javascript">


 $(function () {
     var angle = 0;
     $(".down").click(function(){
         if($(this).children()[1].style.display != 'none') {
          angle = 180;
        } else {
          angle = 0;
        }
        $(this).find("img.direct").css({'transform': 'rotate('+angle+'deg)'},1000);
     });
 });

//  <div class="item down" id="item" onclick="dispaly(this);">
//                   <span class="icon click">예약을 변경/취소하고 싶어요. <img class="direct" src="../../resources/img/FNA버튼.png"></span>
//                  <div class="sample" id="sample">KAYAK에서는 다양한 예약 사이트의 가격을 비교하고 최저가를 찾습니다. 원하는 최저가를 선택하면 예약 사이트로 이동하여 예약을 완료합니다. <br>
//                     실제 예약은 예약 사이트와 연결되어 있기 때문에 KAYAK에서는 예약 및 결제에 관여하지 않습니다. <br>
//                     따라서, 예약 변경 및 취소에 관한 문의는 예약하신 예약 사이트의 고객 센터로 연락하시기 바랍니다. <br>
//                      업체명이 기억나지 않는 경우, 예약 시 사용한 신용카드 명세서에서 결제를 청구한 업체명을 확인하실 수 있습니다.
//                     <br><br>
//                     </div>
//                 </div>



 function dispaly(id){
 var sample = id.childNodes;
 if(sample[3].style.display=='block'){
   sample[3].style.display = 'none';
 }else{
   sample[3].style.display = 'block';
 }
}


</script>


  <script src="../common/js/jquery.min.js"></script>
  <script src="../common/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../common/js/popper.min.js"></script>
  <script src="../common/js/bootstrap.min.js"></script>
  <script src="../common/js/jquery.easing.1.3.js"></script>
  <script src="../common/js/jquery.waypoints.min.js"></script>
  <script src="../common/js/jquery.stellar.min.js"></script>
  <script src="../common/js/owl.carousel.min.js"></script>
  <script src="../common/js/jquery.magnific-popup.min.js"></script>
  <script src="../common/js/aos.js"></script>
  <script src="../common/js/jquery.animateNumber.min.js"></script>
  <script src="../common/js/bootstrap-datepicker.js"></script>
  <script src="../common/js/jquery.timepicker.min.js"></script>
  <script src="../common/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../common/js/google-map.js"></script>
  <script src="../common/js/main.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
    
  </body>
</html>