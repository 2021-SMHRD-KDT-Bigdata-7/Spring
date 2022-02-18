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
	
	<script>
	//초기 지도
		var container = document.getElementById('map');

		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 1
		};
		var map = new kakao.maps.Map(container, options);
		
	//초기 변수
		var lat_U = null;
		var lon_U = null;
		
		var lat2_F = null;
		var lon2_F = null;
		
	//위성지도로 변환
		map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
	
		var makerPosition_U = new kakao.maps.LatLng(lat1, lon1)
		var makerPosition_F = new kakao.maps.LatLng(lat2, lon2)
		
		// 신고자 위치마커
		new marker_U = new kakao.maps.Marker({
			map : map;
			position : makerPosition_U
		});
		marker_U.setMap(map);
		// 소방서 위치마커
		new marker_F = new kakao.maps.Marker({
			map : map;
			position : makerPosition_F
		});
		
		marker_F.setMap(map);
		
	</script>

</body>
</html>