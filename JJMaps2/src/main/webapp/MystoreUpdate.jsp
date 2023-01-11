<%@page import="com.smhrd.model1.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%StoreVO Storeinfo = (StoreVO)request.getAttribute("Storeinfo"); %>
	
	<% 
	String store_Name = Storeinfo.getStore_Name();
	String store_Addr =Storeinfo.getStore_Addr();
	String store_Tel = Storeinfo.getStore_Tel();
	String store_Open_Dt =Storeinfo.getStore_Open_Dt();
	String store_Close_Dt = Storeinfo.getStore_Close_Dt();
	int store_Card_Yn = Storeinfo.getStore_Card_Yn();
	int store_Status = Storeinfo.getStore_Status();
	String user_Id = Storeinfo.getUser_Id();
	String store_Cate = Storeinfo.getStore_Cate();
	
	%>
	
	
	<form action="StoreJoin" method="post">
	<h1>점포 정보 수정</h1>

		<div class="store_BasicInfo">
			<h4>점포 기본 정보</h4>
			<span>점포이름</span> <input name = "store_Name" type="text" class="store_name" value ="<%=store_Name %>"><br>
			<span>점포연락처</span><input name = "store_Tel"  type="text" class="store_"value ="<%=store_Tel %>"><br>
			<span>카테고리</span><br>
			<input type="radio" name="store_Cate" value="붕어빵"<%=(store_Cate.equals("붕어빵"))?"checked":"" %> >붕어빵
			<input type="radio" name="store_Cate" value="타코야끼"<%=(store_Cate.equals("타코야끼"))?"checked":"" %>>타코야끼
			<input type="radio" name="store_Cate" value="호떡"<%=(store_Cate.equals("호떡"))?"checked":"" %>>호떡<br>
			<input type="radio" name="store_Cate" value="순대"<%=(store_Cate.equals("순대"))?"checked":"" %>>순대
			<input type="radio" name="store_Cate" value="분식류"<%=(store_Cate.equals("분식류"))?"checked":"" %>>분식류
			<input type="radio" name="store_Cate" value="기타"<%=(store_Cate.equals("기타"))?"checked":"" %>>기타
		</div>

		<div class="store_openInfo">
			<h4>점포 영업 정보</h4>
			<span>영업장소</span><br>
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
			<input type="text" readonly="readonly" id="sample6_postcode" placeholder="우편번호">
			<input name="store_Addr" type="text" readonly="readonly" id="sample6_address"  placeholder="주소" value ="<%=store_Addr %>"><br>
			<input type="text" readonly="readonly" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" readonly="readonly" id="sample6_extraAddress" placeholder="참고항목">
			<br>
			<span>영업 오픈 시간</span><input name = "store_Open_Dt" type="text" class="store_runtime" value ="<%=store_Open_Dt %>"><br>
			<span>영업 종료 시간</span><input name = "store_Close_Dt" type="text" class="store_runtime" value ="<%=store_Close_Dt %>"><br>

			<br>

			<div class="store_payment">
				카드 결제 서비스<br> 
				<span><input name="store_Card_Yn" type="radio" value=1 <%=(store_Card_Yn > 0)?"checked":"" %> >가능</span>
				<span><input name="store_Card_Yn" type="radio" value=0 <%=(store_Card_Yn ==0)?"checked":"" %>>불가능</span> <br>
				(카드결제 안될 시 본 사이트의 주문예약 서비스를 이용하실 수 없습니다)
			</div>
			<br>
		</div>

			<button>점포 등록 및 수정</button>

	</form>


</body>
</html>