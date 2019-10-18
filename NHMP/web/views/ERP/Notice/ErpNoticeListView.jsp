<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.notice.model.vo.Notice, java.util.ArrayList" %>
<% //스크립트릿(scriptlet) 태그라고 함
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<style type="text/css">
div.searchbox {
	border : 1px solid blue;
	width : 600px;
	height : 120px;
	background : ivory;
	padding : 0;
}
</style>
<script type="text/javascript" src="/NHMP/resources/ERP/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	showDiv();
	
	$("input[name=item]").on("change", function(){
		showDiv();
	});
});

function showDiv(){
	if($("input[name=item]").eq(0).is(":checked")){
		$("#titlediv").css("display", "block");
		$("#writerdiv").css("display", "none");
		$("#datediv").css("display", "none");
	}
	
	if($("input[name=item]").eq(1).is(":checked")){
		$("#titlediv").css("display", "none");
		$("#writerdiv").css("display", "block");
		$("#datediv").css("display", "none");
	}
	
	if($("input[name=item]").eq(2).is(":checked")){
		$("#titlediv").css("display", "none");
		$("#writerdiv").css("display", "none");
		$("#datediv").css("display", "block");
	}
}
</script>
</head>
<body>
<h1 align="center">공지사항 전체 목록 보기 : <%= list.size() %> 개</h1>
<h3 align="center"><a href="/NHMP/nlist">전체 목록 보기</a></h3>
<center>
<div class="searchbox">
<div>
	<h2>검색할 항목을 선택하시오.</h2>
	<input type="radio" name="item" value="title" checked> 제목 &nbsp; &nbsp; &nbsp; 
	<input type="radio" name="item" value="writer"> 작성자 &nbsp; &nbsp; &nbsp; 
	<input type="radio" name="item" value="date"> 날짜
</div>
<div id="titlediv">
	<form action="/NHMP/nsearch" method="post">
		<input type="hidden" name="search" value="title">
		<label>검색할 제목을 입력하시오 : 
		<input type="search" name="keyword"></label>
		<input type="submit" value="검색">
	</form>
</div>
<div id="writerdiv">
	<form action="/NHMP/nsearch" method="post">
		<input type="hidden" name="search" value="writer">
		<label>검색할 작성자 아이디를 입력하시오 : 
		<input type="search" name="keyword"></label>
		<input type="submit" value="검색">
	</form>
</div>
<div id="datediv">
	<form action="/NHMP/nsearch" method="post">
		<input type="hidden" name="search" value="date">
		<label>검색할 날짜를 선택하시오 : 
		<input type="date" name="from"> ~ <input type="date" name="to"></label>
		<input type="submit" value="검색">
	</form>
</div>
</div>
</center>
<br>
<table align="center" width="600" border="1" cellspacing="0" cellpadding="5">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성날짜</th>
	<th>조회수</th>
</tr>
<% for(Notice n : list){ %>
<tr>
	<th><%= n.getNoticeNo() %></th>
	<td><a href="/NHMP/ndetail?no=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a></td>
	<td><%= n.getNoticeWriter() %></td>
	<td align="center">
		<%= n.getNoticeDate() %>
	</td>
	<td><%= n.getNoticeCount() %></td>
</tr>
<% } %>

</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
