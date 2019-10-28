<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.patient.model.vo.Patient" %>
<%
	Patient patient = (Patient)request.getAttribute("patient");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title> <!-- 환자 상세조회 -->
</head>
<body>
<h1 align="center"><%= patient.getPatName() %>님의 환자정보 상세조회 페이지</h1>
<br>
<form action="/NHMP/patientdetail" method="post">
<table align="center" width="600" cellspacing="0" cellpadding="5" border="1">
<tr><th>병록번호</th><td><iuput type="nubmer" name="patnum" id="patnum" readonly value="<%= patient.getPatNum() %>"></td></tr>
<tr><th>환자명</th><td><input type="text" name="patname" id="patname" readonly value="<%= patient.getPatName() %>"></td></tr>
<tr><th>구분</th><td>
<input type="radio" name="pattype"  value="enter" checked>입원 &nbsp;
<input type="radio" name="pattype"  value="outer">퇴원 &nbsp;
</td></tr>
<tr><th>입원날짜</th><td>
<input type="date" name="patentdate" value="<%= patient.getPatEntDate() %>" readonly>
</td></tr>
<tr><th>퇴원날짜</th><td>
<input type="date" name="patoutdate" value="<%= patient.getPatOutDate() %>" readonly>
</td></tr>
<tr><th>환자성별</th>
<td>
<% if(patient.getPatGender().equals("M") == true){ %>
<input type="radio" name="patgender" value="M" required checked>남자 &nbsp;
<input type="radio" name="patgender" value="F" required>여자 &nbsp;
<% }else{ %>
<input type="radio" name="patgender" value="M" required>남자 &nbsp;
<input type="radio" name="patgender" value="F" required checked>여자
<% } %>
</td></tr>
<tr><th>주민번호</th><td>
<input type="text" name="patnobf" maxlength="7">-
<input type="text" name="patnoaf" maxlength="8">
</td></tr>
<tr><th>주소</th><td>
주소API</td></tr>
<tr><th>보호자명</th><td>
<input type="text" name="family" value="<%= patient.getFamily() %>">
</td></tr>
<tr><th>이메일</th><td>
<input type="email" name="email" value="<%= patient.getEmail() %>">
</td></tr>
<tr><th>전화번호</th><td>
<input type="tel" name="patphone" value="<%= patient.getPatPhone() %>">
</td></tr>
<tr><th>병동</th><td>
<input type="text" name="ward" value="<%= patient.getWard() %>">
</td></tr>
<tr><th>담당의사</th><td>
<input type="text" name="patdoc" value="<%= patient.getPatDoc() %>">
</td></tr>
</table>
</form>
</body>
</html>