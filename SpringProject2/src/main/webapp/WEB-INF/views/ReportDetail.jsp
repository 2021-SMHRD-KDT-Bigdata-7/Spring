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
<title>불이야-신고접수</title>
</head>
<body>
<div id="wrap">
<div class="empty"></div>
${mvo.m_id}
<section style="height: auto;">
<p class="return-text" onclick="location.href='ReportTaking.do'">< 뒤로가기</p>
	<form id="form-report-info" action="${cpath}/ShareMap.do?m_id=${mvo.m_id}&re_seq=${rvo.re_seq}" method="POST">
		<input type="hidden" name=live_lat value=${rvo.re_latitude}>
		<input type="hidden" name=live_lon value=${rvo.re_longitude}>
		<h2>신고인 정보</h2>
		<table id="tbl-report">
			<tr>
				<td id="tbl-title">이름</td>
				<td id="tbl-content">${mvo1.m_name}</td>
			</tr>
			<tr>
				<td id="tbl-title">번호</td>
				<td id="tbl-content">${mvo1.m_phone}</td>
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
					<button type="submit" id="btn-report">신고접수</button>
				</td>
			</tr>
		</table>
	</form>
</section>
<footer class="footer">
	<img id="logo" onclick="location.href='${cpath}/Map.do'" src="resources/images/header.png">
</footer>
</div>
</body>
</html>