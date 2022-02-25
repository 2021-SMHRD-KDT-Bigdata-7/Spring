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
<title>불이야-신고위치</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=LIBRARY"></script>
</head>
<body style="background-color: #F2F2F2">
	<div id="map" style="height: 100%;"></div>
	<script>
	//초기 지도
		var container = document.getElementById('map');

		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};
		var map = new kakao.maps.Map(container, options);
		
		// 사고지점 마커
		var markerPosition  = new kakao.maps.LatLng(${m_Lat}, ${m_Lng}); 

		var imageSrc = "resources/images/noticeMap.png",   
	    imageSize = new kakao.maps.Size(30, 30);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    image: markerImage
		});
		
		marker.setMap(map);
	//초기 변수
		var maker = null;
		var lat = null;
		var lon = null;
	//페이지 시작 시 현재 위치
		navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude; // 위도
			lon = position.coords.longitude; // 경도
	//페이지 시작 시 현재위치의 주소
			var geocoder = new kakao.maps.services.Geocoder();
			var coord = new kakao.maps.LatLng(lat, lon);

			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var loc = !!result[0].road_address?result[0].road_address.address_name:result[0].address.address_name;
					console.log(loc);
				}
			};
			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	//현재 위치 마커
			var locPosition = new kakao.maps.LatLng(lat, lon)

			marker = new kakao.maps.Marker({
				map : map,
				position : locPosition

			});
	//현재 위치로 지도 이동
			map.setCenter(new kakao.maps.LatLng(lat, lon));
		});

	</script>

</body>
</html>