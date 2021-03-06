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
<title>불이야-로그인</title>
</head>
<body>
<div id="wrap">
<section>
<div class="empty"></div><div class="empty"></div><div class="empty"></div>
	<header> <h2 class="title">Login</h2> </header> 
<div class="empty"></div>
	<form action="${cpath}Login.do" method="POST"> 
		<div class="input-box"> 
			<input id="m_id" type="text" name="m_id" placeholder="아이디"> 
			<label for="m_id">아이디</label> 
		</div> 
		<div class="input-box"> 
			<input id="m_pw" type="password" name="m_pw" placeholder="비밀번호"> 
			<label for="m_pw">비밀번호</label> 
		</div> 
		<div id="btn-login-main">
			<input type="submit" id="btn-submit" value="로그인">
			<div id="join"><p id="join-text" onclick="location.href='JoinSelect.do'">회원가입</p></div>
		</div>
	</form>
</section>
<footer class="footer">
	<img id="logo" onclick="location.href='${cpath}/Main.do'" src="resources/images/header.png">
</footer>
</div>
</body>
</html>