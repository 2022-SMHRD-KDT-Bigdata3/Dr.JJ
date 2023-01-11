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
		<table border="1px solid" class="addInput">
			<tr>
				<th>메뉴명</th>
				<th>가격</th>
				<th>대표메뉴</th>
				<th>삭제</th>
			</tr>


			<tr>
				<td><input id="menu0" name="menu0" type="text"></td>
				<td><input id="menu0_price" name="menu0_price" type="text">
				</td>
				<td><input id="check0" onclick="CheckedMax(this)"
					name="SIGNATURE" type="checkbox"></td>
				<td></td>
			</tr>
		</table>

		<input type="submit" value="메뉴 등록">

	</form>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	var maxCount = 4;								// 카운트 최대값은 2
	var count = 0;   								// 카운트, 0으로 초기화 설정
	
	function CheckedMax(field){ 					// field객체를 인자로 하는 CountChecked 함수 정의
		if (field.checked) {						// 만약 field의 속성이 checked 라면(사용자가 클릭해서 체크상태가 된다면)
			count += 1;								// count 1 증가
		}
		else {										// 아니라면 (field의 속성이 checked가 아니라면)
			count -= 1;								// count 1 감소
		}
		
		if (count > maxCount) {						// 만약 count 값이 maxCount 값보다 큰 경우라면
			alert("최대 4개까지만 선택가능합니다!");	// alert 창을 띄움
		field.checked = false;						// (마지막 onclick한)field 객체의 checked를 false(checked가 아닌 상태)로 만든다.
		count -= 1;									// 이때 올라갔던 카운트를 취소처리해야 하므로 count를 1 감소시킨다.
		}
	}</script>
	
	
	
		<script>
	let i = 1;
	$('#btnAdd').click(function(){
	    $('.addInput').append(
	    		'<tr id="add_tr'+i+'">'+
	    	'<td><input id="menu'+i+'" name="menu'+i+'" type = "text" > </td>'+
	        '<td><input id="menu_price'+i+'" name="menu_price'+i+'" type = "text" ></td>'+
	        '<td><input id="check'+i+'"onclick="CheckedMax(this)" name="SIGNATURE" type="checkbox" ></td>'+
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