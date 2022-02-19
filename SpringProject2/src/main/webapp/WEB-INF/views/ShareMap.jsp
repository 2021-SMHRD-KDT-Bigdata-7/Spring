<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL -->
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- context path -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>신고위치</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=LIBRARY"></script>
</head>
<body style="background-color: #F2F2F2">
	<div id="map"></div>
	 ${fsvo.fs_latitude}
	 ${fsvo.fs_longitude}
	 <br>
	 ${rvo.re_latitude}
	 ${rvo.re_longitude}
	 
	<script>
	//신고 좌표
		var lat_U = ${rvo.re_latitude};
		var lon_U = ${rvo.re_longitude};
	//접수자 좌표(소방서)
		var lat_F = ${fsvo.fs_latitude};
		var lon_F = ${fsvo.fs_longitude};
	
	//초기 지도 설정
		var container = document.getElementById('map');
		
		var options = {
			center : new kakao.maps.LatLng(lat_U, lon_U),
			level : 3
		};
		var map = new kakao.maps.Map(container, options);
		
		map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 

		var U = new kakao.maps.LatLng(lat_U, lon_U),
	  		F = new kakao.maps.LatLng(lat_F, lon_F);

	//위성지도로 변환
	
	 // 마커위치
	    var markerPosition_U  = new kakao.maps.LatLng(lat_U, lon_U);  //신고위치
	    var markerPosition_F  = new kakao.maps.LatLng(lat_F, lon_F);  //소방서위치
	 
/*     //마커 이미지 - 신고지점
		var imageSrc_U = "resources/images/user_select.png",   
		    imageSize_U = new kakao.maps.Size(40, 40);
		var markerImage_U = new kakao.maps.MarkerImage(imageSrc_U, imageSize_U); */
		
    //마커 이미지 - 소방서
		var imageSrc_F = "resources/images/logo.png",   
		    imageSize_F = new kakao.maps.Size(50, 40);
		var markerImage_F = new kakao.maps.MarkerImage(imageSrc_F, imageSize_F);
		
    // 마커생성
	    var marker_U = new kakao.maps.Marker({
	        position: markerPosition_U
//          image: markerImage_U 
	    });
	    var marker_F = new kakao.maps.Marker({
	        position: markerPosition_F,
	        image: markerImage_F
	    });

    // 마커표시
	    marker_U.setMap(map);
	    marker_F.setMap(map);
	    
	// 지도 범위를 마커가 다 보이게 설정하기
	// 지도범위를 재설정할 변수
		var bounds = new kakao.maps.LatLngBounds(U,F);  
	
	// bounds를 지도에 설정
	    map.setBounds(bounds);

	
	// 소방차량 위치 실시간으로 나타내기
	// geolocation
	if(navigator.geolocation){
        alert("geolocation가능");
		var nwp = navigator.geolocation.watchPosition(success, error, options);
        console.log(nwp);
	};
	
	function error(){
		console.log("error");
	};
	// watchposition success
	function success(position){
		console.log(nwp);
		console.log(position);
		    var lat = position.coords.latitude; // 위도
	        var	lon = position.coords.longitude; // 경도
		    console.log(lat,lon);
	        
	        // 마커표시해줄 좌표
		    var locPosition = new kakao.maps.LatLng(lat, lon);

	        // 마커표시 함수
	        displayMarker(locPosition);

	};
    
	options = {
			  enableHighAccuracy: false,
			  timeout: 5000,
			  maximumAge: 0
			};
	
	
	function displayMarker(locPosition){
		//마커 이미지 - 출동차량
		var imageSrc = "resources/images/firecar.png",   
		    imageSize = new kakao.maps.Size(40, 40);
		    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		var nwp_marker = new kakao.maps.Marker({  
		    map: map, 
		    position: locPosition,
		    image: markerImage
		}); 
	        nwp_marker.setMap(map);
	}; 
	
	
 	</script>

</body>
</html>