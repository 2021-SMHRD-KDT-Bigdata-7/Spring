<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul>
			<li>로그인 정보</li>
			<li><a href="/Logout">로그아웃</a></li>
		</ul>
	</div>

	<div>
		<table>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>연락처</td>
			</tr>
			<c:forEach var="mvo" items="${mlist}">
				<tr>
					<td>${mvo.m_id}</td>
					<td>${mvo.m_name}</td>
					<td>${mvo.m_phone}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div>
		<ul>
			<li>알림설정</li>
		</ul>
		<table>
			<tr>
				<td>
				     <input type="radio" name="notice" value="reception" checked> 수신함 
					 <input type="radio" name="notice" value="noreception" checked> 수신하지 않음 
					
				</td>
				<td ><button onclick="goDelete(${vo.idx})">삭제</button></td>
			</tr>
		</table>
	</div>
</body>
</html>