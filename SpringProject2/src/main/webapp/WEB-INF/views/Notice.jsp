<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>타일로드 이벤트 등록하기</title>
    <style>
        * {padding: 0;margin: 0;}
    body, html {height: 100%;}
    .modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
    .dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
    .modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
    .modal-section{background: #ffffff;box-sizing: border-box;display: none;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
    .menu_msg{font-size: 21px;font-weight: 500;}
    .enroll_box p{padding-bottom: 56px;}
    .gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
    .pink_btn {width: 90px;background: #ed197a;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}

        .map_wrap {position:relative;width:100%;height:350px;}
        .title {font-weight:bold;display:block;}
        .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
        #centerAddr {display:block;margin-top:2px;font-weight: normal;}
        .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        .modes {position: absolute;top: 10px;left: 10px;z-index: 1;}
        .getdata{position: absolute;top: 370px;left: 10px;z-index: 1;}
        .confirm{position: absolute;top: 370px;left: 10px;z-index: 1;}
        #map, #drawingMap {width: 100%;height: 350px;}
        #drawingMap {margin-top: 10px;}
    </style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
    <div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
        <!-- <div class="hAddr">
            <span class="title">지도중심기준 행정동 주소정보</span>
            <span id="centerAddr"></span> -->
        </div>
       
           
        <div id="position"></div>   
        <div id="drawingMap"></div>
  
    <p><em>지도 중심좌표가 변경되면 지도 정보가 표출됩니다</em></p>
    <p id="result"></p>
    <p id="result2"></p>
    <div id="confirm">
    <input type ="button" value ="알림창 test" onClick="confirmtest()">
    </div>
    <div class="wrap">
        <section>
            <button type="button" id="confirm">컨펌창</button>
           
        </section>
        
        <!-- confirm 모달을 쓸 페이지에 추가 start-->
        <section class="modal modal-section type-confirm">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn btn_ok">확인</button>
                <button class="btn gray_btn modal_close">취소</button>
            </div>
        </section>
        <!-- confirm 모달을 쓸 페이지에 추가 end-->

        <!-- alert 모달을 쓸 페이지에 추가 start-->
        <section class="modal modal-section type-alert">
            <div class="enroll_box">
                <p class="menu_msg"></p>
            </div>
            <div class="enroll_btn">
                <button class="btn pink_btn modal_close">확인</button>
            </div>
        </section>
        <!-- alert 모달을 쓸 페이지에 추가 end-->
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0de10dc4e85562d90ee728b39421ac4b&libraries=services"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0de10dc4e85562d90ee728b39421ac4b&libraries=drawing"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0de10dc4e85562d90ee728b39421ac4b"></script>
    
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 6 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        
   var lat;
   var lon;
   var radius = 500;
//    var lat9 = JSON.parse(localStorage.getItem("lat9"));
//    var lon9 = JSON.parse(localStorage.getItem("lon9"));
//    console.log(lat9, lon9);
    
//     var kkk =[];
//     kkk.unshift([lat9, lon9]);
//     console.log(kkk[0][0]);
    var kkk = [
    // [35.10786310217308,126.87974978652008,'광주송하우편취급국'],
    // [35.10713885766415,126.87661382221772,'압하마을회관'],
    // [35.10318305645031,126.86916147614886,'빛여울초등학교'],
    [35.10279891807466,126.88127081478315,'광주인성고']
    ]
    // console.log(kkk.length);
    // * 현재 위치를 알려주는 geolocation * 
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
             lat = position.coords.latitude, // 위도
             lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition);
                
        });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition) {

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);  
          
    }       
        
         var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // // 인포윈도우를 생성합니다
        
         var infowindow = new kakao.maps.InfoWindow({
             zindex:1,              // 주소를 표시할 인포윈도우입니다
             content : iwContent,
             removable : iwRemoveable
         });

         var circle = new kakao.maps.Circle({
        center :  new kakao.maps.LatLng(lat,lon),  // 원의 중심좌표 입니다 
        radius: radius, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 5, // 선의 두께입니다 
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'dashed', // 선의 스타일 입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.7,  // 채우기 불투명도 입니다   
        
         }); 





         
         
    
         var geocoder = new kakao.maps.services.Geocoder();
   

    // }
    var marker1;
    var dist;
    var lat1;
    var lng1;
    var markerarr = [];
    var polyarr = [];
    // * 중심좌표값 가져오기 *
    // 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'tilesloaded', function() {

        // 지도의  레벨을 얻어옵니다
        var level = map.getLevel();

        // 지도의 중심좌표를 얻어옵니다 
        var latlng = map.getCenter(); 

        var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
        message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
        
      
        // 마커의 위치를 지도중심으로 설정합니다 
        marker.setPosition(map.getCenter()); 
        marker.setMap(map); 
        
        circle.setPosition(map.getCenter()); 
        circle.setMap(map);

      
        for (var i = 0; i < kkk.length; i++) {
        var marker1;
              // 지도에 마커를 생성하고 표시한다
            marker1 = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(kkk[i][0], kkk[i][1]), // 마커의 좌표
            // map: map // 마커를 표시할 지도 객체
            });
        var linePath =  [
            new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()),
            new kakao.maps.LatLng(kkk[i][0], kkk[i][1])
            ] ;
        var poly = new kakao.maps.Polyline({
        // map: map, 을 하지 않아도 거리는 구할 수 있다.
            path: linePath,
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다 
        });
       
      
    //    
          dist = poly.getLength(); // m 단위로 리턴
        // console.log(radius);
        if (dist <= radius) {
            // markerarr.unshift(marker1);
            // marker1.setMap(map);
           for(var k = kkk.length-1; k<markerarr.length;k++){
            markerarr[k].setMap(null);
              polyarr[k].setMap(null);

              
            }
            
            markerarr.splice(kkk.length-1,markerarr.length);
            polyarr.splice(kkk.length-1,markerarr.length);
           

            marker1.setMap(map);
            poly.setMap(map);
            markerarr.unshift(marker1);
            polyarr.unshift(poly);
            var contenttest = "주변에 화재가 발생하였습니다!! 해당 위치를 확인하시겠습니까?";
   
        action_popup.confirm(contenttest, function (res) {
            if (res) {
                action_popup.alert("확인창을 눌렀습니다.");
            }
        });
            // for(var m=0;  m<kkk.length-1; m++){
            // if(markerarr[m]!=markerarr[m+1]){
            //     confirmtest();
            // }
           // }
        } else {
            console.log(markerarr.length);
           
            //  marker1.setMap(null);
            // poly.setMap(null);

            for(var k = 0; k<markerarr.length;k++){
            markerarr[k].setMap(null);
              polyarr[k].setMap(null);
            }
            markerarr.splice(0,markerarr.length);
            polyarr.splice(0,markerarr.length);

            // if(markerarr.length > 0){
                
            // for(var m = 0; m < kkk.length; m++){
            //     markerarr.shift(marker1);
            //     polyarr.shift(poly);
            //    markerarr[m].setMap(null);
            //    polyarr[m].setMap(null);
                 
             // console.log(markerarr.length);
               
            //  }
            
            // }
        }
        

   }

    
        // searchAddrFromCoords(map.getCenter(), displayCenterInfo);


        var content ='';
        var callback = function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var detailAddr = !!result[0].road_address ? '<p>도로명주소 : ' + result[0].road_address.address_name + '</p>' : '';
                detailAddr += '<p>지번 주소 : ' + result[0].address.address_name + '</p>';
                
                content = '<p class="bAddr">' +
                                '<span class="title">내 위치 정보</span>' + 
                                detailAddr + 
                            '</p>';

            // content = '<div style="padding:5px;">'+result[0].address.address_name+'</div>';
             infowindow.setContent(content);
            }
        };

         
         infowindow.open(map, marker);
        
         infowindow.setPosition(map.getCenter()); 
         infowindow.setMap(map);
         geocoder.coord2Address(latlng.getLng(), latlng.getLat(), callback);

        
        lat1 = latlng.getLng();
        lng1 = latlng.getLat();
        // * 확인용 *
        // var callback = function(result, status) {
        //     if (status === kakao.maps.services.Status.OK) {
        //         console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
        //     }
        // };

        // geocoder.coord2Address(latlng.getLng(), latlng.getLat(), callback);

        var resultDiv = document.getElementById('result');
        resultDiv.innerHTML = message;


    });
    
    

      

   
    var watchId; 
         function PositionStart() { 
            watchId = navigator.geolocation.watchPosition(MyPosition); 
         } 
         function MyPosition(position) { 
             lat1 = position.coords.latitude; 
             lng1 = position.coords.longitude; 
            document.getElementById("position").innerHTML = "현재 위치 (위도 : " + position.coords.latitude + ", 경도 : " + position.coords.longitude + ")"; 
         } 
         function PositionStop() { 
            navigator.geolocation.clearPosition(watchId); 
         }


    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    // kakao.maps.event.addListener(map, 'idle', function() {
    //     searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    // });

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    // function displayCenterInfo(result, status) {
    //     if (status === kakao.maps.services.Status.OK) {
    //         var infoDiv = document.getElementById('centerAddr');

    //         for(var i = 0; i < result.length; i++) {
    //             // 행정동의 region_type 값은 'H' 이므로
    //             if (result[i].region_type === 'H') {
    //                 infoDiv.innerHTML = result[i].address_name;
    //                 break;
    //             }            }
    //     }    
    // }
    $(function () {
    //사용 예시 **************************
   

    $(".modal_close").on("click", function () {
        action_popup.close(this);
    });
    //사용 예시 **************************
});



