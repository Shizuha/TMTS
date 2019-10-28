<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.medicienRecord.model.vo.MedicienRecord" %>
<%
	MedicienRecord mr = (MedicienRecord)request.getAttribute("mr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MedicienRecord</title>	<!-- 투약일지 등록페이지 -->
</head>
<body>
<h1 align="center">환자 투약일지 등록 페이지</h1>
	<table align="center" width="600" border="1" cellspacing="0"
		cellpadding="5">
		<form acion="/NHMP/recordinsert" method="post"
			enctype="multipart/form-data">

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

			<tr>
				<td><input type="text" name="mr_no"></td>
				<td><input type="date" name="mr_date"></td>
				<td><input type="text" name="mr_state"></td>
				<td><input type="text" name="mr_name"></td>
				<td><input type="text" name="mr_time"></td>
				<td><input type="text" name="mr_many"></td>
				<td><textarea rows="5" colse="70" name="mr_comment"></textarea></td>
				<td><input type="text" name="mr_pat_name"></td>
				<td><input type="text" name="mr_emp_name"></td>
			</tr>

			<tr>
				<th colspan="10">
				<input type="button" value="조회하기" onclick="return movelist();">
				<input type="submit" value="등록하기">
					&nbsp; <input type="reset" value="등록취소"> &nbsp; <a
					href="javascript:history.go(-1);">이전 페이지로 이동</a></th>
			</tr>
</form>
</table>

</body>
</html>