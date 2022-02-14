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
<title>Insert title here</title>
</head>

<body>
<h2>로그인 정보</h2>
로그아웃
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
<h2>알림 설정</h2>
      <table>
		<tr>
		  <td>알림수신여부</td>
		  <td>거주지 위치로 알림</td>
		  <td>현재 위치로 알림</td>
		</tr>      
      </table>
</body>
</html>