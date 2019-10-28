<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ERP.patient.model.vo.Patient"%>
<%
	Patient loginPatient = (Patient)session.getAttribute("loginPatient");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NHMP</title>		<!-- 환자 수정 -->	
</head>
<body>
<h1 align="center"><%= loginPatient.getPatName() %>님의 환자정보 수정페이지</h1>
<br>
<form action="/NHMP/patientupdate" method="post">
<table align="center" width="600" cellspacing="0" cellpadding="5" border="1">
<tr><th>병록번호</th><td><input type="number" name="pat_num" id="pat_num"
value="<%= loginPatient.getPatNum() %>"></td></tr>
<tr><th>환자명</th><td><input type="text" name="pat_name" id="pat_name" 
value="<%= loginPatient.getPatName() %>"></td></tr>
<tr><th>주소</th><td><input type="text" name="address"
value="<%= loginPatient.getAddress() %>"></td></tr>
<tr><th>보호자명</th><td><input type="text" name="family" 
value="<%= loginPatient.getFamily() %>"></td></tr>
<tr><th>이메일</th><td><input type="email" name="email" 
value="<%= loginPatient.getEmail() %>"></td></tr>
<tr><th>전화번호</th><td><input type="tel" name="pat_phone"
value="<%= loginPatient.getPatPhone() %>"></td></tr>

<tr><th colspan="2">
	<input type="submit" value="수정하기"> &nbsp;
	<input type="reset" value="작성취소"> &nbsp;
	<a href="javascript:history.go(-1);">이전 페이지로 이동</a>
</th></tr>
</table>
</form>
</body>
</html>