<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>리뷰쓰기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./assets/css/writeReview.css" />
<style type="text/css">
input[type=text] {
	border: 1px solid orange;
}

button {
	color: whitesmoke;
	border: 1px solid orange;
	border-radius: 5px;
	background-color: orangered;
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
    font-size: 3em;
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
// 	StoreVO st_info = (StoreVO) (session.getAtrribute("Storeinfo"));
	%>

	<header class="bar">
		<nav class="navbar">
			<a href="Main.jsp"> <img herf=""> <!-- 로고이미지 넣기 -->
			</a>
			<div class="pagename">
				<h1 class="title">리뷰하기</h1>
			</div>

		</nav>
	</header>

	<div class="info">
		<div class="info">
			<img src="images/profil_img.jpg"">
			<h2>
				<a href="#">마싯는 트럭<a>
			</h2>
		</div>
	</div>
	<br>


	<div class="form">
		<form action="UploadServlet" method="post"
			enctype="multipart/form-data" id="myform">
			<table>
				<tr bgcolor="orange" height="50px">
					<th colspan="2">리뷰합니다!</th>
				</tr>
				<tr height="35px" bgcolor="">
					<td><textarea placeholder="제목을 입력하세요" name="title" cols="50"
							rows="1"></textarea></td>
				<tr height="35px" bgcolor="">
					<td><textarea placeholder="내용을 입력하세요" cols="50"
							name="content" rows="20"></textarea></td>
				</tr>
				<tr>
					<td align="right">
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span> 
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
					</td>
				</tr>
				<!-- 사진등록/ 등록-->
				<tr height="35px" border-radius: 5px; rbgcolor="orange">
					<td align="Right"><input type="file" name="uploadFile"
						id="real-input" class="image_inputType_file"
						onchange="readURL(this);" accept="img/*" required multiple>

						<input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>