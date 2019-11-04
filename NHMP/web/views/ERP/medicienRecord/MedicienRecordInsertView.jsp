<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script type="text/javascript">
function movemain(){
	location.href = "/NHMP/views/ERP/Admin_main.jsp";
	return false;
}
</script>
</head>
<body>
<h2 align="center">투약일지 등록 페이지</h2>
<form action="/NHMP/recordinsert" method="post" enctype="multipart/form-data">
<table align="center" width="800" border="3" cellspacing="0" cellpadding="5">
<tr><th>투약일지번호</th><td><input type="number" name="mr_no"></td></tr>
<tr><th>날짜</th><td><input type="date" name="mr_date"></td></tr>
<tr><th>증상</th><td><input type="text" name="mr_state"></td></tr>
<tr><th>투약명</th><td><input type="text" name="mr_name"></td></tr>
<tr><th>투약시간</th><td><input type="text" name="mr_time"></td></tr>
<tr><th>용량</th><td><input type="text" name="mr_many"></td></tr>
<tr><th>비고</th><td><input type="text" name="mr_comment"></td></tr>
<tr><th>환자명</th><td><input type="text" name="mr_pat_name"></td></tr>
<tr><th>투약자</th><td><input type="text" name="mr_emp_name"></td></tr>
<tr><th>첨부파일</th><td><input type="file" name="mr_original_filename"></td></tr>
<tr>
<th colspan="2" align="center">
<input type="submit" value="등록하기">
<input type="reset" value="취소하기">
<input type="button" value="목록" onclick="return movemain();">
<a href="javascript:history.go(-1)">이전페이지로 이동></a>
</th></tr>
</table>
</form>
</body>
</html>