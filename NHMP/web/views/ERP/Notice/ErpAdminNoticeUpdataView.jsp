<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.notice.model.vo.Notice" %>
<%
	Notice notice = (Notice)request.getAttribute("notice");
	int currentPage = (Integer)request.getAttribute("currentPage");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script type="text/javascript">
function movelist(){
	location.href = "/NHMP/blist?page=<%= currentPage %>";
	return false;
}
</script>
</head>
<body>
<h2 align="center"><%= notice.getNoticeNo() %>번 게시글 수정 페이지 </h2>
<table align="center" border="1" cellspacing="0" cellpadding="3">
<form action="/NHMP/nupdate" method="post">
<input type="hidden" name="page" value="<%= currentPage %>">
<input type="hidden" name="no" value="<%= notice.getNoticeNo() %>">
<tr><th>제목</th><td><input type="text" name="title" value="<%= notice.getNoticeTitle()%>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" name="writer" value="<%= notice.getNoticeWriter() %>" readonly></td></tr>
<tr><th>내용</th>
<td><textarea rows="5" cols="70" name="content"><%= notice.getNoticeContent() %></textarea></td></tr>
<tr><th colspan="2"> 
	<input type="submit" value="글수정" > &nbsp; 
	<input type="reset" value="작성취소"> &nbsp; 
	<input type="button" value="목록" onclick="history.go(-1);"> &nbsp;
	<input type="button" value="이전 페이지로" onclick="history.go(-1); return false;">
</th></tr>
</form>
</table>




</body>
</html>