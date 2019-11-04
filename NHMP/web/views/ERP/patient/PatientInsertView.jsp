<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMTS</title>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("sample4_jibunAddress");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
               

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                
            } else {
                guideTextBox.innerHTML = '';
                
            }
        }
    }).open();
}
</script>
<script type="text/javascript" src="/NHMP/resources/ERP/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function movemain(){
	location.href = "/NHMP/views/ERP/Admin_main.jsp";
	return false;
}
</script>
</head>
<body>
<h2 align="center">환자 등록 페이지</h2>
<form action="/NHMP/patientinsert" method="post">
<table align="center" width="800" border="3" cellspacing="0" cellpadding="5">
<tr><th>병록번호</th><td><input type="number" name="pat_num"></td></tr>
<tr><th>환자명</th><td><input type="text" name="pat_name"></td></tr>
<tr><th>구분</th><td><input type="text" name="pat_type"></td></tr>
<tr><th>입원날짜</th><td><input type="date" name="pat_entdate"></td></tr>
<tr><th>퇴원날짜</th><td><input type="date" name="pat_outdate"></td></tr>
<tr><th>환자성별</th><td>
<input type="radio" name="pat_gender" value="M"> 남자 &nbsp;
<input type="radio" name="pat_gender" value="F"> 여자
</td></tr>
<tr><th>주민번호</th><td><input type="text" name="pat_no"></td></tr>
<tr><th>주소</th>
<td colspan="3">
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기">&nbsp;
						<input type="text" id="sample4_roadAddress"name="address1" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress"name="address2" placeholder="지번주소"><br>
						<input type="text" id="sample4_detailAddress"name="address3" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress"name="address4" placeholder="참고항목">
</td></tr>
<tr><th>보호자명</th><td><input type="text" name="family"></td></tr>
<tr><th>이메일</th><td><input type="email" name="email"></td></tr>
<tr><th>전화번호</th><td><input type="tel" name="pat_phone"></td></tr>
<tr><th>병동</th><td><input type="text" name="ward"></td></tr>
<tr><th>담당의사</th><td><input type="text" name="pat_doc"></td></tr>
<tr>
<th colspan="2">
<input type="submit" value="등록하기"> &nbsp; &nbsp; &nbsp;
<input type="reset" value="취소하기"> &nbsp; &nbsp; &nbsp;
<input type="button" value="목록" onclick="return movemain();"> &nbsp; &nbsp; &nbsp;
<a href="javascript:history.go(-1)">이전페이지로 이동</a>
</th></tr>
</table>
</form>
</body>
</html>