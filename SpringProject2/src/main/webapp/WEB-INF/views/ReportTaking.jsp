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
<title>불이야-신고현황</title>
</head>
<body>
<header><h2>신고 내역</h2></header>
<div class="top"></div>
<div id="setting-form">
  <table id="tbl-report">
	<c:forEach var="rvo" items="${rlist}">
	  <tr onclick="location.href='/spring/ReportDetail.do?re_seq=${rvo.re_seq}'">
	    <td id="report-content">
	    ${rvo.re_seq}
	    ${rvo.re_loc}&nbsp;${rvo.re_type}발생 
	    <br>
	    <span id="report-info">${rvo.re_date}&nbsp;| ${rvo.re_type}</span>
	    <br>
	    </td>
	  </tr>
	</c:forEach>
  </table>
</div>
</body>
</html>