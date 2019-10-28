<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
</head>
<body>
<h2 align="center">상담일지 등록 페이지</h2>
<form action="/NHMP/counselinsert" method="post" onsubmit="return validation();">
<table align="center" width="600" cellspacing="0" cellpadding="5">
<tr><th>상담일지번호</th><td><input type="number" name="cl_no" id="cl_no" required></td></tr>
<tr><th>제목</th><td><input type="text" name="cl_title" id="cl_title" required></td></tr>
<tr><th>날짜</th><td><input type="date" name="cl_date" id="cl_date" required></td></tr>
<tr><th>내용</th><td><input type="text" name="cl_contents" id="cl_contents" required></td></tr>
<tr><th>연락처</th><td>
<select>
<option value="010" name="fphone">010
<option value="011" name="fphone">011
<option value="016" name="fphone">016
<option value="019" name="fphone">019
</select>
<input type="tel" name="mphone" maxlength="4"> - <input type="tel" name="lphone" maxlength="4">
</td></tr>
<tr><th>비고</th><td><input type="text" name="cl_comment" id="cl_comment" required></td></tr>
<tr><th>환자명</th><td><input type="text" name="cl_pat_name" id="cl_pat_name" required></td></tr>
<tr><th>상담자</th><td><input type="text" name="cl_emp_name" id="cl_emp_name" required></td></tr>
<tr><th>첨부파일</th><td><input type="file" name="cl_original_filename" id="cl_original_filename" ></td></tr>
<tr>
<th colspan="2" align="center">
<input type="submit" value="등록하기">
<input type="reset" value="취소하기">
<input type="button" value="목록" onclick="return clList();">
<a href="javascript:history.go(-1)">이전페이지로 이동</a></th>
</tr>
</table>
</form>
</body>
</html>