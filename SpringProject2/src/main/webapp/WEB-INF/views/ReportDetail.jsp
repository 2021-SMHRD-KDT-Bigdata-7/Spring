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
<title>불이야-신고접수</title>
</head>
<body>
<div class="top"></div>
	<form id="form-report-info" action="" method="POST">
		<h2>신고인 정보</h2>
		<table id="tbl-report">
			<tr>
				<td id="tbl-title">이름</td>
				<td id="tbl-content">${mvo.m_name}</td>
			</tr>
			<tr>
				<td id="tbl-title">번호</td>
				<td id="tbl-content">${mvo.m_phone}</td>
			</tr>
		</table>

		<h2>신고내용</h2>
		<table id="tbl-report">
			<tr>
				<td id="tbl-title">유형</td>
				<td id="tbl-content">${rvo.re_type}</td>
			</tr>
			<tr>
				<td id="tbl-title">장소</td>
				<td id="tbl-content">${rvo.re_loc}</td>
			</tr>
			<tr>
				<td id="tbl-title">내용</td>
				<td id="tbl-content">${rvo.re_content}</td>
			</tr>

			<tr align="center">
				<td colspan="2">
						<button id="btn-detail">전화하기</button>
						<button id="btn-detail" onclick="location.href = 'ReportMap.do'">신고접수</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>