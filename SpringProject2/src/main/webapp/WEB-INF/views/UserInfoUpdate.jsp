<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<form id="frm" method="post">
        <div>
          <label for="m_id">아이디</label>
          <div>
            <input type="text" name="m_id"  value="${m_id}" readonly>
          </div>
        </div>
        <div>
          <label for="m_pw">비밀번호</label>
          <div>
            <input type="password" name="m_pw" placeholder="${m_pw}">
          </div>
        <div>
          <label for="m_name">이름</label>
          <div>
            <input type="text" name="m_name" placeholder="${m_name}">
          </div>
        </div>
        
        <div>
          <label for="m_phone">전화번호</label>
          <div>
            <input type="text" name="m_phone" placeholder="${m_phone}">
          </div>
        </div>
       
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="button" onClick="goUpdate()">수정</button>
          </div>
        </div>
      </form>
      



</body>
</html>