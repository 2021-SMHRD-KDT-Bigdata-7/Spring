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
<title>불이야-회원가입</title>
</head>
<body>
<div id="wrap" style="height: auto;">
<section>
	<div class="empty"></div>
	<header> <h2 class="title">Join Us</h2> </header> 
	
	<form action="" id="agree">
            <ul class="agree_box">
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk"> 
                        </li>
                    </ul>
                    <textarea name="" id="" readonly="readonly">
제 1 조 (목적)
이 약관은 불이야(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.

제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.

제 2 장 서비스 이용계약

제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.

제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.

제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우

제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.
</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk">
                        </li>
                    </ul>
                    <textarea name="" id="" readonly="readonly"> 개인정보 수집 및 이용에 대한 안내
 1. 개인정보 수집 및 이용 목적
  -  급박한 위험으로부터 생명, 신체를 보호
 2. 수집하는 개인정보 항목
  - 성명, 전화번호, 신고사항
 3. 개인정보 보유기간
  - 보존기간 : 5년
 * 위 사항에 대하여 동의를 거부할 권리가 있으며, 동의 거부시 서비스 이용에 제약이 있습니다. 
                    </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="" readonly="readonly"> 위치정보 이용약관에 대한 안내
 1. 위치정보 수집 및 이용 목적
  -  급박한 위험으로부터 생명, 신체를 보호
 2. 수집하는 개인정보 항목
  - 위치
 3. 개인정보 보유기간
  - 보존기간 : 5년
 * 위 사항에 대하여 동의를 거부할 권리가 있으며, 동의 거부시 서비스 이용에 제약이 있습니다. 
</textarea>
                </li>
            </ul>
        </form>
		${m_type}
		 <form action="JoinAll.do" method="POST"> 
  		 <c:choose>
  		 <c:when test="${m_type eq 'U'}">
  		 <%-- 일반회원 회원가입 --%>
			 <div class="input-box"> 
				 <input type="hidden" name="m_type" value="${m_type}"> 
				 <input id="m_name" type="text" name="m_name" placeholder="이름"> 
				 <label for="m_name">이름</label> 
			 </div>
		 </c:when>
		 <c:otherwise>
		<%-- 소방서 회원가입 --%>
			 <div class="input-box"> 
			 	<input type="hidden" name="m_type" value="${m_type}"> 
			 	<input id="m_name" type="text" name="m_name" placeholder="센터명"> 
			 	<label for="m_name">센터명</label> 
			 </div>
		 </c:otherwise>
	 	 </c:choose>
			<div class="input-box"> 
				<input id="m_id" type="text" name="m_id" placeholder="아이디"> 
				<label for="m_id">아이디</label> 
			</div>
			<div class="input-box"> 
				<input id="m_pw" type="password" name="m_pw" placeholder="비밀번호"> 
				<label for="m_pw">비밀번호</label> 
			</div> 
			<div class="input-box"> 
				<input id="m_phone" type="tel" name="m_phone" placeholder="전화번호" maxlength="11"> 
				<label for="m_phone">전화번호</label> 
			</div> 
			<div id="btn-login-main">
				<input type="submit" id="btn-submit" value="가입완료">
			</div>
		</form>
</section>
<footer class="footer">
<div style="display: contents;">
	<img id="logo" onclick="location.href='${cpath}/Main.do'" src="resources/images/header.png">
</div>
</footer>
</div>	
</body>
</html>