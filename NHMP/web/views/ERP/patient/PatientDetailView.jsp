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
<title>TMTS</title>
<script type="text/javascript">
function moveupdate(){
	location.href = "/NHMP/views/ERP/patient/PatientUpdateView.jsp";
	return false;
}

function movedelete(){
	location.href = "/NHMP/patientdelete?pat_num=<%= patient.getPatNum() %>";
	return false;
}

function movemain(){
	location.href = "/NHMP/views/ERP/Admin_main.jsp";
	return false;
}
</script>
</head>
<body>
<h2 align="center">환자 상세조회 페이지</h2>
<form action="/NHMP/patientdetail" method="post">
<table align="center" width="800" border="3" cellspacing="0" cellpadding="5">
<tr><th>병록번호</th><td><input type="number" name="pat_num"></td></tr>
<tr><th>환자명</th><td><input type="text" name="pat_name"></td></tr>
<tr><th>구분</th><td><input type="text" name="pat_type"></td></tr>
<tr><th>입원날짜</th><td><input type="date" name="pat_entdate"></td></tr>
<tr><th>퇴원날짜</th><td><input type="date" name="pat_outdate"></td></tr>
<tr><th>환자성별</th><td>
<input type="radio" name="pat_gender" value="M"> 남자 &nbsp;
<input type="radio" name="pat_gender" value="F"> 여자
</td></tr>
<tr><th>주민번호</th><td><input type="text" name="pat_no"></td></tr>
<tr><th>주소</th><td><input type="text" name="address"></td></tr>
<tr><th>보호자명</th><td><input type="text" name="family"></td></tr>
<tr><th>이메일</th><td><input type="email" name="email"></td></tr>
<tr><th>전화번호</th><td><input type="tel" name="pat_phone"></td></tr>
<tr><th>병동</th><td><input type="text" name="ward"></td></tr>
<tr><th>담당의사</th><td><input type="text" name="pat_doc"></td></tr>
<tr>
<th colspan="2">
<input type="button" value="수정하기" onclick="return moveupdate();"> &nbsp; &nbsp; &nbsp;
<input type="button" value="삭제하기" onclick="return movedelete();"> &nbsp; &nbsp; &nbsp;
<input type="button" value="목록" onclick="return movemain();"> &nbsp; &nbsp; &nbsp;
<a href="javascript:history.go(-1)">이전페이지로 이동</a>
</th></tr>
</table>
</form>
</body>
</html>