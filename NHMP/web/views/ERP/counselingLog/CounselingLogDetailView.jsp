<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.counselingLog.model.vo.CounselingLog" %>
<%
	CounselingLog counselingLog = (CounselingLog)request.getAttribute("counselingLog");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script type="text/javascript">
function moveupdate(){
	location.href = "/NHMP/counselupdate";
	return false
}
</script>
</head>
<body>
<h1 align="center">환자 상담일지 상세조회 페이지</h1>
<form action="/NHMP/counseldetail" method="post" enctype="multipart/form-data"> 
<table align="center" width="600" cellspacing="0" cellpadding="5" border="3">
<tr><th>상담일지번호</th><td><a href="/NHMP/counseldetail?cl_no=<%= counselingLog.getClNo() %>"><input type="number" name="cl_no" id="cl_no"
value="<%= counselingLog.getClNo() %>"></a></td></tr>
<tr><th>제목</th><td><input type="text" name="cl_title" id="cl_title"
value="<%= counselingLog.getClTitle() %>"></td></tr>
<tr><th>날짜</th><td><input type="date" name="cl_date" id="cl_date"
value="<%= counselingLog.getClDate() %>"></td></tr>
<tr><th>내용</th><td><input type="text" name="cl_name" id="cl_name"
value="<%= counselingLog.getClContents() %>"></td></tr>
<tr><th>연락처</th><td><input type="tel" name="cl_phone" id="cl_phone"
value="<%= counselingLog.getClPhone() %>"></td></tr>
<tr><th>비고</th><td><input type="text" name="cl_comment" id="cl_comment"
value="<%= counselingLog.getClComment() %>"></td></tr>
<tr><th>환자명</th><td><input type="text" name="cl_pat_name" id="cl_pat_name"
value="<%= counselingLog.getClPatName() %>"></td></tr>
<tr><th>상담자</th><td><input type="text" name="cl_emp_name" id="cl_emp_name"
value="<%= counselingLog.getClEmpName() %>"></td></tr>
<tr><th>첨부파일</th>
<td>
	<% if(counselingLog.getClOriginalFileName() != null){ %>
		<a href="/NHMP/counselfdown?ofile=<%= counselingLog.getClOriginalFileName() %>&rfile=<%= counselingLog.getClRenameFileName() %>"><%= counselingLog.getClOriginalFileName() %></a>
	<% }else{ %>
		첨부파일 없음
	<% } %>
</td></tr>
<tr>
<th colspan="2">
<input type="button" value="수정하기" onclick="return moveupdate();">
<input type="submit" value="삭제" onclick="return movedelete();">
<input type="button" value="목록" onclick="return movemain();">
<a href="javascript:history.go(-1);">이전페이지로 이동</a>
</th></tr>
</table>
</form>
</body>
</html>