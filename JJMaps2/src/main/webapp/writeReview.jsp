<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
       <title>jj login</title>
       <meta charset="utf-8" />
       <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
       <meta name="format-detection" content="telephone-no">
       <link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />	
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
	%>
	
		 <div id="login_Body">

			<div id="logo">
			   <a  onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
			</div>

			<header class="bar">
				<div class="pagename">
				   <h1 class="title" >로그인</h1>
				</div>
		  </header>

		<div class ="info" >
			<div class="info">
				<img src="images/profil_img.jpg"">
				<h2><a class="store_name" href="Storedtail.jsp">마싯는 트럭</a></h2>
			</div>
		</div><br>
		

		<div class="form">
		<form action="upload" method="post" enctype="multipart/form-data">
			<table>
				<tr bgcolor="orange" height="50px">
					<th colspan="2">
						리뷰합니다!
					</th>
				</tr>
				<tr height="35px" bgcolor="">
					<td>
						<textarea placeholder="제목을 입력하세요" name="title"  cols="50" rows="1"></textarea>
					</td>
				<tr height="35px" bgcolor="">
					<td >
						<textarea placeholder="내용을 입력하세요" cols="50" name="content" rows="20"></textarea>
					</td>
				</tr>
		
				<!-- 사진등록/ 등록-->
				<tr height="35px"  border-radius: 5px; rbgcolor="orange">
					<td  align="Right">
						<input type="file" name="uploadFile id="real-input" class="image_inputType_file" onchange="readURL(this);" accept="img/*" required multiple>
						
						<input type="submit" value="등록" >

					</td>
				</tr>
			</table>
		</form>		
	</div>
	</body>
</html>