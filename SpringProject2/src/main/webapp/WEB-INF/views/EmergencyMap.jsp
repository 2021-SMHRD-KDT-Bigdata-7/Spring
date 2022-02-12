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
	var container = document.getElementById('map');
	
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);

	map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); //위성지도로 변환
	
//	if (navigator.geolocation) { // geolocation이 된다면
	var content = null;
	    // 현재 위치 가져오기
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude; // 위도
        var lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon);  // 위경도를 저장
        
        
        
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(lat, lon)  // 위경도에 마커표시
        });
       
        map.setCenter(locPosition);  // 지도 위치 이동  
        
        // 지도 클릭 시 마커 표시
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	        
		  	var latlng = mouseEvent.latLng;  // 클릭한 위도, 경도 
		  	
		  	marker.setPosition(latlng);  // 마커 표시
		  	   	  
			// 좌표를 주소로 나타내기		  
		  	var geocoder = new kakao.maps.services.Geocoder();
		
		  	var coord = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
		  	var callback = function(result, status) {
		  	    if (status === kakao.maps.services.Status.OK) {
		  	        console.log(result[0].address.address_name);
		  	        
		  	        infowindow = new kakao.maps.InfoWindow({
			  	        position: new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()),
		  	        });
		  	        
				  	infowindow.setContent(result[0].address.address_name);
		            infowindow.open(map, marker);
		            
		  	    } 
		  	};
		  	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		  	
///////////// 확인용
        console.log(lat,lon);
        console.log(latlng.getLat(), latlng.getLng());
  	 });
  	 });
      
</script>
</body>
</html>