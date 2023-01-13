<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.ReviewVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />	 
    <title>Review</title>
</head>
      <body class="is-preload">
      <%MemberVO info = (MemberVO)session.getAttribute("info"); 
      ReviewVO review = (ReviewVO)request.getAttribute(review);%>
		  <div id="logo">
			 <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
		  </div> 
    
		<header class="bar">
			<div id="Title">
		    	<h1>My 리뷰🍦</h1>
			</div><br>
		</header>
		<br>
	
		<main>
			<div class= "font1">
			 <a>내가 작성한 리뷰😄</a>
			</div>
			</main>
		    	

<div>
    <a></a>

</div>


</body>
</html>