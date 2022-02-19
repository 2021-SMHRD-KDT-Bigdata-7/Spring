<%@page import="kr.spring.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cpath" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>불이야</title>
</head>
<body>
	<div class="empty"></div>
	<div id="symbol">
		<div>
			<img id="img-car" src="resources/images/firecar.png">
			<h1 class="blink">신고 접수 중입니다.</h1>
			<!-- <h1>신고가 접수되었습니다.</h1> -->
		</div>
	</div>
</body>
</html>