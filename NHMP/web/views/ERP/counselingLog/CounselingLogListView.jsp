<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.counselingLog.model.vo.CounselingLog, java.util.ArrayList" %>
<%
	ArrayList<CounselingLog> list = (ArrayList<CounselingLog>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script type="text/javascript">
function moveinsert(){
	location.href = "/NHMP/views/ERP/counselingLog/CounselingLogInsertView.jsp";
	return false;
}
function movemain(){
	location.href = "/NHMP/views/ERP/Employee.jsp";
	return false;
}
</script>
</head>
<body>
<h2 align="center">상담일지 전체 목록 : <%= list.size() %> 개</h2>
<table align="center" border="1" cellspacing="1" cellpadding="5">
<tr>
	<th>상담일지번호</th>
	<th>제목</th>
	<th>날짜</th>
	<th>내용</th>
	<th>연락처</th>
	<th>비고</th>
	<th>환자명</th>
	<th>상담자</th>
	<th>첨부파일</th>
</tr>
<% for(int i = 0; i < list.size(); i++){
	CounselingLog cl = list.get(i);
%>
<tr>
	<td align="center"><a href="/NHMP/counseldetail?cl_no=<%= cl.getClNo() %>"><%= cl.getClNo() %></a></td>
	<td><%= cl.getClTitle() %></td>
	<td><%= cl.getClDate() %></td>
	<td><%= cl.getClContents() %></td>
	<td><%= cl.getClPhone() %></td>
	<td><%= cl.getClComment() %></td>
	<td><%= cl.getClPatName() %></td>
	<td><%= cl.getClEmpName() %></td>
	<td><%= cl.getClOriginalFileName() %></td>
</tr>
<% } %> 
<tr>
<th colspan="30">
<input type="button" value="등록하기" onclick="return moveinsert();"> &nbsp; &nbsp;
<input type="reset" value="취소"> &nbsp; &nbsp;
<input type="button" value="목록" onclick="return movemain();"> &nbsp; &nbsp;
<a href="javascript:history.go(-1);">이전페이지로 이동</a>
</th>
</tr>
</table>
</body>
</html>