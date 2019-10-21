<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
	page
	import="Main.NursingHospital.model.ov.NursingHospital, java.util.ArrayList, ERP.Allowance.model.vo.Allowance"%>

<%
	NursingHospital loginHospital = (NursingHospital)session.getAttribute("loginHospital");
	ArrayList<Allowance> list = (ArrayList<Allowance>)request.getAttribute("list");
	String Bnum = (String)request.getAttribute("Bnum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수식 지정</title>

<style type="text/css">
#div_root{
	width:540px;
	height:600px;
	align:center;
}
#top{
	width:100%;
	height:33%;
}
#mid_l{
	float:left;
	width:260px;
	height:33%;
	text-align:center;
	font-weight:bold;
}
#mid_r{
	float:right;
	width:260px;
	height:33%;
	text-align:center;
	font-weight:bold;
	
}
#bottom{
	width:100%;
	height:33%;
}
#calcT input{
	width:50px;
	height:30px;
	
}

</style>
<script type="text/javascript" src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var result = "";
var calc = "";
var Bnum = <%= Bnum %>;

$(function(){
	$(".numB").click(function(){
		calc += $(this).val();
		$("#Fwindow").val(calc);
		return false;
	});
	
	$(".sing").click(function(){
		calc += $(this).val();
		$("#Fwindow").val(calc);
		return false;
	});
	
	$(".result").click(function(){
		var result = eval(calc);
		$("#Fwindow").val(result);
		return false;
	});
	
	$("#resetBTN").click(function(){
		calc = "";
		$("#Fwindow").val(calc);
		return false;
	});
	
	$("#savebtn").click(function(){
		$(opener.document).find('#AFormula'+Bnum+'').val(calc);
		window.close();
	});
		
});

function Acode(acode){
	console.log(Acode);
	$.ajax({
		url : "/NHMP/aone",
		type: "post",
		data : {acode : acode},
		dataType : "json",
		success : function(data){
			calc+=data.Formula;
			$("#Fwindow").val(calc);
		}, error : function(jqXHR, textStatus, errorThrown ){
			console.log("error : " + jqXHR + ", " + textStatus + ", " +errorThrown);
		}
	})
}

function Bcode(T01){
	calc+=T01;
	$("#Fwindow").val(calc);
}




</script>

</head>
<body>
	<div id="div_root">
		<div id="top">
			<table width="130px" cellspacing="0" cellpadding="5" border="1"	id="deduction_talbe" style="float: left;">
				<th width="auto"><a style="text-align: center;">기본급</a></th>
				<tr align="center">
					<td width="150px"><a herf="" onclick="Bcode('T01')" style="text-align: center;">T01</a></td>
				</tr>
			</table>
			<% for(Allowance a : list) { %>
				<% if(a.getALLOWANCE_NO()%5 == 0  ) { %>
				<br>
				<% }else { %>
					<table width="130px" cellspacing="0" cellpadding="5" border="1" id="deduction_talbe" style="float: left;">
						<th width="auto"><a style="text-align: center;"><%= a.getALLOWANCE_NAME() %></a></th>
							<tr align="center">
						<td width="150px">
							<a  onclick="Acode('<%= a.getALLOWANCE_CODE() %>')" style="text-align: center;"><%= a.getALLOWANCE_CODE() %></a>
						</td>
					</table>
				<% } %>
			<% } %>
		</div>
		
		<div id="mid_l">
			<table width="100" cellspacing="0" cellpadding="5" >
				<tr align="center">
					<h4>
					설정한 계산식의 결과입니다<br>
					맞게 설정이 되었으면<br>
					[저장]을 눌러주세요.<br>
					-계산식 대신 값을 <br>
					지정하셔도 됩니다.
					</h4>
					<input type="text" id="Fwindow"  style=" width:200px; text-align:right;"> <br><br>
					<input type="button" value="저장" id="savebtn" style=" width:100px; text-align:center;">
					
				</tr>
	
			</table>
		</div>
		
		<div id="mid_r" align="center">
			<table width="100%" cellspacing="0" cellpadding="5" id="calcT" style="float:right;" >
				<tr>
					<td><input type="button" class="numB" value="("></td>
					<td><input type="button" class="sing" value=")"></td>
					<td><input type="button" class="result" value="- "></td>
				</tr>
				<tr>
					<td><input type="button" class="sing" value="+"></td>
					<td><input type="button" class="sing" value="*"></td>
					<td><input type="button" class="sing" value="/ "></td>					
				</tr>
				<tr>
					<td><input type="button" class="numB" value="7"></td>
					<td><input type="button" class="numB" value="8"></td>
					<td><input type="button" class="numB" value="9"></td>					
				</tr>
				<tr>
					<td><input type="button" class="numB" value="4"></td>
					<td><input type="button" class="numB" value="5"></td>
					<td><input type="button" class="numB" value="6"></td>
				</tr>
				<tr>
					<td><input type="button" class="numB" value="1"></td>
					<td><input type="button" class="numB" value="2"></td>
					<td><input type="button" class="numB" value="3"></td>
				</tr>
				<tr>
					<td><input type="button" class="numB" value="0"></td>
					<td><input type="button" class="sing" value="."></td>
					<td><input type="button" class="result" value="="></td>
				</tr>
			</table>
			<div align="center">
				<input type="reset" value="초기화" id="resetBTN" style="width:150px;">
			</div>		
		</div>
	
		<div id="bottom">
		
		</div>
	</div>
</body>
</html>