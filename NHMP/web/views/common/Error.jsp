<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String message = (String)request.getAttribute("message");
	String message1 = (String)request.getAttribute("message1");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
</head>
<body>

<h1 align="center">에러 발생 : <%= message %></h1>
<h2 align="center"><a href = "/NHMP/index.jsp">홈으로 이동</a></h2>
<h2 align="center"><a href = "/NHMP/views/ERP/main.jsp">시스템 관리로 이동</a></h2>




</body>
</html>