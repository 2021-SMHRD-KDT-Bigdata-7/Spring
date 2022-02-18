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
<title>불이야-지도보기</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=104f90e3976f1820f120da408f94509c&libraries=LIBRARY"></script>
</head>
<body style="background-color: #F2F2F2">
	
	<div id="select-form">
	<table>
		<tr>
			<td>
				<p class="return-text" onclick="location.href='Main.do'">< 뒤로가기</p>
			</td>
		</tr>
		<tr>
			<td>
			<select class="select" name="car_type">
				  <option selected disabled>차량을 선택해주세요.</option>
				  <option value="">차량1</option>
				  <option value="">차량2</option>
				  <option value="">차량3</option>
				  <option value="">차량4</option>
				  <option value="">차량5</option>
				  <option value="">차량6</option>
			</select>
			</td>
		</tr>
		<tr>
			<td style="font-family: 'SBAggroM'">차량을 선택하면 진입불가지역을 확인할 수 있습니다.</td>
		</tr>
	</table>
	</div>
	<div id="map"></div>
	${fsvo.fs_latitude}
	${fsvo.fs_longitude}
	${mvo.m_id}
	<script>
	//초기 지도
		var container = document.getElementById('map');
		var lat = ${fsvo.fs_latitude}
		var lon = ${fsvo.fs_longitude}
		var options = {
			center : new kakao.maps.LatLng(lat, lon),
			level : 3
		};
		var map = new kakao.maps.Map(container, options);
	//초기 변수
	//위성지도로 변환
		map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
	
		var makerPosition = new kakao.maps.LatLng(lat, lon)

		var marker = new kakao.maps.Marker({
			map : map,
			position : makerPosition

			});
						
	</script>
	
</body>
</html>