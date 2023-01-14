<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<title>Review</title>


<style>
teble {
	text boder: 2px solid;
	border-collapse: collapse;
	margin-left:auto;
	margin-right:auto;
}


th {
	background-color: #FFC314;
	margin:auto; 
}
</style>



</head>
<body class="is-preload">
	<%
	MemberVO info = (MemberVO) session.getAttribute("info");
	ArrayList<ReviewVO> review = (ArrayList<ReviewVO>) request.getAttribute("myReview");
	%>
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

	<header class="bar">
		<div id="Title">
			<h1>My 리뷰🍦</h1>
		</div>
		<br>
	</header>
	<br>
	<br>


	<div>
		<br>
		<div class="font1">
			<a>내가 작성한 리뷰😄</a>
		</div>
		<br>

		<table style="align: center; border: 1Px;" class="Myreviews">
			<tr>
				<th>번호</th>
				<th>리뷰제목</th>
				<th>리뷰내용</th>
				<th>리뷰사진</th>
				<th>평 점</th>
				<th>리뷰시간</th>
			</tr>

			<%
			int i = 1;
			for (i = 0; i < review.size(); i++) {
				int index = i + 1;
			%>

			<tr id="add_tr<%=i%>">
				<td><%=index%></td>
				<td><%=review.get(i).getReview_title()%></td>
				<td><%=review.get(i).getreviewContent()%></td>
				<td><img src="<%=review.get(i).getReviewPic()%>"></td>
				<td><%=review.get(i).getReviewScore()%></td>
				<td><%=review.get(i).getReviewDt()%></td>

			</tr>
		</table>
		
		<%
		}
		%>
	</div>


</body>
</html>