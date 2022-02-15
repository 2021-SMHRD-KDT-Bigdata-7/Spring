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
	<form action="${cpath}/ReportInsert.do" method="POST">
		<h2>신고인 정보</h2>
		<table border="1px">
		  <tr>
		    <td>이름</td>
		    <td>회원정보에서이름가져오기</td>
		  </tr>
		  <tr>
		    <td>번호</td>
		    <td>회원정보에서번호가져오기</td>
		  </tr>
		</table>

		<h2>신고내용</h2>
		<table border="1px">
		  <tr>
		    <td>유형 </td>
			<td>
			  <select name="re_type">
				  <option selected disabled>선택해주세요.</option>
				  <option value="화재">화재</option>
				  <option value="구조">구조</option>
				  <option value="긴급">긴급</option>
				  <option value="교통사고">교통사고</option>
				  <option value="재해">재해</option>
				  <option value="화재">기타</option>
				 </optgroup>
			  </select>
			</td>
		  </tr>
		  <tr>
		    <td>장소</td>
		    <td>
		      <input type="text" id="loc">로그인하고 m_id 일치하는 report테이블에서 주소 가져오기
		    </td>
		  </tr>
		  <tr>
		    <td>내용</td>
			<td>
	    	  <textarea name="re_content" rows="20" cols="50"></textarea>
			</td>
		  </tr>
		  <tr>
		    <td>파일첨부(컬럼이 없음)</td>
			<td>
			  <input type="file">
			</td>
		  </tr>
		  
		  <tr align="center">
		    <td colspan="2">
		      <input type="submit" value="신고하기" >
		    </td>
		    <td>
		      <a href="/ReportlatDelete.do?m_id=${mvo.m_id}">처음으로</a>
		    </td>
		  </tr>
		</table>
	</form>
	
	

</body>
</html>