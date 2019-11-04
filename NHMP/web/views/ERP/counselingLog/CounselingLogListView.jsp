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
$(function(){
	showDiv();
	
	$("input[name=click]").on("change", function(){
		showDiv();
	});
});

function showDiv(){
	if($("input[name=click]").eq(0).is(":checked")){
		$("#cl_title_div").css("display", "block");
		$("#cl_emp_name_div").css("display", "none");
	}
	
	if($("input[name=click]").eq(1).is(":checked")){
		$("#cl_title_div").css("display", "none");
		$("#cl_emp_name_div").css("display", "block");
	}
}

function moveinsert(){
	location.href = "/NHMP/views/ERP/counselingLog/CounselingLogInsertView.jsp";
	return false;
}

function movemain(){
	location.href = "/NHMP/views/ERP/Admin_main.jsp";
	return false;
}
</script>
</head>
<body>
<h2 align="center">상담일지 전체 목록 : <%= list.size() %> 개</h2>
<center>
<div class="searchbox">
<div>
	<h2>검색할 항목을 선택하세요</h2>
	<input type="radio" name="click" value="cl_title" checked> 제목 &nbsp; &nbsp; &nbsp;
	<input type="radio" name="click" value="cl_emp_name"> 상담자 &nbsp; &nbsp; &nbsp;
</div>
	<div id="cl_title_div">
		<form action="/NHMP/counselsearch" method="post">
		<input type="hidden" name="search" value="cl_title">
		<label>검색할 제목을 입력하시오 : 
		<input type="search" name="cl_title"></label>
		<input type="submit" value="검색">
		</form>
	</div>
	<div id="cl_emp_name_div">
		<form action="/NHMP/counselsearch" method="post">
		<input type="hidden" name="search" value="cl_emp_name">
		<label>검색할 상담자를 입력하시오 : 
		<input type="search" name="cl_emp_name"></label>
		<input type="submit" value="검색">
		</form>
	</div>
</div>
</center>
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