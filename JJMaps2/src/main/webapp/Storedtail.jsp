<%@page import="com.smhrd.model1.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model1.MenuVO"%>
<%@page import="com.smhrd.model1.StoreVO"%>
<%@page import="com.smhrd.model1.ReviewDAO"%>
<%@page import="com.smhrd.model1.ReviewVO"%>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style type="text/css">



.head{

display: inline-block;}

.head_left{float: right;
padding-top: 11px;}

.head_text{
 display: inline-block;
 padding-right: 10px;
 color: rgb(141, 140, 140);
 letter-spacing :0.009em; 
 font-size: 0.9em;}
 
#mainBody{max-width: 600px;
			min-width: 300px;
			text-align: center;
			margin-left: auto;
			margin-right: auto;
			  background: #fff;
  border-radius: 2px;
  display: inline-block;
  height: 300px;
  margin: 1rem;
  position: relative;
 }
.inline{
 display: inline-block;}
 
 .form{ display: inline-block;}
 
 .star-ratings {
    color: #aaa9a9; 
    position: relative;
    unicode-bidi: bidi-override;
    width: max-content;
    -webkit-text-fill-color: #aaa9a9;  /* Will override color (regardless of order) */

  }
   
  .star-ratings-fill {
    color: #fff58c;
    padding: 0;
    position: absolute;
    z-index: 1;
    display: flex;
    top: 0;
    left: 0;
    overflow: hidden;
    -webkit-text-fill-color: gold;
  }
   
  .star-ratings-base {
    z-index: 0;
    padding: 0;
    
  }
   table.type05 {
    border-collapse: separate;
     width: 100%;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin : 20px 10px;
  }
  table.type05 th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
     text-align: center;
    border-bottom: 1px solid #ccc;
  }
  table.type05 td {
    padding: 10px;
     padding-right: 20px;
    text-align: right;
    
    vertical-align: top;
    border-bottom: 1px solid #ccc;
  }

    #pic_div{
     text-align: center;
    width:100px;
    height:85px;
     border-radius: 20px;
     border: 0.1em solid  rgb(185, 185, 185);
    }
 
 
