<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- JSTL -->
    <c:set var="cpath" value="${pageContext.request.contextPath}"/> <!-- context path -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고위치</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=LIBRARY"></script>
</head>
<body>

신고위치를 찍어주세요

<div id="map" style="width:900px;height:500px;"></div>
	
<script>

	// 초기 지도 설정
	var container = document.getElementById('map');
	
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 1
	};

	var map = new kakao.maps.Map(container, options);

	map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); //위성지도로 변환
	
	// 현재 위치 가져오기
    navigator.geolocation.getCurrentPosition(function(position) {
    	var latlng = null;
        var lat = position.coords.latitude; // 위도
        var lon = position.coords.longitude; // 경도
        // 초기 위치를 body 내용에 넣기
        document.getElementById("lat").value = lat;
        document.getElementById("lon").value = lon;
        document.getElementById("con").value = "현재위치입니다.";
        
        var locPosition = new kakao.maps.LatLng(lat, lon);  // 위경도를 저장
        
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(lat, lon)  // 위경도에 마커표시
        });
       
        map.setCenter(locPosition);  // 지도 위치 이동  
///////////// 확인용	      
        console.log(latlng);
        // 지도 클릭 시 마커 표시
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	        
		  	latlng = mouseEvent.latLng;  // 클릭한 위도, 경도 
		  	
		  	// 위도 경도를 따로따로 저장
		  	var latlat = latlng.getLat();
		  	var latlon = latlng.getLng();
		  	
		  	marker.setPosition(latlng);  // 마커 표시
		  	   	  
			// 좌표를 주소로 나타내기		  
		  	var geocoder = new kakao.maps.services.Geocoder();
		
		  	var coord = new kakao.maps.LatLng(latlat, latlon);
		  	var callback = function(result, status) {
		  	    if (status === kakao.maps.services.Status.OK) {
		  	        console.log(result[0].address.address_name);
		  	        
		  	        infowindow = new kakao.maps.InfoWindow({
			  	        position: new kakao.maps.LatLng(latlat, latlon),
		  	        });
		  	        
		  	        content = result[0].address.address_name;
		  	        
		  	        // 인포윈도우 표시 
///수정//////////////// *******닫히지 않음 ******
				  	infowindow.setContent(content);
		            infowindow.open(map, marker);
		            // 위치 변경 될 때마다 body안에 내용 바꾸기
		            var tlat = document.getElementById("lat");
		            tlat.value = latlat;
		            var tlon = document.getElementById("lon");
		            tlon.value = latlon;
		            var tcon = document.getElementById("con");
		            tcon.value = content;

/* 		            // Report페이지로 데이터 보내기
//수정////////////////****latlng==null이 안들음*****            
		            if(latlng==null){
///////////// 확인용	
		            	console.log(lat);
		            	console.log(lon);
		            	console.log(latlat);
						var cast = { "lat" : lat, "lon" : lat, "con" : "현재위치입니다."};
			            localStorage.setItem("cast", JSON.stringify(cast));
		            }
		            else{
						var cast = { "lat" : latlat, "lon" : latlon, "con" : content};
			            localStorage.setItem("cast", JSON.stringify(cast));
		            	}
		
///////////// 확인용					
					console.log(cast);
 */		  	    
 
		  	    }; 
		  	};
		  	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		  	
///////////// 확인용
        console.log(lat,lon);
        console.log(latlng.getLat(), latlng.getLng());
  	 });
  	 });
      
</script>

<form action="ReportlatInsert.do" id="form" method="post">
	<input type="text" id="lat" name="lat">
	<input type="text" id="lon" name="lon">
	<input type="text" id="con" name="con">
	<input type="submit" value="다음">
</form>

</body>
</html>