<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.Department.model.vo.Department,ERP.Team.model.vo.Team, ERP.Employee.model.vo.Employee, ERP.Ward.model.vo.Ward
				,ERP.Position.model.vo.Position, java.util.ArrayList" %>
    
<%
	ArrayList<Employee> mList = (ArrayList<Employee>)request.getAttribute("mList");
	ArrayList<Department> dList = (ArrayList<Department>)request.getAttribute("dList");
	String authority = (String)request.getAttribute("author");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
 $(document).ready(function () {
            
            //[2] 자식 요소를 갖는 li에 대해서는 블릿이미지를 plus.gif를 지정
            $('.organ li:has(ul)') //자식 요소(ul)를 갖는 요소(li)에 대해서
                .css({cursor: 'pointer', 'list-style-image':'url(/NHMP/resources/ERP/images/closeForder.PNG)'})//+기호로 설정
                .children().hide(); //자식요소 숨기기
                
             
               
               
            //[3] +로 설정된 항목에 대해서 click이벤트 적용
            $('.deptList').click(function(event){
            	var index = $(this).index();
            	if($(event.target).is(".deptList")){
            	//클릭된 해당부서 기본정보 부서명에 추가
            	$("#deptname").val($(this).text());
            	
            	//자식요소 유무 이프문
            	
            	
            	$.ajax({
      				url : "organlist",
      				data : { deptName : $(this).text().trim() },
      				type : "post",
      				dataType : "json",
      				success : function(data){
      					//전송 온 object 를 string 으로 바꿈
      					var jsonStr = JSON.stringify(data);
      					//string 을 json 객체로 바꿈
      					var json = JSON.parse(jsonStr);
      					//json 안에 list 가 들어있음.
      					for(var i in json.list){
      						
      						$("#deptcode").val(json.list[i].deptcode);
      						$("#deptcount").val(json.list[i].count);
      						if(json.list[i].teamname != null){
      						var teamName = decodeURIComponent(json.list[i].teamname).replace(/\+/gi, " ");
      						var li = $("<li class='teamList' id='t" + teamName + "'  onclick='team(this.id, " + i + ");'>" + 
      								teamName +  "<ul></ul></li>");
      						}
      						$('.deptList').eq(index).children().append(li);
      						$('.teamList').css({'list-style-image':'url(/NHMP/resources/ERP/images/closeForder.PNG)'});
      					}
      	
      					
      				},
      				error :function(jqXHR, textStatus, errorThrown){
      					console.log("error : " + textStatus);
      				}
      			});
            		
            	}
                //this == event.target으로 현재 선택된 개체에 대해서 처리
                if(this == event.target){
                    //숨겨진 상태면 보이고 -기호로 설정 그렇지 않으면 숨기고 + 기호로 설정
                      if ($(this).children("ul").is(':hidden')) {
                    	  
                    	// 보이기
                          $(this).css('list-style-image', 'url(/NHMP/resources/ERP/images/openForder.PNG)').children().slideDown();
                    	  
                        
                    }else {
                        // 숨기기
                        $(this).css('list-style-image', 'url(/NHMP/resources/ERP/images/closeForder.PNG)').children().slideUp();
                        $('.teamList').css('list-style-image', 'url(/NHMP/resources/ERP/images/closeForder.PNG)').children().slideUp();
                        
                    }
 
                }
                return false;          
            });
                
        });
function team(id, index){
	
	 var value = $("#"+id).text();
	 
	 if($(".teamList").children("ul") != null){
	 $.ajax({
			url : "teamlist",
			data : { teamName : value },
			type : "post",
			dataType : "json",
			success : function(data){
				
				//전송 온 object 를 string 으로 바꿈
				var jsonStr = JSON.stringify(data);
				//string 을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				$("#teamname").val(value);
				//json 안에 list 가 들어있음.
				if(json != null){
				for(var i in json.list){
					
					$("#teamcode").val(json.list[i].tcode);
					$("#teamcount").val(json.list[i].count);
					var empName = decodeURIComponent(json.list[i].empname).replace(/\+/gi, " ");
					if(empName != null){
					var li = $("<li class='emp' id='" + empName + "' onclick='empList(this.id," + i + ");'><i class='mdi mdi-account'></i>&nbsp;" + 
							empName +  "</li>");
					$("#"+id).children().append(li);
						}
					}
				}
				
			},
			error :function(jqXHR, textStatus, errorThrown){
				console.log("error : " + textStatus);
			}
		});
	 }
	 
	 if ($("#"+id).children("ul").is(':hidden')) {
		 $("#"+id).children().slideDown();
		 $("#"+id).css('list-style-image', 'url(/NHMP/resources/ERP/images/openForder.PNG)');
	     }else{
	    	$("#"+id).children().slideUp(); 
	    	 $("#"+id).css('list-style-image', 'url(/NHMP/resources/ERP/images/closeForder.PNG)')
	     }
	return false;  
 
	
	
 }
 
function empList(id, index){
	$.ajax({
		url : "emp",
		data : { empName : id },
		type : "post",
		dataType : "json",
		success : function(data){
			
			var jsonStr = JSON.stringify(data);
			//string 을 json 객체로 바꿈
			var json = JSON.parse(jsonStr);
			
			if(data != null){
				
				for(var i in json.list){
				$(".imgs").remove();
				$("#empImg").prepend("<img class='imgs'alt='' src='/NHMP/resources/ERP/emp_Img_file/" + json.list[i].empimg +"' width='200' height='200'>");
				$("#name").val(decodeURIComponent(json.list[i].empname).replace(/\+/gi, " "));
				$("#itfor").val(decodeURIComponent(json.list[i].itfor).replace(/\+/gi, " "));
				$("#phone").val(json.list[i].phone);
				$("#address").text(decodeURIComponent(json.list[i].address).replace(/\+/gi, " "));
				$("#hiredate").val(json.list[i].hiredate); 
				$("#email").val(json.list[i].email); 
				}
				return false;
			}
			
		},
		error :function(jqXHR, textStatus, errorThrown){
			
			console.log("error : " + textStatus);
		}
		
	});
	event.stopPropagation();
	return false;
}
</script> 
</head>
<body>
<div class="dept-left">
					<%if(dList != null){%>
						<div class="organ">
							<ul>
							<%for(Department d : dList){ %>
								<li class="deptList"><%= d.getDeptName()%>
								<ul></ul>
								</li>
					           <%} %>
					        </ul>
						</div>
					<%}else{ %>
						<div class="organ">
							<ul>
					            <li>간호과
					                <ul>
					                    <li>dd</li>
					                    <li>dd</li>
					                    <li>dd</li>
					                </ul> 
					           </li>
					           <li>가정의학과
					                <ul>
					                   
					                </ul>
					            </li>
					            <li>외과
					                <ul>
					                   
					                </ul>
					            </li>
					            <li>원무과
					                <ul>
					                   
					                </ul>
					            </li>
					            <li>총무과
					                <ul>
					                   
					                </ul>
					            </li>
					            <li>한방과
					                <ul>
					                   
					                </ul>
					            </li>
					        </ul>
						</div>
					<%} %>
				</div>
</body>
</html>