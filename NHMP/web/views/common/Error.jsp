<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="Main.NursingHospital.model.ov.NursingHospital"
%>

<%
	String message = (String)request.getAttribute("message");
	String message1 = (String)request.getAttribute("message1");
	NursingHospital loginHospital = (NursingHospital)session.getAttribute("loginHospital");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
</head>
<body>

<h1 align="center">에러 발생 : <%= message %></h1>
<% if(loginHospital != null ) { %>
	<h2 align="center"><a href = "/NHMP/index.jsp">홈으로 이동</a></h2>
	<h2 align="center"><a href = "/NHMP/views/ERP/main.jsp">시스템 관리로 이동</a></h2>
<% }else { %>
	<h2 align="center"><a href = "/NHMP/index.jsp">홈으로 이동</a></h2>
	<h2 align="center"><a href = "/NHMP/views/Main/login.jsp">로그인 페이지로 이동</a></h2>
<% } %>




</body>
</html>