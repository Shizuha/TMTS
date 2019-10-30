<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script type="text/javascript">
function movemain(){
	location.href = "/NHMP/views/ERP/Employee.jsp";
	return false;
}
</script>
</head>
<body>
<h2 align="center">상담일지 수정 페이지</h2>
<form action="/NHMP/counselupdate" method="post" enctype="multipart/form-data">
<table align="center" width="1000" border="3" cellspacing="0" cellpadding="3">
<tr><th>상담일지번호</th><td><input type="number" name="cl_no"></td></tr>
<tr><th>제목</th><td><input type="text" name="cl_title"></td></tr>
<tr><th>날짜</th><td><input type="date" name="cl_date"></td></tr>
<tr><th>내용</th><td><input type="text" name="cl_contents"></td></tr>
<tr><th>연락처</th><td><input type="tel" name="cl_phone"></td></tr>
<tr><th>비고</th><td><input type="text" name="cl_comment"></td></tr>
<tr><th>환자명</th><td><input type="text" name="cl_pat_name"></td></tr>
<tr><th>상담자</th><td><input type="text" name="cl_emp_name"></td></tr>
<tr><th>첨부파일</th><td><input type="file" name="cl_original_filename"></td></tr>
<tr>
<th colspan="2">
<input type="submit" value="수정하기"> &nbsp; &nbsp;
<input type="reset" value="취소하기"> &nbsp; &nbsp;
<input type="button" value="목록" onclick="return movemain();"> &nbsp; &nbsp;
<a href="javascript:history.go(-1);">이전페이지로 이동</a>
</th></tr>
</table>
</form>
</body>
</html>