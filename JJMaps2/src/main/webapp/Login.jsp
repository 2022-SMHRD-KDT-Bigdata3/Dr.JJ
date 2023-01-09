<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <title>jj login</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
       <meta name="format-detection" content="telephone-no">
      <link rel="stylesheet" href="assets/css/login.css"/>
   </head>
   <body>
      <div id="login_Body">
            <header>
                <a id="main_Logo" href="Main.jsp">로고</a>
            </header>

            <a id="login_logo">로그인</a>

            <div id="login_input">
            
               <form action="Login" method="post">
                <input name="user_Id" class="login_contents"align="center" type="text" placeholder="아이디를 입력하세요"><br>
                <input name="user_Pw" class="login_contents"align="center" type="password" placeholder="비밀번호를 입력하세요"><br>
                <input class="login_contents"align="center" type="submit" value="로그인"><br>
                </form>
 
         <br> <a href="#" class="login_contents"><button>네이버로 간편 로그인</button></a><br> 
             <a href="#" class="login_contents"><button>카카오로 간편 로그인</button></a><br>
            </div>

      </div>
     
  
   </body>
</html>