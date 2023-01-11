<%@page import="com.smhrd.model1.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<% MemberVO info = (MemberVO)(session.getAttribute("info")); %>

	<h3>점포 메뉴 등록</h3>

	<form action="MenuInsert">
		<button id="btnAdd" type="button">메뉴 추가</button>
		 상위 4개 메뉴가 검색시 노출됩니다
		<table border="1px solid" class="addInput">
			<tr>
				<th>메뉴이름</th>
				<th>가격</th>
				<th>메뉴 설명</th>
				<th>삭제</th>
			</tr>


			<tr>
				<td><input id="menu_Name0" name="menu_Name" type="text"></td>
				<td><input id="menu_Price0" name="menu_Price" type="text"></td>
				<td><textarea id="menu_Detail0" name="menu_Detail" cols="50" rows="2"></textarea></td>
				<td></td>
			</tr>
		</table>

		<input type="submit" value="메뉴 등록">

	</form>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	
	
	
		<script>
	let i = 1;
	$('#btnAdd').click(function(){
	    $('.addInput').append(
	    		'<tr id="add_tr'+i+'">'+
	    	'<td><input id="menu_Name'+i+'" name="menu_Name" type = "text" > </td>'+
	        '<td><input id="menu_Price'+i+'" name="menu_Price" type = "text" ></td>'+
	        '<td><textarea id="menu_Detail'+i+'" name="menu_Detail" cols="50" rows="2"></textarea></td>'+
	        '<td><button type="button" id="btnRemove'+i+'" onclick="goDel('+i+')">삭제</button><br><br></td></tr>'
	    );
	    i++;
	});
	
	function goDel(i){
		$("#add_tr"+i).remove();
	};
	
	</script>


</body>
</html>