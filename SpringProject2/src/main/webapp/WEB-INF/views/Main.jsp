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
${mvo.m_id}
${mvo.m_type}
<c:set var="m_id" value="${mvo.m_id}"/>
<c:set var="m_type" value="${mvo.m_type}"/>
	<c:choose>
	  <c:when test="${empty m_id}">
	  <div class="top"></div>
	  <div id = "background">
			<div id="symbol">
				<img id="mainlogo" src="resources/images/119.png">
				<div id="title"><p id="title-text">불이야</p></div>
			</div>
			<!-- 로그인 전 main -->
			<div id="btn-submit-main">
				<button onclick="location.href='Login.do'" id="btn-submit">로그인</button>
				<div id="join"><p id="join-text" onclick="location.href='JoinSelect.do'">회원가입</p></div>
			</div>
		</div>
	  </c:when>
	  <%-- 모든 사용자 로그인 시 적용되는 화면 --%>
	  <c:otherwise>
		<div id = "background">
		<%-- 일반 사용자 로그인 후 --%>
			<c:choose>
			  <c:when test="${m_type eq 'U'}">
				<div class="top">
					<a href="${cpath}/Setting.do">
					  <img id="setting" src="resources/images/setting2.png">
					</a>
				</div>
				<div id="symbol">
					<img id="mainlogo" src="resources/images/119.png">
					<div id="title"><p id="title-text">불이야</p></div>
				</div>
				 <div id="btn-main">
					    <a href="${cpath}/ReportMap.do">
							<img id="report" src="resources/images/report.png">  
						</a>
				</div> 
			  </c:when>
		<%-- 소방서 사용자 로그인 후 --%>
			  <c:otherwise>
				<div class="top">
					<a href="${cpath}/Setting.do">
					  <img id="setting" src="resources/images/setting2.png">
					</a>
				</div>
				<div id="symbol">
					<img id="mainlogo" src="resources/images/119.png">
					<div id="title"><p id="title-text">불이야</p></div>
				</div>
				<div id="btn-main">
				  <div style="height: 30%">
					  <div>
					  	<button id="btn-map" onclick="location.href='${cpath}/Map.do'">지도보기</button>
					  </div>
					  <div>
					  	<button id="btn-report-list" onclick="location.href='${cpath}/ReportTaking.do'">신고현황</button>
					  </div>
				  </div>
				</div> 
			  </c:otherwise>
			</c:choose>
		</div>
	  </c:otherwise>
	</c:choose>
</body>
</html>