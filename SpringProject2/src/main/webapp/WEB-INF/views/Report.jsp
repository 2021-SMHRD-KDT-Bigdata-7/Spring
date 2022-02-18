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
<title>불이야-신고</title>
</head>
<body>
${mvo.m_id}
${re_seq}
	<div class="top"></div>
	<form id="form-report-info" action="${cpath}/ReportInsert.do" method="POST">
	<input type="hidden" name="re_seq" value="${re_seq}">
		<h2>신고인 정보</h2>
		<table id="tbl-report">
		  <tr>
		    <td id="tbl-title">이름</td>
		    <td id="tbl-content">${mvo.m_name}</td>
		  </tr>
		  <tr>
		    <td id="tbl-title">번호</td>
		    <td id="tbl-content">${mvo.m_phone}</td>
		  </tr>
		</table>

		<h2>신고내용</h2>
		<table id="tbl-report">
		  <tr>
		    <td id="tbl-title">유형 </td>
			<td id="tbl-content">
			  <select class="select" name="re_type">
				  <option selected disabled>선택해주세요.</option>
				  <option value="화재">화재</option>
				  <option value="구조">구조</option>
				  <option value="긴급">긴급</option>
				  <option value="교통사고">교통사고</option>
				  <option value="재해">재해</option>
				  <option value="화재">기타</option>
			  </select>
			</td>
		  </tr>
		  <tr>
		    <td id="tbl-title">장소</td>
		    <td id="tbl-content">
		      <input id="report-input" type="text" id="loc" value="${re_loc}" readonly="readonly">
		    </td>
		  </tr>
		  <tr>
		    <td id="tbl-title">내용</td>
			<td id="tbl-content">
	    	  <textarea id="report-textarea" name="re_content" rows="20" cols="50" placeholder="내용 입력"></textarea>
			</td>
		  </tr>
		  <tr>
		    <td id="tbl-title">파일첨부</td><!-- (컬럼이 없음) -->
			<td id="tbl-content">
				<div>
				  <input id="report-input" type="file">
				</div>		  
			</td>
		  </tr>
		  
		  <tr align="center">
		    <td colspan="2">
		      <input id="btn-report" type="submit" value="신고하기" >
		    </td>
		  </tr>
		  <tr>
		  	<td colspan="2">
		      <a class="return-text" href="${cpath}/ReportlatDelete.do?re_seq=${re_seq}">처음으로</a>
		  	</td>
		  </tr>
		</table>
	</form>
	

</body>
</html>