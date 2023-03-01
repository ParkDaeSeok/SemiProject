<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.hotel.model.vo.Map" %>
<% 
	ArrayList<Map> list = (ArrayList<Map>)request.getAttribute("list");
%>
<%-- 박대석 --%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>네이버 지도 api</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식-->
<style>
    #nmap {
        height:550px;
        margin:0 auto;
        width:1000px;
        max-width:100%;
    }
</style>
</head>
<body>
    <!-- 지도가 생성될 div, id 속성값은 nmap -->
    <div id="nmap"></div>
    
    <script type="text/javascript">

        $(function() {
            
            initMap();
            
        });

        function initMap() { 
            var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
            areaArr.push(
            		<% for( Map m : list) { %>
            			{ descript: "<%= m.getDescription() %>" , place:"<%= m.getHotelName() %>", lat: <%= m.getMapY() %>, lng: <%= m.getMapX() %> },
            		<% } %>
            );

            var markers = new Array(); // 마커 정보를 담는 배열
	        var infoWindows = new Array(); // 정보창을 담는 배열
	

            var map = new naver.maps.Map('nmap', {
            center: new naver.maps.LatLng(37.4894379, 127.030103),
            zoom: 13
            });

            for (var i = 0; i < areaArr.length; i++) {
                    var marker = new naver.maps.Marker({
                        map: map,
                        title: areaArr[i].location, // 지역구 이름 
                        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
                    });
                    var infoWindow = new naver.maps.InfoWindow({
                        content: '<div style="width:200px;text-align:center;padding:10px;"><b>' + areaArr[i].place + '</b><br>'+areaArr[i].descript+'</div>'
                    }); // 클릭했을 때 띄워줄 정보 HTML 작성
                   
                    markers.push(marker); // 생성한 마커를 배열에 담는다.
                    infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
                }
                function getClickHandler(seq) {
		
                    return function(e) {  // 마커를 클릭하는 부분
                        var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                            infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다
        
                        if (infoWindow.getMap()) {
                            infoWindow.close();
                        } else {
                            infoWindow.open(map, marker); // 표출
                        }
                    }
                }
            
                for (var i=0, ii=markers.length; i<ii; i++) {
                    console.log(markers[i] , getClickHandler(i));
                    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
                }
        }
    </script>
</body>
</html>