<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cpath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>불이야-설정</title>
 <script type="text/javascript">
    
      
      $(document).ready(function(){

    	  $("#slideU").click(function(){

    	    $(".rfm").slideToggle();

    	  });

    	});
      
      /* loadtable();
      //$(".cupdate").click(upClick);  // 태그자체에 스크립트함수를 사용하지 말고(유지보수시 번거로움)
     });                                // 제이쿼리에 함수를 만들어놓자??? - 아래 upClick()
     
     $(function goForm(){
         $("#slideU").("click",function(){
       //     $(".rform").css("display","none");  //글쓰기화면의 rform div의 css를 바꿈
              $(".rform").slideUp();
         })
          $("#slideD").on("click",function(){
       //     $(".rform").css("display","block");  //글쓰기화면의 rform div의 css를 바꿈
              $(".rform").slideDown();
         }
      } */
     
     
   /*   function loadtable(){
         $.ajax({
            url : "${cpath}/UserInfoUpdateAjax.do",
            type : "GET",
            dataType : "json",
            success : table,
            error : function(){ alert("error"); }
         })
      } */
     
    /*  function table(data){
    	 
         var utable="<table class='utable'>";
         
         utable += "<tr>";
         utable += "<td>아이디</td>";
         utable += "<td>비밀번호</td>";
         utable += "<td>이름</td>";
         utable += "<td>전화번호</td>";
         utable += "<tr>";
         utable += "<td>"+${mvo.m_id}+"</td>";
         utable += "<td>"+${mvo.m_pw}+"</td>";
         utable += "<td>"+${mvo.m_name}+"</td>";
         utable += "<td>"+${mvo.m_phone}+"</td>";
         utable += "</tr>";
         utable += "<tr>";
         utable += "<td colspan="2">수정</td>";
         utable += "<td></td>";
         utable += "</tr>";
         $(".utable").html(utable);
     } */
     
    /* function goUpdate(idx){
    	 var m_pw = $("#p"+m_id).text();
         var m_name = $("#n"+m_id).text();
         var m_phone = $("#h"+m_id).text();
         
         
         var newPassword = "<input id='np"+m_id+"' type='text' class='form-control' value='"+password+"'>";
         $("#p"+m_id).html(newPassword);
         
         var newName = "<input id='nn"+m_id+"' type='text class=form-control' value='"+name+"'>";
         $("#n"+m_id).html(newName);
         
         var newPhone = "<input id='nh"+m_id+"' type='text class=form-control' value='"+phone+"'>";
         $("#h"+m_id).html(newPhone);
      
         var newUpdate = "<button class='btn btn-success btn-sm' onClick='update("+m_id+")'>수정하기</button>";
           $("#u"+m_id).html(newUpdate);
      }
     
     function update(m_id){  //m_id, m_name, m_phone
         var m_pw = $("#np"+m_id).val();
         var m_name = $("#nn"+m_id).val();
         var m_phone = $("#nh"+m_id).val();
         
         $.ajax({
            url : "${cpath}/UserInfoUpdate.do",
            type : "POST",
            data : {"m_id" : m_id, "m_name" : m_name, "m_phone" : m_phone},
            success : loadList,
            error : function(){alert("error");}
         });
      } */
     /* $(function(){
         $('#userupdate').on('click',function(){
        	 var m_pw = $("#p"+m_id).text();
             var m_name = $("#n"+m_id).text();
             var m_phone = $("#h"+m_id).text();
             
              var newPassword = "<input id='np"+m_id+"' type='text' value='"+password+"'>";
             $("#p"+m_id).html(newPassword);
             
             var newName = "<input id='nn"+m_id+"' type='text value='"+name+"'>";
             $("#n"+m_id).html(newName);
             
             var newPhone = "<input id='nh"+m_id+"' type='text value='"+phone+"'>";
             $("#h"+m_id).html(newPhone);
          
             var newUpdate = "<button class='btn btn-success btn-sm' onClick='update("+m_id+")'>수정하기</button>";
               $("#u"+m_id).html(newUpdate); 
               
            
         }) */

     </script>
</head>

