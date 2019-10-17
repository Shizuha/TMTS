<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="ERP.counselingLog.model.vo.CounselingLog" %>
<%
	CounselingLog cl = (CounselingLog) request.getAttribute("cl");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CounselingLog</title>
<!-- 상담일지 등록 페이지 -->
</head>
<body>
	<h1 align="center">환자 상담일지 등록 페이지</h1>
	<table align="center" width="600" border="1" cellspacing="0"
		cellpadding="5">
		<form acion="/NHMP/counselinsert" method="post"
			enctype="multipart/form-data">

			<tr>
				<th>상담일지번호</th>
				<th>날짜</th>
				<th>내용</th>
				<th>연락처</th>
				<th>비고</th>
				<th>환자명</th>
				<th>상담자</th>
				<th>첨부파일</th>
			</tr>

			<tr>
				<td><input type="text" name="cl_no"></td>
				<td><%-- <%= cl.getClDate() %> --%></td>
				<td><textarea rows="5" colse="70" name="cl_name"></textarea></td>
				<td><input type="tel" name="cl_phone"></td>
				<td><input type="text" name="cl_comment"></td>
				<td><input type="text" name="cl_pat_name"
					value="<%-- <%=cl.getClPatName()%> --%>"></td>
				<td><input type="text" name="cl_emp_name"
					value="<%-- <%=cl.getClEmpName()%> --%>"></td>
				<td><input type="file" name="clupfile"></td>
			</tr>

			<tr>
				<th colspan="10"><input type="submit" value="등록하기">
					&nbsp; <input type="reset" value="등록취소"> &nbsp; <a
					href="javascript:history.go(-1);">이전 페이지로 이동</a></th>
			</tr>
</form>
</table>
</body>
</html>