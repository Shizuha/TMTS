<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.medicienRecord.model.vo.MedicienRecord" %>
<%
	MedicienRecord medicienRecord = (MedicienRecord)request.getAttribute("medicienRecord");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script type="text/javascript">
function moveupdate(){
	location.href = "/NHMP/views/ERP/medicienRecord/MedicienRecordUpdateView.jsp";
	return false
}
function movedelete(){
	location.href = "/NHMP/medicienRecord?mr_no=<%= medicienRecord.getMrNo() %>&rfile=<%= medicienRecord.getMrRenameFileName() %>";
	return false;
}
function movemain(){
	location.href = "/NHMP/views/ERP/Admin_main.jsp";
	return false;
}
</script>
</head>
<body>
<h1 align="center">환자 상담일지 상세조회 페이지</h1>
<form action="/NHMP/recorddetail" method="post" enctype="multipart/form-data"> 
<table align="center" width="600" cellspacing="0" cellpadding="5" border="3">
<tr><th>투약일지번호</th><td><a href="/NHMP/recorddetail?cl_no=<%= medicienRecord.getMrNo() %>"><input type="number" name="mr_no" id="mr_no"
value="<%= medicienRecord.getMrNo() %>"></a></td></tr>
<tr><th>날짜</th><td><input type="text" name="mr_date" id="mr_date"
value="<%= medicienRecord.getMrDate() %>"></td></tr>
<tr><th>증상</th><td><input type="date" name="mr_date" id="mr_date"
value="<%= medicienRecord.getMrState() %>"></td></tr>
<tr><th>투약명</th><td><input type="text" name="mr_state" id="mr_state"
value="<%= medicienRecord.getMrName() %>"></td></tr>
<tr><th>투약시간</th><td><input type="tel" name="mr_time" id="mr_time"
value="<%= medicienRecord.getMrTime() %>"></td></tr>
<tr><th>용량</th><td><input type="text" name="mr_many" id="mr_many"
value="<%= medicienRecord.getMrMany() %>"></td></tr>
<tr><th>비고</th><td><input type="text" name="mr_comment" id=""mr_comment""
value="<%= medicienRecord.getMrComment() %>"></td></tr>
<tr><th>환자명</th><td><input type="text" name="mr_pat_name" id="mr_pat_name"
value="<%= medicienRecord.getMrPatName() %>"></td></tr>
<tr><th>투약자</th><td><input type="text" name="mr_emp_name" id="mr_emp_name"
value="<%= medicienRecord.getMrEmpName() %>"></td></tr>
<tr><th>첨부파일</th>
<td>
	<% if(medicienRecord.getMrOriginalFileName() != null){ %>
		<a href="/NHMP/recordfdown?ofile=<%= medicienRecord.getMrOriginalFileName() %>&rfile=<%= medicienRecord.getMrRenameFileName() %>"><%= medicienRecord.getMrOriginalFileName() %></a>
	<% }else{ %>
		첨부파일 없음
	<% } %>
	<input type="file" name="rfile">
</td></tr>
<tr>
<th colspan="2">
<input type="button" value="수정하기" onclick="return moveupdate();"> &nbsp; &nbsp; &nbsp;
<input type="submit" value="삭제" onclick="return movedelete();"> &nbsp; &nbsp; &nbsp; 
<input type="button" value="목록" onclick="return movemain();">&nbsp; &nbsp; &nbsp;
<a href="javascript:history.go(-1);">이전페이지로 이동</a>
</th></tr>
</table>
</form>
</body>
</html>