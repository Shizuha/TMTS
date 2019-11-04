<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery file-explore.js: Folder Tree Demo</title>
<style>
button#closeButton {
	font-family: 'NanumSquare', sans-serif;
	height: 30px;
	position: relative;
	margin: 3px -30px;
	width: 50px;
	top: 50%;
	left: 50%;
	background: transparent;
	border: 1px solid #4d2497;
	color: #4d2497;
}

button#closeButton:hover {
	color: #fff;
	background: #4d2497;
}
// 모달 css
/* modal background */
.popup {
	
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
// 모달 내용 css(앞으로 뜨는 창)
.modal-content {
	display:none;
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
	height: 600px;
}
// x버튼 css
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	
}

.close:hover, .close:focus {
	color: #4d2497;
	text-decoration: none;
	cursor: pointer;
}

.organ li{
	margin: 0;

	list-style: none;
	
	background-size: 40px;
}
</style>
</head>
<body>

<div class="organ">
	<ul>
		<li>1
			<ul>
				<li></li>
				<li></li>
			</ul>
		</li>
		<li>2</li>
		<li>3</li>
	</ul>
</div>
<script type="text/javascript" src="/NHMP/resources/ERP/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	  $('.organ li:has(ul)') //자식 요소(ul)를 갖는 요소(li)에 대해서
      .css({cursor: 'pointer', 'list-style-image':'url(/NHMP/resources/ERP/images/openForder.PNG)'})//+기호로 설정
      .children().hide(); //자식요소 숨기기
    //태그 값 가져오기
 	// Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    // 버튼 클릭 이벤트 변수
    var btn = document.getElementById("myBtn");
	
    // Get the <span> element that closes the modal
    //x 버튼
    var span = document.getElementsByClassName("close")[0];
    //닫기 버튼 
     var close = document.getElementsByClassName("modal_bottom")[0];
    
    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
    	
        modal.style.display = "block";
        
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {

        modal.style.display = "none";
    }
    close.onclick = function() {

        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
});
</script>
</body>
</html>