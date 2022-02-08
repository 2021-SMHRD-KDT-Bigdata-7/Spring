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
  <h2>DB테스트</h2>
  <table>
		<tr>
		  <td>아이디</td>
		  <td>비밀번호</td>
		  <td>이름</td>
		  <td>연락처</td>
		  <td>구분</td>
		  <td>가입일자</td>
		  <td>관리자여부</td>
		</tr>      
		<c:forEach var="mvo" items="${mlist}">
		  <tr>
		    <td>${mvo.m_id}</td>
	  	    <td>${mvo.m_pw}</td>
		    <td>${mvo.m_name}</td>
		    <td>${mvo.m_phone}</td>
		    <td>${mvo.m_type}</td>
		    <td>${mvo.m_joindate}</td>
		    <td>${mvo.admin_yn}</td>
		  </tr>      
		</c:forEach>
      </table>
      
</body>
</html>