</style>
</head>
<body>


	<%	MemberVO info = (MemberVO)session.getAttribute("info");	%>

	<%	StoreVO store_info=(StoreVO)request.getAttribute("store_info");%>
	<%	ArrayList<MenuVO> menu_info=(ArrayList<MenuVO>)request.getAttribute("menu_info");%>
	<% Double Scores = (Double)request.getAttribute("Scores"); %>
	
	<!-- 헤더영역 -->
	<div id="login_Body">
		<div class='head' id="logo">
			<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		</div>
		
	
		
		<div class='head head_left'>
			<%
			if (info != null) {
				out.print("<a class=' head_text' id='mypage' href='Mypage.jsp'>마이페이지</a></li>");
				out.print("<a class=' head_text' id='logout' href='LogoutService'>로그아웃</a></li>");

				// smart 1234 -> usercode 0(일반이용자)
				// ssss 1234 -> usercode 1(점포이용자)

			} else {
				out.print("<a class='head_text' id='login' href='Login.jsp'>로그인</a></li>");
				out.print("<a class='head_text' id='join' href='Join.jsp'>회원가입</a></li>");
			}
			%> 
			</div>
	</div>
	<!-- 가게소개 영역 -->

	<header class="bar">
		<div id="Title">
			<h1>
			
			</h1>
			<div id="sdtail">
				<div>
				
				</div>
			</div>
		</div>
	</header>

	<br>
	<div class="mainBody " >
	<br>
	<img style="width=1px;"src="https://cdn-icons-png.flaticon.com/128/8339/8339313.png">
	<br><br>
	<span class="inline" style="font-size: 0.94em;display: block; color:rgb(141, 140, 140);">Category | <%=store_info.getStore_Cate() %></span><br>
	<div class="inline" id="null" style="max-width:800px;min-width:300px;height: 70px;">	<span style="height: 2px; display: block; font-size: 1.8em; font-weight: bold; "><%=store_info.getStore_Name() %></span></div>
	<a  href="https://map.kakao.com/link/roadview/<%=store_info.getLatitude()%>,<%=store_info.getLongitude()%>">
	<br>
	<div class="inline">
	<span class="material-symbols-outlined" style=" display:inline-block; color:rgb(70, 70, 70);top:10px;">location_on</span>
	<span  style="font-size: 1em; height: 20px; display: inline-block; font-weight: bold;color:rgb(70, 70, 70);"><%=store_info.getStore_Addr() %></span></a><br>
	</div><br>
	<div class="inline">
	<span class="material-symbols-outlined" style=" display:inline-block; color:rgb(80, 80, 80);top:10px;">call</span>
	<span  style="font-size: 1em; height:20px; display: inline-block; color:rgb(90, 90,9 0);"><%=store_info.getStore_Tel()%></span><br>
	</div>
	
	<br><br><br>
		<div class="star-ratings" style="display: inline-block;">
			<div 
		    class="star-ratings-fill space-x-2 text-lg"  style=" width: <%=Scores*20 %>% ; font-size: 2.2em;"
			><br><br>
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>  
			</div>
			<div class="star-ratings-base space-x-2 text-lg"style="font-size: 2.2em;">
				<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</div>
		</div>	(<%=Scores%>)
		
	</div> 
	<br>
	<br>
	<br>

		<form action="StoreDetail" class="form inline">
	
			<input type="hidden" id="login_check"
				value="<%=info!=null?info.getUser_Id():""%>"> <input
				type="hidden" name="storeId"
				value="<%=store_info.getStore_Id()%>"> <input
				type="hidden" name="send" value="Renovation.jsp">
			<div style="height:50px; display: inline-block;"><button>예약하기</button></div>
		</form>
				


	<form class="form inline" >
		<div style="height:50px; display: inline-block;"><button type="button" 
			onClick='location.href="ReviewService?store_id=<%=store_info.getStore_Id() %>"'>리뷰
			보기</button></div>
	</form>


<br>
<br>
<hr style="border: solid 1px  #FD6F22;">
<br>
<div style=" margin-left: auto; text-align:center;
    margin-right: auto;  font-family: 'NanumSquareNeo-Variable';letter-spacing :7px;" ><span>M E N U</span></div>
<br>



<table class="type05">


	<%for (int i = 0; i < menu_info.size(); i++) {%>
			<tr >
			
				<td><span style=" height: 110px ; padding-left:10px; display: table-cell; vertical-align: middle"><%=(i + 1)%></span></td>
				<td><div id="pic_div" style=" height: 110px ; display: table-cell; vertical-align: middle;">
				<%=menu_info.get(i).getMenu_Pic1() %></div></td>
				<td><span class="menu_name" style="color: rgb(32, 32, 32); font-size: 1.05em; font-weight: bold; "><%=menu_info.get(i).getMenu_Name()%></span><br>
				<span style="color: rgb(141, 140, 140); font-size: 0.8em;"><%=menu_info.get(i).getMenu_details()%></span>
				<span style="height: 12px; display: block;"><br></span>
				
				가격 : <span id="menuPrice<%=i%>"><%=menu_info.get(i).getMenu_Price()%></span>원<br>
				

<% } %>

</table>


<br>
<br>
<br>
<br>
							

					

						

	

 
		<footer id="footer" style="height: -10px;">@JJUPJJUPBAKSA</footer>
		<br>
		
		
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
    $('.form').submit(function() {
        if ($('#login_check').val()==="") {
        	 Swal.fire({
                 icon: '',
                 title: '',
                 text: '로그인을 해주세요.',
                 confirmButtonColor: '#FD6F22'
             });
            return false;
        }
    }); // end submit()
}); // end ready()



ratingToPercent() {
    const score = + this.restaurant.averageScore * 20;
    return score + 1.5;
}
</script>
</body>
</html>