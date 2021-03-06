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
	<div id="map" style="height:100%"></div>
    <div class="custom_typecontrol radius_border" style="display:none;">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>
    
	 <form action="${cpath}/SelectFS.do" id="live_form" method="POST" style="display:none;">
	 	<input type="text" name="re_seq" value="${rvo.re_seq}">
	 </form>
	 
	<script>
	//live_lat live_lon을 들고오기 위해 계속 SelectFS.do를 갱신
		
		//출동차량 좌표
		var lat_C = ${rvo.live_lat};
		var lon_C = ${rvo.live_lon};
		
		var	C = new kakao.maps.LatLng(lat_C, lon_C);
		
		var markerPosition_C  = new kakao.maps.LatLng(lat_C, lon_C);  //출동차량위치
		
		var marker_C = new kakao.maps.Marker({
	        position: markerPosition_C,
	        image: markerImage_C
	    });
		
	    marker_C.setMap(map);
	
	//신고 좌표
		var lat_U = ${rvo.re_latitude};
		var lon_U = ${rvo.re_longitude};
	//접수자 좌표(소방서)
		var lat_F = ${fsvo.fs_latitude};
		var lon_F = ${fsvo.fs_longitude};
		
		console.log(lat_C, lon_C);                              /////확인용
		
		//초기 지도 설정
		var container = document.getElementById('map');
		
		var options = {
			center : new kakao.maps.LatLng(lat_U, lon_U),
			level : 3
		};
		var map = new kakao.maps.Map(container, options);

		var U = new kakao.maps.LatLng(lat_U, lon_U),
	  		F = new kakao.maps.LatLng(lat_F, lon_F);
		
	
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
		
	//마커 이미지 - 출동차량
		var imageSrc_C = "resources/images/firecar.png",   
		    imageSize_C = new kakao.maps.Size(40, 40);
		var markerImage_C = new kakao.maps.MarkerImage(imageSrc_C, imageSize_C);
		
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
	    
	    var lat_C = ${rvo.live_lat};
		var lon_C = ${rvo.live_lon};
		
		var	C = new kakao.maps.LatLng(lat_C, lon_C);
		
		var markerPosition_C  = new kakao.maps.LatLng(lat_C, lon_C);  //출동차량위치
		
		var marker_C = new kakao.maps.Marker({
	        position: markerPosition_C,
	        image: markerImage_C
	    });
		
	    marker_C.setMap(map);
	    
	    
	// 지도 범위를 마커가 다 보이게 설정하기
	// 지도범위를 재설정할 변수
		var bounds = new kakao.maps.LatLngBounds(U,C);  
	
	// bounds를 지도에 설정
	    map.setBounds(bounds);
	   
	
	setInterval(set,5000);
	
	if(lat_C == lat_U || lon_C == lon_U){
		
	}
	
	
	// 지도타입 함수
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'btn';
	    } else {
	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'btn';
	    }
	}
	
	// 출동차량 좌표 계속 찍히게 새로고침에 들어가는 함수
	function set(){
		
		//출동차량 좌표
		lat_C = ${rvo.live_lat};
		lon_C = ${rvo.live_lon};
		
		C = new kakao.maps.LatLng(lat_C, lon_C);
		
		markerPosition_C  = new kakao.maps.LatLng(lat_C, lon_C);  //출동차량위치
		
		marker_C = new kakao.maps.Marker({
	        position: markerPosition_C,
	        image: markerImage_C
	    });
		
	    marker_C.setMap(map);
	    
		document.getElementById("live_form").submit();
		
	};
 	</script>


</body>
</html>