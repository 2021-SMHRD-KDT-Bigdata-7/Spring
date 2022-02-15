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

	<div id="report-btn-form">
		<form action="${cpath}/ReportlatInsert.do" id="form-report" method="post">
			<input type="hidden" id="lat" name="re_latitude" readonly="readonly"> 
			<input type="hidden" id="lon" name="re_longitude" readonly="readonly"> 
			<span>- 선택한 주소 -</span><input type="text" id="loc" name="re_loc" readonly="readonly"> 
			<input type="submit" id="btn-report" value="이 위치로 신고하기">
		</form>
	</div>
	
	<script>
	//초기 지도
		var container = document.getElementById('map');

		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 1
		};
		var map = new kakao.maps.Map(container, options);
	//초기 변수
		var maker = null;
		var lat = null;
		var lon = null;
	//위성지도로 변환
		map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
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
	//현재위치의 위도 경도와 주소를 input에 삽입
					document.getElementById("lat").value = lat;
					document.getElementById("lon").value = lon;
					document.getElementById("loc").value = loc;
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
	//지도를 움직이면 위도 경도 주소 변경
			kakao.maps.event.addListener(map, 'center_changed', function() {
						marker.setMap(null);  // 이전 마커 삭제
						latlng = map.getCenter();  // 지도 중심 좌표 저장
						
////////////////////////확인용
						console.log(latlng);
						
						// 지도 중심으로 마커 재설정
						markerPosition = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
						
////////////////////////확인용	
						console.log(latlng.getLat());
						console.log(latlng.getLng());

						marker = new kakao.maps.Marker({
							position : markerPosition
						});

						marker.setMap(map);

						// 마커위치가 이동한 지도 중심좌표를 주소로 재변환
						coord = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
						callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								var loc = !!result[0].road_address?result[0].road_address.address_name:result[0].address.address_name;
								console.log(loc);

								// 재설정 된 좌표와 주소를 input태그 내용 삽입
								document.getElementById("lat").value = latlng.getLat();
								document.getElementById("lon").value = latlng.getLng();
								document.getElementById("loc").value = loc;
							}
						};
						geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
					});
		});
	</script>

</body>
</html>