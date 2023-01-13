<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
<link rel="stylesheet" type="text/css" href="assets/css/storedtail.css" />

<style type="text/css">
.price:invalid {
	border: 2px solid red;
}
</style>
</head>


<body class="is-preload">
	<%
	MemberVO info = (MemberVO) (session.getAttribute("info"));
	%>
	<div id="logo">
		<a onClick='location.href="Main.jsp"'>쩝쩝여지도</a><br>
	</div>


	<header class="h2">
		<div class="pagename">
			<h1 id="Title">점포 메뉴 등록</h1>
		</div>
	</header>

	<br><br><br>
	<form class="form" action="MenuInsert" method="post" enctype="multipart/form-data">
		<button id="btnAdd" type="button">메뉴 추가</button><br>
		<br> <span class="little2">상위 4개 메뉴가 검색시 노출됩니다</span><br>
		<br><br>
	
	<div id="null">
		<table border="1px solid" class="addInput">
			<tr>
				<th class="tr">번호</th>
				<th class="tr">메뉴이름</th>
				<th class="tr">가격</th>
				<th class="tr">메뉴 설명</th>
				<th class="tr">사진</th>
				<th class="tr">삭제</th>
			</tr>
			<br><br>
	</div>
<tr>
   <td>1</td>
   			<div class="menuinsert">
            <td><input id="menu_Name0" name="menu_Name" type="text"></input></td>
            <td><input id="menu_Price0" name="menu_Price" type="text"class="price" type="text" pattern="[0-9]+"></td>
            <td><input id="menu_Detail0" name="menu_Detail" type="text"></input></td>
</div>
            <td><input type="file" name="menu_Pic" accept="image/png, image/gif, image/jpeg"></td>
            <td><br><br></td></tr>

         </tr>
      </table>


   </form>

	<input type="submit" value="메뉴 등록" class="click">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
		let i = 1;
		$('#btnAdd')
				.click(
						function() {
							$('.addInput')
									.append(
											'<tr id="add_tr'+i+'">'
													+ '<td>'
													+ (i + 1)
													+ '</td>'
													+ '<td><input id="menu_Name0" name="menu_Name" type="text"></input></td>'
													+ '<td><input id="menu_Price'+i+'" name="menu_Price" type = "text" class="price" type="text" pattern="[0-9]+"></td>'
													+ '<td><input id="menu_Detail0" name="menu_Detail" type="text"></input></td>'
													+ '<td></td>'
													+ '<td><button class="click" type="button" id="btnRemove'
													+ i
													+ '" onclick="goDel('
													+ i
													+ ')">×</button><br><br></td></tr>');
							i++;
						});

		function goDel(i) {
			$("#add_tr" + i).remove();
		};
	</script>
	
	
	<footer class="fix2" onClick='location.href="#"'>
		<div id="myr">이동하기</div>
	</footer>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<footer id="footer">@JJUPJJUPBAKSA</footer>

</body>
</html>