<body>


	<div id="setting-form">
		
		<!-- 소방 접속  -->
		 세션 확인용 ${mvo.m_type}
		 <p class="return-text" onclick="location.href='Main.do'">< 뒤로가기</p>
		<c:choose>
		<c:when test="${mvo.m_type eq 'F'}">
			<h2>로그인 정보</h2>
				 <table id="tbl-report">
				  <tr>
				    <td id="tbl-title">아이디</td>
				    <td id="tbl-content">${mvo.m_id}</td>
				  </tr>
				  <tr>
				    <td id="tbl-title">센터명</td>
				    <td id="tbl-content">${mvo.m_name}</td>
				  </tr>
				  <%-- <tr>
				    <td id="tbl-title">주소</td>
				    <td id="tbl-content">${}</td>
				  </tr> --%>
				</table> 
			
			<form action="${cpath}/Logout.do" method="GET" style="width: 100%; text-align: right;">
				<a href="${cpath}/Logout.do">로그아웃</a>
			</form>
			<!-- <div>
			<h2>차량등록</h2>
			<form action="Car_Reg.do">
				<table id="tbl-report">
						<tr>
							<td id="tbl-content">
								<select class="select" name=vehicle_name>
									<option value="선택">선택</option>
									<option value="mini">소형 소방펌프차</option>
									<option value="middle">중형 소방펌프차</option>
									<option value="large">대형 소방펌프차</option>
									<option value="18m">18m 굴절차</option>
									<option value="27m">27m 굴절차</option>
									<option value="35m">35m 굴절차</option>
									<option value="61.5m">61.5m 굴절차</option>
									<option value="32m">32m 고가사다리차</option>
									<option value="46m">46m 고가사다리차</option>
									<option value="52m">52m 고가사다리차</option>
								</select>
							</td>
							<td id="tbl-content"><button type="submit" id="btn-select" >등록</button></td>
						</tr>
				</table>
				</form>
			</div> -->
		</c:when>
		<c:otherwise>	
			 
		<%-- 일반 접속 --%> 
		<h2>로그인 정보</h2>
		
		<table id="tbl-report">
			  <tr>
			    <td id="tbl-title">아이디</td>
			    <td id="tbl-content">${mvo.m_id}</td>
			  </tr> 
			  <tr>
			    <td id="tbl-title">이름</td>
			    <td id="tbl-content">${mvo.m_name}</td>
			  </tr>
			  <tr>
			    <td id="tbl-title">전화번호</td>
			    <td id="tbl-content">${mvo.m_phone}</td>
			  </tr>
			</table> 
			
			<div class="rform" >	
			 <button type="button" id="slideU" onClick='goForm()'>회원정보수정</button>
		
		<form id="frm" method="post">
        <div>
          <label for="m_id">아이디</label>
          <div>
            <input type="text" name="m_id"  value="${m_id}" readonly>
          </div>
        </div>
        <div>
          <label for="m_pw">비밀번호</label>
          <div>
            <input type="password" name="m_pw" placeholder="${m_pw}">
          </div>
           </div>
        <div>
          <label for="m_name">이름</label>
          <div>
            <input type="text" name="m_name" placeholder="${m_name}">
          </div>
        </div>
        
        <div>
          <label for="m_phone">전화번호</label>
          <div>
            <input type="text" name="m_phone" placeholder="${m_phone}">
          </div>
        </div>
       
        <div>
          <div>
            <button type="button" id="slideD" onClick="goUpdate()">수정</button>
          </div>
        </div>
      </form>
      </div>
			

			<%-- <form action="${cpath}/Logout.do" method="post" style="width: 100%; text-align: right;">
				<button onclick = "location.href ='Logout.do'">로그아웃</button> --%>

			<form action="${cpath}/Logout.do" method="GET" style="width: 100%; text-align: right;">
				<a href="${cpath}/Logout.do">로그아웃</a>
			</form>
 		
				<div style="text-align: right;">
				</div>
			<h3 style="margin-top: 5%;">
				신고 접수 시 상기 정보가 함께 전송됩니다.
			</h3>
		<div>
		<h2>알림설정</h2>
			<table id="tbl-report">
				<tr>
					<td id="tbl-content">알림 수신 여부</td>
					<td id="tbl-content"><input type="radio" name="radio" id="radio"></td>
				</tr>
			</table>
		</div>
			<h3 style="margin-top: 5%;">
				알림을 설정하면 현재 위치 기준으로<br>긴급상황 알림을 받을 수 있습니다. 
			</h3>
		</c:otherwise>
		</c:choose>
	</div>

</body>
</html>