<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>불이야-로그인</title>
</head>
<body>

	<header> <h2>Login</h2> </header> 
	<form action="" method="POST"> 
	<div class="input-box"> 
	<input id="username" type="text" name="username" placeholder="아이디"> 
	<label for="username">아이디</label> 
	</div> 
	<div class="input-box"> 
	<input id="password" type="password" name="password" placeholder="비밀번호"> 
	<label for="password">비밀번호</label> </div> 
	<input type="submit" value="로그인"> </form>

</body>
</html>