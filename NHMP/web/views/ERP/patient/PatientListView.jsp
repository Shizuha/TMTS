<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.patient.model.vo.Patient, java.util.ArrayList" %>
<%
	ArrayList<Patient> list = (ArrayList<Patient>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script type="text/javascript">
function movemain(){
	location.href = "/NHMP/views/ERP/Admin_main.jsp";
	return false;
}
</script>		
</head>
<body>
<h2 align="center">환자 전체 목록 : <%= list.size() %> 명</h2>
<table align="center" border="1" cellspacing="1" cellpadding="5">
<tr>
	<th>병록번호</th>
	<th>환자명</th>
	<th>구분</th>
	<th>입원날짜</th>
	<th>퇴원날짜</th>
	<th>환자성별</th>
	<th>주민번호</th>
	<th>주소</th>
	<th>보호자명</th>
	<th>이메일</th>
	<th>전화번호</th>
	<th>병동</th>
	<th>담당의사</th>
</tr>
<% for(int i = 0; i < list.size(); i++){
	Patient p = list.get(i);
%> 
<tr>
	<td><a href="/NHMP/patientdetail?pat_num=<%= p.getPatNum() %>"><%= p.getPatNum() %></a></td>
	<td><%= p.getPatName() %></td>
	<td><%= p.getPatType() %></td>
	<td><%= p.getPatEntDate() %></td>
	<td><%= p.getPatOutDate() %></td>
	<td><%= p.getPatGender() %></td>
	<td><%= p.getPatNo() %></td>
	<td> <%= p.getAddress() %></td>
	<td><%= p.getFamily() %></td>
	<td> <%= p.getEmail() %></td>
	<td><%= p.getPatPhone() %></td>
	<td><%= p.getWard() %></td>
	<td><%= p.getPatDoc() %></td>
</tr>
<% } %>
<tr>
<th colspan="30" align="center">
<input type="button" value="목록" onclick="return movemain();"> &nbsp; &nbsp; &nbsp;
<a href="javascript:history.go(-1)">이전페이지로 이동</a>
</table>

</body>
</html>