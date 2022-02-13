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
	<form action="ReportController" method="POST">
		<table border="1px">
		  <tr>
		    <td>신고자유형 *</td>
		    <td>
			  <input type="radio" name="m_type" checked="checked" value="1">나    <!-- 현재위치신고자 -->
			  <input type="radio" name="m_type" value="2">다른곳                                       <!-- 특정위치신고자 -->
			</td>
		  </tr>
		  <tr>
		    <td>신고유형 *</td>
			<td>
			  <select>
			    <optgroup label="선택해주세요">
				  <option>선택</option>
				  <option>화재</option>
				  <option>구조</option>
				  <option>긴급</option>
				  <option>교통사고</option>
				  <option>재해</option>
				  <option>기타</option>
				 </optgroup>
			  </select>
			</td>
		  </tr>
		  <tr>
		    <td>신고내용</td>
			<td>
	    	  <textarea rows="20" cols="50"></textarea>
			</td>
		  </tr>
		  <tr align="center">
		    <td colspan="2">
		      <input type="submit" value="신고접수" >
		    </td>
		  </tr>
		</table>
	</form>
	
	

</body>
</html>