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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509"></script>

</head>
<body style="background-color: #F2F2F2">
<div id="select-form">
	<table>
		<tr>
			<td style="font-family: 'SBAggroL'">차량을 선택하면 진입불가지역을 확인할 수 있습니다.</td>
		</tr>
		<tr>
			<td>
			<select class="select" name="car_type">
				  <option selected disabled>차량을 선택해주세요.</option>
				  <option value="mini">소형 소방펌프차</option>
				  <option value="middle">중형 소방펌프차</option>
				  <option value="large">대형 소방펌프차</option>
				  <option value="18m">18m 굴절차</option>
				  <option value="27m">27m 굴절차</option>
				  <option value="35m">35m 굴절차</option>
				  <option value="61.5m">61.5m 고가사다리차</option>
				  <option value="32m">32m 고가사다리차</option>
				  <option value="46m">46m 고가사다리차</option>
				  <option value="52m">52m 고가사다리차</option>
				  <option value="ambulance">구급차</option>
			</select>
			</td>
		</tr>
	</table>
	</div>
	<div id="map"></div>
    <div id="select-form" style="padding-top: 5%;">
    <button id="btn-report-list">처리완료</button>
    </div>
    <div class="custom_typecontrol radius_border" style="display:none;">
        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
    </div>
	<form id="live_form" action="${cpath}/UpdateMap.do?m_id=${mvo.m_id}&re_seq=${rvo.re_seq}" method="POST" style="display:none;">
	  <input type="text" name="live_lat" id="live_lat">
	  <input type="text" name="live_lon" id="live_lon">
	</form>
	 
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
		//페이지 시작 시 현재 위치
		navigator.geolocation.getCurrentPosition(function(position) {
				 	var lat = position.coords.latitude; // 위도
			        var	lon = position.coords.longitude; // 경도
			        console.log(lat,lon);
			        
			     // 마커표시해줄 좌표
				    var locPosition = new kakao.maps.LatLng(lat, lon);
			     
			        displayMarker(locPosition);
					
		
		/////////// 차량 실시간 위치 DB에 넣게 하기 함수  
			    	var live_lat = document.getElementById("live_lat");
			        var live_lon = document.getElementById("live_lon");
			        console.log(typeof live_lat.value); //string
			        live_lat.value = lat;
			        live_lon.value = lon;
			        console.log(live_lat.value);
			        console.log(live_lon.value);
			        
		});
		function set(){
			document.getElementById("live_form").submit();
		};
		setInterval(set,5000);
	
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

 	</script>


</body>
</html>