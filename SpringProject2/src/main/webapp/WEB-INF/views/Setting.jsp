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
</head>

<body>
<div class="top"></div>
	<div id="setting-form">
		
		<!-- 소방 접속  -->
		 세션 확인용 ${mvo.m_type}
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
				  <tr>
				    <td id="tbl-title">번호</td>
				    <td id="tbl-content">${mvo.m_phone}</td>
				  </tr>
				<%-- </c:forEach> --%>
				</table>
			<form action="${cpath}/Logout.do" method="GET" style="width: 100%; text-align: right;">
				<a href="${cpath}/Logout.do">로그아웃</a>
			</form>
			
			<div>
			<h2>차량등록</h2>
				<table id="tbl-report">
					<tr>
						<td id="tbl-content"><select class="select" name=carreg>
								<option value="">차량1</option>
								<option value="">차량2</option>
								<option value="">차량3</option>
						</select></td>
						<td id="tbl-content"><button id="btn-select">등록</button></td>
					</tr>
					<tr>
						<td id="tbl-title" colspan="2"><h3>등록된 차량</h3></td>
					</tr>
					<tr>
						<td id="tbl-content">차량1</td>
						<td id="tbl-content"><button id="btn-select" onclick="goDelete(${vo.idx})">삭제</button></td>
					</tr>
					<tr>
						<td id="tbl-content">차량2</td>
						<td id="tbl-content"><button id="btn-select" onclick="goDelete(${vo.idx})">삭제</button></td>
					</tr>
				</table>
			</div>
		</c:when>
		<c:otherwise>		 
		<%-- 일반 접속 --%> 
		<h2>로그인 정보</h2>
			<table id="tbl-report">
			<%-- <c:forEach var="mvo" items="${mlist}"> --%>
			  <tr>
			    <td id="tbl-title">아이디</td>
			    <td id="tbl-content">${mvo.m_id}</td>
			  </tr>
			  <tr>
			    <td id="tbl-title">이름</td>
			    <td id="tbl-content">${mvo.m_name}</td>
			  </tr>
			  <tr>
			    <td id="tbl-title">번호</td>
			    <td id="tbl-content">${mvo.m_phone}</td>
			  </tr>
			<%-- </c:forEach> --%>
			</table>
		
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
		</c:otherwise>
		</c:choose>
			<h3 style="margin-top: 5%;">
				알림을 설정하면 현재 위치 기준으로<br>긴급상황 알림을 받을 수 있습니다. 
			</h3>
	</div>

</body>
</html>