<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cpath" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="POST">
		<h2>신고인 정보</h2>
		<table border="1px">
			<tr>
				<td>이름</td>
				<td>${mvo.m_name}</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>${mvo.m_phone}</td>
			</tr>
		</table>

		<h2>신고내용</h2>
		<table border="1px">
			<tr>
				<td>유형</td>
				<td>${rvo.re_type}</td>
			</tr>
			<tr>
				<td>장소</td>
				<td>${rvo.re_loc}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${rvo.re_content}</td>
			</tr>

			<tr align="center">
				<td colspan="2">
					<span>
						<button>전화하기</button>
					</span>
					<span>
						<button type="button" onclick="location.href = 'ReportMap.do'">신고접수</button>
					</span>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>