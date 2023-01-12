<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE HTML>

<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no " />
		 <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />	 

   </head>
	
	
	   <body class="is-preload">
		  <div id="logo">
			 <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		  </div>
	   
		  <header class="bar">
				<div class="pagename">
				   <h1 class="title" >회원가입</h1>
				</div>
		  </header>
		  
	<div style="margin-top: 50px; margin-bottom: 20px;" class="form">
		
		<form action="JoinService" method="post">
	   		<div class="id">아이디</div>
	   			<input name="user_Id" type="text" class="patternCheck" pattern="^[a-z0-9_-]{2,10}$" required><br>
	   			영문자, 소문자, 숫자, "-","_" 로만 구성된 길이 2~10자리 사이의 문자열(공백불가)
			<div class="little">필수정보입니다</div><br>
			<button>중복확인</button><br>

	   		<div class="pw">비밀번호</div>
	   			<input id="pw" name="user_Pw" type="password"  class="patternCheck"
	   			pattern="^[A-Za-z\d$@$!%*#?&]{4,16}$" required><br><br>
				최소 4자리에서 최대 16자리까지 숫자, 영문, 특수문자 가능 (공백불가)
			<div class="pwCheck">비밀번호 재확인</div>
	   			<input id="pwCheck" onfocusout="check()" name="user_Pw_check" type="password" 
	   			pattern="^[A-Za-z\d$@$!%*#?&]{4,16}$" required><br><br>
	   			<span id = "checkPw"></span>
	   			
	   		<div class="nick">닉네임</div>
	   			<input name="user_Nick" type="text" pattern="^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,8}$" required ><br><br>
	   			한글,영문,숫자 2~8글자(공백불가)
	   			
	   			
	   			<a><input type="submit" value="회원가입"><br>
	   </form>
	   <br>   	
	</div>      
	

  <footer id = "footer">@JJUPJJUPBAKSA</footer>
  
  <script type="text/javascript">

	function check() {

		let password = document.getElementById('pw');					//비밀번호 
		let passwordConfirm = document.getElementById('pwCheck');	//비밀번호 확인 값
		let checkPw = document.getElementById('checkPw');				//확인 메세지
		let correctColor = "#7DB249";	
		let wrongColor ="#ff0000";	
		
		if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			checkPw.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			checkPw.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			checkPw.style.color = wrongColor;
			checkPw.innerHTML ="비밀번호 불일치";
		}
	}
</script>



 </body>
</html>


