<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model1.MenuVO"%>
<%@page import="java.awt.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.price:invalid {
  border: 2px solid red;
}
input{width:50px; 
text-align:right;}
</style>

</head>
<body>

	<%ArrayList<MenuVO> menulist = (ArrayList<MenuVO>)request.getAttribute("menulist"); %>
	<%int cnt = menulist.size(); %>
	<input id="menulist_size" type="hidden" value="<%=cnt%>"> 
	<h3>점포 메뉴 등록</h3>

	<form action="MenuUpdate">
		<button id="btnAdd" type="button">메뉴 추가</button>
		 상위 4개 메뉴가 검색시 노출됩니다
		<table border="1px solid" class="addInput">
			<tr>
				<th>번호</th>
				<th>메뉴이름</th>
				<th>가격</th> 
				<th>메뉴 설명</th>
				<th>삭제</th>
			</tr>
			<tr>
			<td>1</td>
				<td><textarea id="menu_Name0" name="menu_Name" cols="16" rows="2"><%=(menulist!=null)?""+menulist.get(0).getMenu_Name()+"":"" %></textarea></td>
				<td><input id="menu_Price0" name="menu_Price" class="price" type="text" pattern="[0-9]+" value=<%=(menulist!=null)?""+menulist.get(0).getMenu_Price()+"":"" %>>원</td>
				<td><textarea id="menu_Detail0" name="menu_Detail" cols="20" rows="2"><%=(menulist!=null)?""+menulist.get(0).getMenu_details()+"":"" %></textarea></td>
				<td></td>
			</tr>

			<% int i =1;
			for(i=1;i<menulist.size() ;i++){  int index =i+1;%>
			
				<tr id="add_tr<%=i%>">
				<td><%= index %></td>
				<td><textarea id="menu_Name<%=i%>" name="menu_Name" cols="16" rows="2"><%=(menulist!=null)?""+menulist.get(i).getMenu_Name()+"":"" %></textarea></td>
				    <td><input id="menu_Price<%=i%>" name="menu_Price" class="price" type="text" pattern="[0-9]+" value=<%=(menulist!=null)?""+menulist.get(i).getMenu_Price()+"":"" %>>원</td>
				    <td><textarea id="menu_Detail<%=i%>" name="menu_Detail" cols="20" rows="2"><%=(menulist!=null)?""+menulist.get(i).getMenu_details()+"":"" %></textarea></td>
				    <td><button type="button" id="btnRemove<%=i%>" onclick="goDel('<%=i%>')">×</button><br><br></td>
				</tr>
				
			<% } %>
			
		</table>

		<input type="submit" value="메뉴 수정">

	</form>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
<script >


let i = $('#menulist_size').val();
i=Number(i)+1;
console.log(i)
$('#btnAdd').click(function(){
    $('.addInput').append(
    		'<tr id="add_tr'+i+'">'+
			'<td>'+(i)+'</td>'+
    		'<td><textarea id="menu_Name'+i+'" name="menu_Name" cols="16" rows="2"></textarea></td>'+
        '<td><input id="menu_Price'+i+'" name="menu_Price"class="price" type="text" pattern="[0-9]+" >원</td>'+
        '<td><textarea id="menu_Detail'+i+'" name="menu_Detail" cols="20" rows="2"></textarea></td>'+
        '<td><button type="button" id="btnRemove'+i+'" onclick="goDel('+i+')">×</button><br><br></td></tr>'
    );
    i++;
});


function goDel(i){
	$("#add_tr"+i).remove();
};


</script>

</body>
</html>