<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>jj login</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone-no">
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>

	<div id="login_Body">

		<div id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>

		<header class="bar">
			<div id="Title">
				<h1>로그인</h1>
			</div>
		</header>

		<div id="login_input">
			<form class="form" style="margin-top: 80px; margin-bottom: 20px;" action="Login"
				method="post">
				<div class="id">아이디</div>
				<input id="userId" name="user_Id" class="login_contents idcheck" align="center"
					type="text" placeholder="아이디를 입력하세요" ><br> <br>

				<div class="pw">비밀번호</div>
				<input id="userPw" name="user_Pw" class="login_contents" align="center"
					type="password" placeholder="비밀번호를 입력하세요" ><br> <br>
				<input class="login_contents" align="center" type="submit"
					value="로그인"><br> <br> <br> <br>

				<div>
					<div class="box_login">
						<ul>
							<li id="null" style="color: #FD6F22;">아직 쩝쩝여지도 회원이 아니신가요?</li>
							<li class="little2">회원가입을 하시면 더 많은 정보와 혜택을 받으실 수 있습니다</li>
						</ul>
					</div>
				</div>
				<button type="button" onclick="location.href='Join.jsp'">회원가입</button>
			</form>
		</div>
	</div>
	<footer id="footer">@JJUPJJUPBAKSA</footer>
	
	
	
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	 $(document).ready(function() {
	        $('.form').submit(function() {
	        	let id=$('#userId').val();
	        	let pw=$('#userPw').val();
	            if (id=="") {
	            	 Swal.fire({
	                     icon: '',
	                     title: '',
	                     text: '아이디를 입력해주세요',
	                     confirmButtonColor: '#FD6F22'
	                 });
	                return false;
	            }else if(pw==""){
	            	 Swal.fire({
	                     icon: '',
	                     title: '',
	                     text: '비밀번호를 입력해주세요',
	                     confirmButtonColor: '#FD6F22'
	                 });
	            	 return false;
	            }
	        }); // end submit()
	    }); // end ready()
	    </script>

</body>
</html>