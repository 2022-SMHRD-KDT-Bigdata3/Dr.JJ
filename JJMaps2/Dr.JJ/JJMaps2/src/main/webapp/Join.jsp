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
				   <h1>회원가입</h1>
				</div>
		  </header>
		  
	<div style="margin-top: 50px; margin-bottom: 20px;" class="form">
		
		<form action="JoinService" method="post">
	   		<div class="id">아이디</div>
	   			<input name="user_Id" type="text"><br>
	   			
			<div class="little">필수정보입니다</div><br>

	   		<div class="pw">비밀번호</div>
	   			<input name="user_Pw" type="password"><br><br>
			
			<div class="pwCheck">비밀번호 재확인</div>
	   			<input name="user_Pw_check" type="password" ><br><br>
	   			
	   		<div class="nick">닉네임</div>
	   			<input name="user_Nick" type="text"><br><br>
	   			
	   			<button>중복확인</button><br>
	   			<a><input type="submit" value="회원가입"><br>
	   </form>
	   <br>   	
	</div>      

  <footer id = "footer">@JJUPJJUPBAKSA</footer>

 </body>
</html>


