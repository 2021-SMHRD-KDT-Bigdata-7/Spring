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
<header><h2>신고 내역</h2></header>
  <table>
	<c:forEach var="rvo" items="${rlist}">
	  <tr>
	    <td>
	    ${rvo.re_seq}
	    ${rvo.re_loc}&nbsp;${rvo.re_type}발생 
	    <br>
	    ${rvo.re_date}&nbsp;${rvo.re_type}
	    <br>
	    </td>
	    <td>
	      <button value="접수" onclick="location.href='/spring/ReportDetail.do?re_seq=${rvo.re_seq}'">접수</button>
	    </td>
	  </tr>		
	</c:forEach>
  </table>
</body>
</html>