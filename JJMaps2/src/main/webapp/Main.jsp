<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone-no">
    <link rel="stylesheet" type="text/css" href="assets/css/default.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jjmain.css">
    
    <title>main</title>
    
</head>
<body>
   
   <!-- 로그인 여부 판별-->
   <% MemberVO info = (MemberVO)(session.getAttribute("info")); %>
 
    <div class="Header_Init_Section">
        <div id="header_img">
            <header>
                <a href="#a"></a>
                <div>
                
                 <% if(info!=null){
                    out.print("<a id='mypage' href='mypage.jsp'>마이페이지</a>");
               
               //관리자만 볼 수 있는 a태그 
               //id가 프라이머리키인것을 활용한 방법 
               if(info.getUserCode().equals("1")){//info.getEmail().equals("admin")
               out.print("<a href='today.do'>오늘영업</a>");
               }
            
            }else{ 
               out.print("<a id='login' href='Login.jsp'>로그인</a>");
                out.print("<a id='join' href='Join.jsp'>회원가입</a>");
              }
             %>

                 </div>
                    <span id="main_st" >당신의 맛있는 지도</span><br>
            </header>
            
        <form action="#">
        <div id="serch">
            <input type="text" placeholder="검색어 입력">
            <input type="submit" value="검색">
        </div>
        </form>
       </div>
       
    </div>


    <div class="navi">
        <nav>
            <span>붕어빵</span>
            <span>붕어빵</span>
            <span>붕어빵</span>
            <span>붕어빵</span>
        </nav>
    </div>

<div class="map_wrap">
    <div class="map">
        
    </div>
</div>


</body>
</html>