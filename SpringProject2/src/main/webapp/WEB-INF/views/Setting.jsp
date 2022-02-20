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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>불이야-설정</title>
 <script type="text/javascript">
 
	function goForm(){
          if($(".rform").css("display")=="block"){
               $(".rform").slideUp();
          }
          else{
               $(".rform").slideDown();
          }
       };
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
			<table>			
				  <tr>
				  	<td>
				 		<button type="button" id="slideU" onClick='goForm()'>회원정보수정</button>
				 	</td>
				  </tr>
			</table>
	<div class="rform" style="display : none" >
		<form action="${cpath}/UserInfoUpdate.do?m_id=${mvo.m_id}" id="frm" method="post">
			<table>
				<tr>
					<td id="cng-title">비밀번호</td>
					<td>
						<input type="password" id="pw" name="m_pw">
					</td>
				</tr>
				<tr>
					<td id="cng-title">이름</td>
					<td>
						<input type="text" id="name" name="m_name">
					</td>
				</tr>
				<tr>
					<td id="cng-title">전화번호</td>
					<td>
						<input type="text" id="phone" name="m_phone">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right">
						<button type="submit" id="slideD">수정</button>
					</td>
					<td>
					
					</td>
				</tr>
			</table>
      </form>
      </div>
			

			<%-- <form action="${cpath}/Logout.do" method="post" style="width: 100%; text-align: right;">
				<button onclick = "location.href ='Logout.do'">로그아웃</button> --%>

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
	<form action="${cpath}/Logout.do" method="GET" style="margin-top:5%;">
				<a href="${cpath}/Logout.do">로그아웃</a>
	</form>
 		
</body>
</html>