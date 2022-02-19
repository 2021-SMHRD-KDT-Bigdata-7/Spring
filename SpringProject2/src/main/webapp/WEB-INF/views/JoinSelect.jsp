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
<title>불이야-회원가입</title>
</head>
<body>
<div id="wrap">
<section>
	<div class="empty"></div>
	<header> <h2 class="title">Join Us</h2> </header>
	<div class="empty"></div>
	<div class="empty"></div>
	<div style="height: 70%;">
		<img id="img-select" src="resources/images/user_select.png" onclick="location.href='Join.do?m_type='+'U'">
		<img id="img-select" src="resources/images/fire_select.png" onclick="location.href='Join.do?m_type='+'F'">
	<div style="height:5%"></div>
		<h3>가입 유형을 선택해주세요.</h3>
		<p>※ 소방서는 심사 후에 회원가입이 결정됩니다.</p>
	</div>
</section>
	<footer class="footer">
		<img id="logo" onclick="location.href='${cpath}/Main.do'" src="resources/images/header.png">
	</footer>
</div>	
</body>
</html>