/**
 *  alert, confirm 대용 팝업 메소드 정의 <br/>
 *  timer : 애니메이션 동작 속도 <br/>
 *  alert : 경고창 <br/>
 *  confirm : 확인창 <br/>
 *  open : 팝업 열기 <br/>
 *  close : 팝업 닫기 <br/>
 */ 
var action_popup = {
    timer: 500,
    confirm: function (txt, callback) {
        if (txt == null || txt.trim() == "") {
            console.warn("confirm message is empty.");
            return;
        } else if (callback == null || typeof callback != 'function') {
            console.warn("callback is null or not function.");
            return;
        } else {
            $(".type-confirm .btn_ok").on("click", function () {
                $(this).unbind("click");
                callback(true);
                action_popup.close(this);
            });
            this.open("type-confirm", txt);
        }
    },

    alert: function (txt) {
        if (txt == null || txt.trim() == "") {
            console.warn("confirm message is empty.");
            return;
        } else {
            this.open("type-alert", txt);
        }
    },

    open: function (type, txt) {
        var popup = $("." + type);
        popup.find(".menu_msg").text(txt);
        $("body").append("<div class='dimLayer'></div>");
        $(".dimLayer").css('height', $(document).height()).attr("target", type);
        popup.fadeIn(this.timer);
    },

    close: function (target) {
        var modal = $(target).closest(".modal-section");
        var dimLayer;
        if (modal.hasClass("type-confirm")) {
            dimLayer = $(".dimLayer[target=type-confirm]");
            $(".type-confirm .btn_ok").unbind("click");
        } else if (modal.hasClass("type-alert")) {
            dimLayer = $(".dimLayer[target=type-alert]")
        } else {
            console.warn("close unknown target.")
            return;
        }
        modal.fadeOut(this.timer);
        setTimeout(function () {
            dimLayer != null ? dimLayer.remove() : "";
        }, this.timer);
    }
}
</script>
</body>
</html>