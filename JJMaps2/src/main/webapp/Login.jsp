 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>jj login</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
       <meta name="format-detection" content="telephone-no">
     	 <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />	
   </head>

   <body>
      <div id="login_Body">

			<div id="logo">
			   <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
			</div>

			<header class="bar">
				<div class="pagename">
				   <h1 class="title" >로그인</h1>
				</div>
		  </header>

            <div id="login_input">
            

               <form style="margin-top: 80px; margin-bottom: 20px;" action="Login" method="post">
				<div class="id">아이디</div>
                <input name="user_Id" class="login_contents" align="center" type="text" placeholder="아이디를 입력하세요"><br><br>

				<div class="pw">비밀번호</div>
                <input name="user_Pw" class="login_contents" align="center" type="password" placeholder="비밀번호를 입력하세요"><br><br>
                <input class="login_contents" align="center" type="submit" value="로그인"><br><br>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </form>
            </div>
      </div>
	  <footer id = "footer">@JJUPJJUPBAKSA</footer>  
   </body>
</html>