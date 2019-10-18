<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="ERP.notice.model.vo.Notice" %> 
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
</head>
<body>
	<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr><th colspan="4"><%= notice.getNoticeNo() %>번 공지사항 화면</th></tr>
	<tr><th >제목</th><td><%= notice.getNoticeTitle() %></td><th>조회수</th><td><%= notice.getNoticeCount() %></td></tr>
	<tr><th>작성자</th><td colspan="3"><%= notice.getNoticeWriter() %></td></tr>
	<tr><th>등록날짜</th><td colspan="3"><%= notice.getNoticeDate() %></td></tr>
	<tr><th>내용</th><td colspan="3"><%= notice.getNoticeContent() %></td></tr>
	<tr><th colspan="4"><a href="/NHMP/nlist">목록으로 이동</a></th></tr>
	</table>
</body>
</html>











