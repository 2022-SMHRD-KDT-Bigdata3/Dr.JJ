
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>리뷰쓰기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no " />
		 <link rel="stylesheet" href=" ./assets/css/writeReview.css" />
		 <style type="text/css">
            input[type=text]{ border: 1px solid orange; }
			button{ color:whitesmoke; border: 1px solid orange;
				border-radius: 5px; background-color: orangered;}
        </style>
		
		<script>	
			const browseBtn = document.querySelector('.browse-btn');
			const realInput = document.querySelector('#real-input');
			
			browseBtn.addEventListener('click',()=>{
				realInput.click();
			});
			
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
		<header class="bar">
			<nav class="navbar">		 
				 <a href="Main.jsp">
				 <img herf=""> <!-- 로고이미지 넣기 -->
				 </a>
							<div class="pagename">
					<h1 class="title" >리뷰하기</h1>
				</div>

			</nav>
		</header>

		<div class ="info" >
			<div class="info">
				<img src="images/profil_img.jpg"">
				<h2><a href="#">마싯는 트럭<a></h2>
			</div>
		</div><br>
		</div>

		<div class="form">
		<form action="#">
			<table>
				<tr bgcolor="orange" height="50px">
					<th colspan="2">
						리뷰합니다!
					</th>
				</tr>
				<tr height="35px" bgcolor="">
					<td>
						<textarea placeholder="제목을 입력하세요"  cols="50" rows="1"></textarea>
					</td>
				<tr height="35px" bgcolor="">
					<td >
						<textarea placeholder="내용을 입력하세요" cols="50" rows="20"></textarea>
					</td>
				</tr>
		
				<!-- 사진등록/ 등록-->
				<tr height="35px"  border-radius: 5px; rbgcolor="orange">
					<td  align="Right">
						<input type="file" id="real-input" class="image_inputType_file" onchange="readURL(this);" accept="img/*" required multiple>
						
						
						
						<!--리뷰가 데이터베이스로-->
						<button onClick="location.href='#'" >사진등록</botton> <!-- 주소변경 -->
						<button onClick="location.href='Myreview.jsp'" class="submit">등록</button>
					
						</div>
					</td>
				</tr>
			</table>
		</form>		
	</div>
	</body>
</html>