<%@ page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<html>
<head>
<title>제보하기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no " />
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />
<style>
		table {width: 100%;}
		th { text-align: left; }
		td { text-align: center; }
</style>
</head>

<body class="is-preload">
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>

	<header class="bar">
		<div id="Title">
			<h1>제보하기</h1>
		</div>
	</header>
	<br>
	<br><br>		
	<div class="form">
		<form action="upload" method="post" enctype="multipart/form-data">
			<table>
				<tr bgcolor="orange" height="50px">
					<div style="color: orange" id="null"> 지금 나의 맛집을 제보해주세요!!</div>
				</tr>
				<tr height="35px">
					<td><textarea placeholder="제목을 입력하세요" name="title" cols="40"
							rows="1"></textarea></td>
				<tr height="35px">
					<td><textarea placeholder="내용을 입력하세요" cols="40"" name="content"
							rows="20"></textarea></td>
				</tr>
				
				<!-- 사진선택 등록-->
				<tr height="35px" border-radius: 5px; rbgcolor="orange">
					<td align="Right"><input type="file" name="uploadFile id="
						real-input" class="image_inputType_file" onchange="readURL(this);"
						accept="img/*" required multiple> 
						<div class="sb"><input type="submit"value="제보하기"></td></div>
					<br>
					<br>
				</tr>
			</table>
		</form>
	</div>
	
	
	<footer id = "footer">@JJUPJJUPBAKSA</footer>

</body>
</html>