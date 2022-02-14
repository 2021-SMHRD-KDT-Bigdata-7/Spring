<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssfile.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>불이야-회원가입</title>
</head>
<body>
	<div class="top"></div>
	<header> <h2>회원가입</h2> </header> 
	
	<form action="" id="agree">
            <ul class="agree_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chk" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk"> 
                        </li>
                    </ul>
                    <textarea name="" id="">여러분을 환영합니다.</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk" id="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="">여러분을 환영합니다.</textarea>
                </li>
            </ul>
           <!--  <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1">비동의</button></li>
                <li><button class="fpmgBt2">동의</button></li>
            </ul> -->
        </form>
	
	<form action="" method="POST"> 
		<!-- 일반회원 로그인 -->
		<div class="input-box"> 
			<input id="m_name" type="text" name="m_name" placeholder="이름"> 
			<label for="m_name">이름</label> 
		</div>
		<!-- 소방서 로그인 --> 
		<!-- <div class="input-box"> 
			<input id="m_name" type="text" name="m_name" placeholder="센터명"> 
			<label for="m_name">센터명</label> 
		</div> -->
		
		<div class="input-box"> 
			<input id="m_id" type="text" name="m_id" placeholder="아이디"> 
			<label for="m_id">아이디</label> 
		</div>
		<div class="input-box"> 
			<input id="m_pw" type="password" name="password" placeholder="비밀번호"> 
			<label for="m_pw">비밀번호</label> 
		</div> 
		<div class="input-box"> 
			<input id="m_phone" type="tel" name="m_phone" placeholder="전화번호" maxlength="11"> 
			<label for="m_phone">전화번호</label> 
		</div> 
		<div class="input-box"> 
			<input id="add1" type="text" name="add1" placeholder="우편번호" readonly="readonly" style="width:50%;">
			<label for="add1">우편번호</label>
		</div> 
		<div class="input-box"> 
			<input id="add2" type="text" name="add2" placeholder="도로명주소" readonly="readonly">
			<label for="add2">도로명주소</label>
		</div> 
		<div class="input-box"> 
			<input id="add3" type="text" name="add3" placeholder="상세주소">
			<label for="add3">상세주소</label> 
		</div> 
		<div id="btn-login-main">
			<input type="submit" id="btn-submit" value="가입완료">
		</div>
        
	</form>

<!-- 출처: https://ddorang-d.tistory.com/9 [도라미도라미] -->
	
	<!-- 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
		    document.getElementById("add1").addEventListener("click", function(){
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) {
		                document.getElementById("add1").value = data.zonecode;
		                document.getElementById("add2").value = data.address;
		                document.querySelector("input[name=add3]").focus();
		            }
		        }).open();
		    });
		}
	</script>
	<script>
	window.onload = function () {
		const checkAll = document.getElementById('chkAll');
		const chks = document.querySelectorAll('.chk');  
		const chkBoxLength = chks.length;
		 
		checkAll.addEventListener('click', function(event) {
		    if(event.target.checked)  {
		        chks.forEach(function(value){
		        value.checked = true;
		    })
		    }else {
		       chks.forEach(function(value){
		       value.checked = false;
		    })
		 }
		  });
		for (chk of chks){
		    chk.addEventListener('click', function() {
		        let count = 0;
		        chks.forEach(function(value){
		            if(value.checked == true){
		                count++;
		            }
		        })
		        if(count !== chkBoxLength){
		            checkAll.checked = false;
		        }else{
		            checkAll.checked = true;
		        }
		      })
		}
		 }
	</script>
</body>
</html>