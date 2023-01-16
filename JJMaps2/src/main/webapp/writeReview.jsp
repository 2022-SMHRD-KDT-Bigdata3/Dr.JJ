<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>jj login</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<meta name="format-detection" content="telephone-no">
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />

<style>
table {
	width: 100%;
}

th {
	text-align: left;
}

td {
	text-align: center;
}

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 1.8em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
</style>
</head>

<script>
	const browseBtn = document.querySelector('.browse-btn');

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
</script>
</head>

<body class="is-preload">
	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	Integer store_id = Integer.parseInt(request.getParameter("store_id"));
	%>


	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

	<header class="bar">
		<div id="Title">
			<h1>마이-리뷰쓰기</h1>
		</div>
	</header>

	<div class="info">
		<div class="info">
			<img src="images/profil_img.jpg">
			<h2 class="store_name">
				<a href="Storedtail.jsp">마싯는 트럭</a>
			</h2>
		</div>
	</div>
	<br>


	<div class="form">
		<form id="myform" action="UploadServlet" method="post" enctype="multipart/form-data">
			<input type="hidden" name="store_id"  value= "<%=store_id%>">
			<table>
				<tr bgcolor="orange">
					<div id="null" style="color: balck; font-weight:bold;" id="head ">리뷰합니다!</div>
				</tr>


				<tr height="35px">
					<td><textarea placeholder="제목을 입력하세요" name="title" cols="50"
							rows="1"></textarea></td>
				<tr height="35px">
					<td><textarea placeholder="내용을 입력하세요" cols="50" name="content"
							rows="20"></textarea></td>
				</tr>

				<!-- 사진선택 등록-->

				<tr height="35px" border-radius: 5px; rbgcolor="orange">
					<td align="Right"><input type="file" name="uploadFile" id=
						"real-input" class="image_inputType_file" onchange="readURL(this);"
						accept="img/*" required multiple></td></tr><br> <br>
				<tr>
					<td><br>
					
				<!-- 별점 등록-->
					<div id="null" class= "starScore">
						<fieldset>
							<span class="text-bold" style="font-weight:bold; color:orangered;">별점을 선택해주세요</span> <br>
							<input type="radio" name="reviewStar" value="5" id="rate1">
								<label for="rate1">★</label> 
							<input type="radio" name="reviewStar" value="4" id="rate2">
								<label for="rate2">★</label> 
							<input type="radio" name="reviewStar" value="3" id="rate3">
								<label for="rate3">★</label> 
							<input type="radio" name="reviewStar" value="2" id="rate4">
								<label for="rate4">★</label> 
							<input type="radio" name="reviewStar" value="1" id="rate5">
								<label for="rate5">★</label>
						</fieldset>
						</div>
					</td>
				</tr>

				<tr>
					<div class="sb">
						<td><br>
						<input type="submit" value="등록"></td>
					</div>
					<br>
					
				</tr>
			</table>
		</form>
	</div>
	<br>
	<br>
</body>
</html>