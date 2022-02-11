<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cpath" value="${pageContext.request.contextPath}"/>   
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<title>불이야</title>
</head>
<body>
	<div id = "background">
		<div class="top">
			<img id="setting" src="resources/images/setting2.png">
		</div>
		<div id="symbol">
			<img id="mainlogo" src="resources/images/119.png">
			<div id="title"><p id="title-text">불이야</p></div>
		</div>
		
		<!-- 로그인 전 main -->
		
		<div id="btn-login-main">
			<div class="top"></div>
			<div id="login"><h1 id="login-text">로그인</h1></div>
			<div id="join"><p id="join-text">회원가입</p></div>
		</div>
		
		<!-- 일반 사용자 로그인 후 -->
		
		<!-- <div id="btn-main">
			<div style="height: 50%"></div>
			<img id="report" src="resources/images/report.png">
		</div> -->
		
	</div>
</body>
</html>