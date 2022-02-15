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
			  ${rvo.re_type}
			</td>
		  </tr>
		  <tr>
		    <td>장소</td>
		    <td>
		      ${rvo.re_loc}
		    </td>
		  </tr>
		  <tr>
		    <td>내용</td>
			<td>
	    	  ${rvo.re_content}
			</td>
		  </tr>
		  
		  <tr align="center">
		    <td colspan="2">
		      <button>전화하기</button>
		      <input type="submit" value="신고접수" >
		    </td>
		  </tr>
		</table>

</body>
</html>