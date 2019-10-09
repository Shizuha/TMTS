<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#target").submit(function(event) {
			var pwd1 = $("#userpwd").val();
			var pwd2 = $("#userpwd2").val();
			if (pwd1 != pwd2) {
				alert("패스워드 불일치!!");
				$("#userpwd").select();
				return false;
			}else{
				return true;
			}
			
			
		});
	});
	
 	function validation(){
		
		return true;	//전송함
	}
	
	function checkId(){
		
		return false;	//전송 안 됨.
	}
	/*	
	$(function(){
		$("#userpwd2").on("keyup", function(event){
			if(event.keyCode == 13){
				if( $("#userpwd").val() != $(this).val() ){
					alert("패스워드가 서로 다릅니다. \n확인해주세요");
					$("#userpwd").focus();
				}
			}
			return false;	//전송 안 됨.
		});
	}); */
	
</script>
</head>
<body>


<h1 align="center">회원가입</h1>
<br>
<form action="/NHMP/singup" method="post" onsubmit="return validation();">
	<table align="center" width="600" cellspacing="0" cellpadding="5" border="1">
		<tr>
			<th>아이디 *</th>
			<td>
				<input type="text" name="userid" id="userid" required> &nbsp;
				<button onclick="return checkId();">중복체크</button>
			</td>
		</tr>
		
		<tr>
			<th>패스워드 *</th>
			<td><input type="password" name="userpwd" id="userpwd" required></td>
		</tr>
		
		<tr>
			<th>패스워드확인 *</th>
			<td><input type="password" id="userpwd2" required></td>
		</tr>
		
		<tr>
			<th>이름 *</th><td><input type="text" name="username" id="username" required></td>
		</tr>
		<tr>
			<th>성별 *</th>
			<td>
				<input type="radio" name="gender" value="M" required>남자
				<input type="radio" name="gender" value="F" required>여자
			</td>
		</tr>
		<tr>
			<th>주민번호 *</th>
			<td>
				<input type="text" name="before" maxlength="7">-
				<input type="password" name="after" maxlength="8">
			</td>
		</tr>
		<tr>
			<th>내/외국인 *</th>
			<td>
				<input type="radio" name="intnal" value="Y" required>내국인
				<input type="radio" name="intnal" value="N" required>외국인
			</td>
		</tr>
		<tr>
			<th>전화번호 *</th>
			<td>
				<select>
					<option value="010" name="fphone">010
					<option value="011" name="fphone">011
					<option value="016" name="fphone">016
					<option value="019" name="fphone">019
				</select>
				<input type="tel" name="mphone" maxlength="4" required>-
				<input type="tel" name="lphone" maxlength="4" required>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<!-- <input type="text"> &nbsp; @ &nbsp; -->
				<input type="email" name="email">
				<!-- <select>
					
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
					<option value="empal.com">empal.com</option>
					<option value="korea.com">korea.com</option>
				</select> -->
			</td>
		</tr>
		<tr>
			<th>회사 전화번호</th>
			<td>
				<input type="tel" name="fcomnum" maxlength="3" size="3">-
				<input type="tel" name="mcomnum" maxlength="3" size="3">-
				<input type="tel" name="lcomnum" maxlength="4" size="4">
			</td>
		</tr>
		<tr>
			<th>사업자등록번호 *</th>
			<td>
				<input name="psnCobsEnprNO1" value="" maxlength="3" type="text" style="width:79px;" required> - 
				<input name="psnCobsEnprNO2" value="" maxlength="2" type="text" style="width:79px;" required> - 
				<input id="psnCobsEnprNO3" name="psnCobsEnprNO3" value="" maxlength="5" type="text" style="width:79px;" required>
			</td>
		</tr>
		<tr>
			<th>상호명</th>
			<td>
				<input id=""  name="chkBsnsNM"  value="" type="text" style="width:194px;" >
			</td>
		</tr>
		
<!-- 		<script>
		$(document).ready(function() {
			// 사업자번호 인증 활성화 설정
			$("input[name=psnCobsEnprNO3]").keyup(function() {
				var chkBsnsNM = $("input[name=chkBsnsNM]").val();
				var psnCobsEnprNO1 = $("input[name=psnCobsEnprNO1]").val();
				var psnCobsEnprNO2 = $("input[name=psnCobsEnprNO2]").val();
				var psnCobsEnprNO3 = $("input[name=psnCobsEnprNO3]").val();
				
				if( psnCobsEnprNO1!="" && psnCobsEnprNO2!="" && psnCobsEnprNO3!="" ) {
					$("#btnCobsCrtf").removeAttr("class");
					$("#btnCobsCrtf").attr("class", "btn_emdef t_active");
				} else {
					$("#btnCobsCrtf").removeAttr("class");
					$("#btnCobsCrtf").attr("class", "btn_emdef");
				}
			});
			
		});
	</script> -->
		<tr>
			<th>회사 주소</th>
			<td>
				<input type="text" name="comaddr">
			</td>
		</tr>
		<tr>
			<th>기타사항</th>
			<td>
				<textarea name="etc" rows="5" cols="60">
				</textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="가입하기">&nbsp;
				<input type="reset" value="취소">
				<a href="javascript:history.go(-1)">이전 페이지로 이동</a>
			</th>
		</tr>
	</table>
</form>

</body>
</html>