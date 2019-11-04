<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.medicienRecord.model.vo.MedicienRecord, java.util.ArrayList" %>
<%
	ArrayList<MedicienRecord> list = (ArrayList<MedicienRecord>)request.getAttribute("list");
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
		$("#mr_pat_name_div").css("display", "block");
		$("#mr_emp_name_div").css("display", "none");
	}
	
	if($("input[name=click]").eq(1).is(":checked")){
		$("#mr_pat_name_div").css("display", "none");
		$("#mr_emp_name_div").css("display", "block");
	}
}

function moveinsert(){
	location.href = "/NHMP/views/ERP/medicienRecord/MedicienRecordInsertView.jsp";
	return false;
}

function movemain(){
	location.href = "/NHMP/views/ERP/Admin_main.jsp";
	return false;
}
</script>
</head>
<body>
<h2 align="center">투약일지 전체 목록 : <%= list.size() %> 개</h2>
<center>
<div class="searchbox">
<div>
	<h2>검색할 항목을 선택하세요</h2>
	<input type="radio" name="click" value="mr_pat_name" checked> 환자명 &nbsp; &nbsp; &nbsp;
	<input type="radio" name="click" value="mr_emp_name"> 투약자 &nbsp; &nbsp; &nbsp;
</div>
	<div id="mr_pat_name_div">
		<form action="/NHMP/recordsearch" method="post">
		<input type="hidden" name="search" value="mr_pat_name">
		<label>검색할 환자명을 입력하시오 : 
		<input type="search" name="mr_pat_name"></label>
		<input type="submit" value="검색">
		</form>
	</div>
	<div id="mr_emp_name_div">
		<form action="/NHMP/recordsearch" method="post">
		<input type="hidden" name="search" value="mr_emp_name">
		<label>검색할 투약자를 입력하시오 : 
		<input type="search" name="mr_emp_name"></label>
		<input type="submit" value="검색">
		</form>
	</div>
</div>
</center>
<table align="center" border="1" cellspacing="1" cellpadding="5">
<tr>
	<th>투약일지번호</th>
	<th>날짜</th>
	<th>증상</th>
	<th>투약명</th>
	<th>투약시간</th>
	<th>용량</th>
	<th>비고</th>
	<th>환자명</th>
	<th>투약자</th>
</tr>
<% for(int i = 0; i < list.size(); i++){
	MedicienRecord mr = list.get(i);
%>
<tr>
	<td align="center"><a href="/NHMP/recorddetail?mr_no=<%= mr.getMrNo() %>"><%= mr.getMrNo() %></a></td>
	<td><%= mr.getMrDate() %></td>
	<td><%= mr.getMrState() %></td>
	<td><%= mr.getMrName() %></td>
	<td><%= mr.getMrTime() %></td>
	<td><%= mr.getMrMany() %></td>
	<td><%= mr.getMrComment() %></td>
	<td><%= mr.getMrPatName() %></td>
	<td><%= mr.getMrEmpName() %></td>
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