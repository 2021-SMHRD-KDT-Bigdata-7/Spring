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
   
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/skydash/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript" >

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
//      map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
      
      var makerPosition = new kakao.maps.LatLng(lat, lon)
      
      var marker = new kakao.maps.Marker({
         map : map,
         position : makerPosition
      }); 
   function reset() {
      //초기 지도
      var container = document.getElementById('map');
      var lat = ${fsvo.fs_latitude}
      var lon = ${fsvo.fs_longitude}
      var options = {
         center : new kakao.maps.LatLng(lat, lon),
         level : 3
      };
      map = new kakao.maps.Map(container, options);
   //초기 변수
   //위성지도로 변환
//     map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
   
      var makerPosition = new kakao.maps.LatLng(lat, lon)

      var marker = new kakao.maps.Marker({
         map : map,
         position : makerPosition
      }); 
   }
      // 선을 구성하는 좌표 배열
	

   function car_info(carvalue) {
    	  reset();
      if(carvalue == "mini") {
         var linePath = [
               new kakao.maps.LatLng(35.10923498284929, 126.87798281355532),
               new kakao.maps.LatLng(35.10963871462896, 126.87937756212976) ];
         // 지도에 표시할 선을 생성
         var polyline = new kakao.maps.Polyline({
            path : linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor : '#FF0000', // 선의 색깔입니다
            strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
         });
         polyline.setMap(map);
         
         var linePath2 = [
               new kakao.maps.LatLng(35.11105860935427, 126.8807302094148),
               new kakao.maps.LatLng(35.10933162094814, 126.88189402665219) ];
         // 지도에 표시할 선을 생성
         var polyline = new kakao.maps.Polyline({
            path : linePath2, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor : '#FF0000', // 선의 색깔입니다
            strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
         });
         polyline.setMap(map);
         
         var linePath3 = [
               new kakao.maps.LatLng(35.113678243398425, 126.89740498579245),
               new kakao.maps.LatLng(35.113512558023686, 126.89836030147717) ];
         // 지도에 표시할 선을 생성
         var polyline = new kakao.maps.Polyline({
            path : linePath3, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor : '#FF0000', // 선의 색깔입니다
            strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
         });
         polyline.setMap(map);
         
         var linePath4 = [
               new kakao.maps.LatLng(35.109306910378216, 126.8970137194306),
               new kakao.maps.LatLng(35.10942499625702, 126.89762269356645) ];
         // 지도에 표시할 선을 생성
         var polyline = new kakao.maps.Polyline({
            path : linePath4, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor : '#FF0000', // 선의 색깔입니다
            strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
         });
         polyline.setMap(map);
      }
      // 지도에 선을 표시
      else if(carvalue == "large") {
         var linePath = [
                 new kakao.maps.LatLng(35.10923498284929, 126.87798281355532),
                 new kakao.maps.LatLng(35.10963871462896, 126.87937756212976) ];
           // 지도에 표시할 선을 생성
           var polyline = new kakao.maps.Polyline({
              path : linePath, // 선을 구성하는 좌표배열 입니다
              strokeWeight : 5, // 선의 두께 입니다
              strokeColor : '#FF0000', // 선의 색깔입니다
              strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
              strokeStyle : 'solid' // 선의 스타일입니다
           });
           polyline.setMap(map);
           
           var linePath2 = [
                 new kakao.maps.LatLng(35.11105860935427, 126.8807302094148),
                 new kakao.maps.LatLng(35.10933162094814, 126.88189402665219) ];
           // 지도에 표시할 선을 생성
           var polyline = new kakao.maps.Polyline({
              path : linePath2, // 선을 구성하는 좌표배열 입니다
              strokeWeight : 5, // 선의 두께 입니다
              strokeColor : '#FF0000', // 선의 색깔입니다
              strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
              strokeStyle : 'solid' // 선의 스타일입니다
           });
           polyline.setMap(map);
           
           var linePath3 = [
                 new kakao.maps.LatLng(35.113678243398425, 126.89740498579245),
                 new kakao.maps.LatLng(35.113512558023686, 126.89836030147717) ];
           // 지도에 표시할 선을 생성
           var polyline = new kakao.maps.Polyline({
              path : linePath3, // 선을 구성하는 좌표배열 입니다
              strokeWeight : 5, // 선의 두께 입니다
              strokeColor : '#FF0000', // 선의 색깔입니다
              strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
              strokeStyle : 'solid' // 선의 스타일입니다
           });
           polyline.setMap(map);
           
           var linePath4 = [
               new kakao.maps.LatLng(35.11761684154239, 126.89655234132918),
               new kakao.maps.LatLng(35.117920910284646, 126.89724649986778) ];
           // 지도에 표시할 선을 생성
           var polyline = new kakao.maps.Polyline({
              path : linePath4, // 선을 구성하는 좌표배열 입니다
              strokeWeight : 5, // 선의 두께 입니다
              strokeColor : '#FF0000', // 선의 색깔입니다
              strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
              strokeStyle : 'solid' // 선의 스타일입니다
           });
           polyline.setMap(map);
           
          var linePath5 = [
               new kakao.maps.LatLng(35.109306910378216, 126.8970137194306),
               new kakao.maps.LatLng(35.10942499625702, 126.89762269356645) ];
      // 지도에 표시할 선을 생성
          var polyline = new kakao.maps.Polyline({
            path : linePath5, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor : '#FF0000', // 선의 색깔입니다
            strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
         });
         polyline.setMap(map);
         
         var linePath6 = [
              new kakao.maps.LatLng(35.10876059513533, 126.88487788068146),
              new kakao.maps.LatLng(35.10915778908654, 126.88607653695574) ];
     // 지도에 표시할 선을 생성
         var polyline = new kakao.maps.Polyline({
            path : linePath6, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor : '#FF0000', // 선의 색깔입니다
            strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
         });
         polyline.setMap(map);
         
         var linePath7 = [
              new kakao.maps.LatLng(35.114208449312784, 126.89675024489236),
              new kakao.maps.LatLng(35.11387954359591, 126.89668955343541) ];
     // 지도에 표시할 선을 생성
         var polyline = new kakao.maps.Polyline({
            path : linePath7, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor : '#FF0000', // 선의 색깔입니다
            strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
         });
         polyline.setMap(map);
      }
   }
   
</script>
</head>
<body style="background-color: #F2F2F2">
   <div class="empty">
   <form action="${cpath}/Logout.do" method="GET" style="width: 100%; text-align: right;">
      <a href="${cpath}/Logout.do" style="font-size: 13px;">로그아웃</a>
      <%-- <img src="resources/images/logout.png" onclick="location.href='${cpath}/Logout.do'" style="width:30px"> --%>
   </form>
   </div>
   <div id="select-form">
   <table>
      <tr>
         <td style="font-family: 'SBAggroL'">차량을 선택하면 진입불가지역을 확인할 수 있습니다.</td>
      </tr>
      <tr>
         <td>
         <select class="select" name="car_type" onchange = "car_info(this.value)">
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
   <div id="map">
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
   //위성지도로 변환1
//      map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
      
      var makerPosition = new kakao.maps.LatLng(lat, lon)
      
      var marker = new kakao.maps.Marker({
         map : map,
         position : makerPosition
      }); 
</script>
   </div>
   <button id="btn-report-list" onclick="location.href='${cpath}/ReportTaking.do'">신고현황</button>
   <%-- ${fsvo.fs_latitude}
   ${fsvo.fs_longitude}
   ${mvo.m_id} --%>
   
</body>
</html>