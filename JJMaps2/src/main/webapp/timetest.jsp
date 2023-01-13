
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<% Date nowTime = new Date(); 
SimpleDateFormat sf = new SimpleDateFormat("hh:mm");

%>

<% String time=sf.format(nowTime).toString(); %>
<%= time.substring(0, 2) %>
<%= time.substring(3) %>

<input type="time" max="18:00">
<input type="submit">

</body>
</html>