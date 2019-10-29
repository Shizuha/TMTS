<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery file-explore.js: Folder Tree Demo</title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
        $(document).ready(function () {
            //[1] 리스트의 기본 모양 지정 : <ul>를 자식으로 가지지 않는 li의 블릿기호는 기본 모양
            $('li:not(:has(ul))').css({ cursor: 'default', 'list-style-image':'none'});
           
            //[2] 자식 요소를 갖는 li에 대해서는 블릿이미지를 plus.gif를 지정
            $('li:has(ul)') //자식 요소(ul)를 갖는 요소(li)에 대해서
                .css({cursor: 'pointer', 'list-style-image':'url(/NHMP/resources/ERP/images/folder-closed.gif)'})//+기호로 설정
                .children().hide(); //자식요소 숨기기
               
            //[3] +로 설정된 항목에 대해서 click이벤트 적용
            $('li:has(ul)').click(function(event){
          	  var value = $(this).text();
              $.getJSON("organlist",{deptname :value},function(data){
              	
              	//전송 온 object 를 string 으로 바꿈
					var jsonStr = JSON.stringify(data);
					//string 을 json 객체로 바꿈
					var json = JSON.parse(jsonStr);
					//json 안에 list 가 들어있음.
					for(var i in json.list){
              	$("#deptList").append("<li>" + decodeURIComponent(json.list[i].teamname).replace(/\+/gi, " ") +  "</li>");
              	}
              }       
                //this == event.target으로 현재 선택된 개체에 대해서 처리
                if(this == event.target){
                    //숨겨진 상태면 보이고 -기호로 설정 그렇지 않으면 숨기고 + 기호로 설정
                      if ($(this).children().is(':hidden')) {
                        // 보이기
                        $(this).css('list-style-image', 'url(/NHMP/resources/ERP/images/folder.gif)').children().slideDown();
                    }
                    else {
                        // 숨기기
                        $(this).css('list-style-image', 'url(/NHMP/resources/ERP/images/folder-closed.gif)').children().slideUp();
                    }
 
                }
                return false;          
            });
        });
    </script>
 
</head>
<body>
 
        <ul>
            <li>게시판</li>
            <li>자바과정-기초
                <ul>
                    <li>기본문법</li>
                    <li>AWT/SWING</li>
                    <li>JDBC</li>
                    <li>자바예제</li>
                    <li>자바복습</li>
                </ul>
           </li>
           <li>웹프로그래밍
                <ul>
                    <li>JSP&amp;Servlet</li>
                    <li>프레임워크
                        <ul>
                            <li>struts2(스트럿츠2)</li>
                            <li>Spring(스프링)</li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    
</body>
</html>