<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ERP.Employee.model.vo.Employee"%>
<%
	Employee emp = (Employee)request.getAttribute("emp");
	String deptName = (String)request.getAttribute("deptName");
	String posName = (String)request.getAttribute("posName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input[type=password]{
		width:200px;
	}
	body{
		background:white;
	}
	table, th, tr, td{
		border:1px solid gray;
	}
	
	th{
		background: rgb(117, 113, 249, 0.5);
      	color:rgba(0, 0, 0, 1);
    	font-size: 13pt;
    	text-align:center;
    	
	}
	td{
		background:
	}
	.button{
		width:100%;
		text-align:center;
		margin-top:15px;
	}
	#buttons{
	width:50px;

    background-color: #7571f9;

    border: none;

    color:#fff;

	border-radius:3px;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

	}
	
	img {
		border-radius:3px;
	}
</style>
<script type="text/javascript" src="/lp/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
});
function checkPwd(){
	
	var passRule = /^[A-Za-z0-9]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식

	if(!passRule.test($("input[name=newpwd]").val())) {
    //경고
 		alert("숫자와 문자 포함 형태의 6~12자리 이내로 입력하셔야 합니다");
    	return false;
    	$("input[name=newpwd]").select();
		}else{
		return true;
		}
}


</script>
</head>
<body>
<form action="/lp/uppwd" method="post" onsubmit="return checkPwd();">
<input type="hidden" name="empid" value="<%=emp.getEmpId() %>">
<h3>사용자기본정보</h3>
<table class="uppwd" cellspacing="0"  cellpadding="3" width="100%">
	<%if(emp.getEmpRenameFilename() != null){ %>
	<tr>
		<td colspan="4" rowspan="5"><img alt="xx" src="/lp/resources/emp_Img_file/<%=emp.getEmpRenameFilename() %>"
			 width="100%"height="200px"></td>
	</tr>
	<%}else{ %>
	<tr>
		<td rowspan="5"><img alt="xx" src="/lp/resources/images/testimonial2.jpg" width="100%" height="200px"></td>
	</tr>
	<%} %>
	<tr>
		<th>사원명</th>
		<td><%= emp.getEmpName() %></td>
	</tr>
	<tr>
		<th>부서</th>
		<td><%=deptName%></td>
	</tr>
	<tr>
		<th>사번</th>
		<td><%= emp.getEmpId() %></td>
	</tr>
	<tr>
		<th>직급</th>
		<td><%= posName %></td>
	</tr>
</table>
<h3>비밀번호 초기화</h3>
<table class="uppwd" cellspacing="0" cellpadding="3" width="100%">
	<tr>
		<th>초기화 비밀번호 입력</th>
		<td><input type="password" name="newpwd" placeholder="내용을 입력해주세요"></td>
	</tr>
</table>
	<div class="button">
	<input type="submit" id="buttons"value="확인" onclick="javascript:self.close();">&nbsp;<input type="button"id="buttons" value="취소" onclick="javascript:self.close();">
	</div>
</form>
</body>
</html>