<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
   <head>
      <title>회원가입</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no " />
       <link rel="stylesheet" href="./assets/css/join.css" />

       <style type="text/css">
            input[type=text]{ border: 1px solid orange; }
         button{ color:whitesmoke; border: 1px solid orange;
            border-radius: 5px; background-color: orangered;}
        </style>

   </head>

   <body class="is-preload">
   
      
      <header class="bar">
         <nav class="navbar">
             
            <div id="navbar_logo">
               <a href="메인페이지로 연결">로고<img src=""></a>
            </div>
            
            <div class="pagename">
               <h1 class="title" >회원가입</h1>
            </div>

         </nav>
      </header>
      
      <div class="form">
      	<form action="JoinService" method="post">
         <input name="user_Id" type="text" placeholder="아이디 입력"><br>
         <input name="user_Pw" type="password" placeholder="비밀번호 입력"><br>
         <input name="user_Nick" type="text" placeholder="닉네임 입력"><br>
         <span><button>중복확인</button></span><br>
         <input type="submit" value="회원가입"><br>
         </form>
         <a href="https://nid.naver.com/user2/V2Join?m=agree&lang=ko_KR"><img src="./img/네이버로 로그인.png"></a><br>
         <a href="https://cs.kakao.com/helps?category=226&locale=ko&service=8"><img src="./img/카카오톡으로 로그인.png"></a><br>
      </div>      

   </body>
</html>