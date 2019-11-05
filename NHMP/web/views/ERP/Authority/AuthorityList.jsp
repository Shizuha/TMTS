<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ERP.Authority.model.vo.Authority, java.util.ArrayList"%>
<%
	ArrayList<Authority> auList = (ArrayList<Authority>)request.getAttribute("auList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/NHMP/resources/ERP/images/common/favicon.png">
<!-- 메인 CSS 처리용 -->
<link href="/NHMP/resources/ERP/css/style.css?after" rel="stylesheet">
<link href="/NHMP/resources/ERP/css/employeeListViewCss.css" rel="stylesheet">
<!-- 아이콘 처리용 -->
  <link href="/NHMP/resources/ERP/vender/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	

<!-- 스크립트태그 -->
  <script type="text/javascript" src="/NHMP/resources/ERP/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 $(function(){
	 
	 $("#auChk-all").click(function(){
		 $(".auChk").prop("checked",this.checked);
		 
	 });
	 $("#empChk-all").click(function(){
		 $(".listEmp").prop("checked",this.checked);
		 
		 
	 });
	 $(".listEmp").click(function(){
		 alert("dd");
	 });
	 $(".auChk").click(function(){
		
		 var i = $(".ad");
		 i.remove();
		$.ajax({
			url:"auEmp",
			data:{aucode : $(this).val()},
			type: "post",
			dataType:"json",
			success : function(data){
				
				var jsonStr = JSON.stringify(data);
					//string 을 json 객체로 바꿈
					var json = JSON.parse(jsonStr);
				
				for(var i in json.list1){
					var empName = decodeURIComponent(json.list1[i].empname).replace(/\+/gi, " ");
					/* deptName.remove(); */
					
					$(".auEmpTable").append("<tr class='ad'id=emp" + i + ">" + "<td style='padding:5px;'><input type='checkbox' name='empDel' class='listEmp' value='" + json.list1[i].empid + "'></td>" +
							"<td>" + empName + "</td>" +
						 	"</tr>");
					}
				
				
				for(var i in json.list3){
					var posName = decodeURIComponent(json.list3[i].posname).replace(/\+/gi, " ");
					
					$("#emp"+ i).append("<td>" + posName + "</td>");
					
				}
				
				for(var i in json.list2){
					var deptName = decodeURIComponent(json.list2[i].deptname).replace(/\+/gi, " ");
					$("#emp"+ i).append("<td>" + deptName + "</td>");
					} 
				
			},error :function(jqXHR, textStatus, errorThrown){
					console.log("error : " + textStatus);
				}
		});
		
	 });//권한CHK functionClose
	 
 });//documentReady
 function auInUser(){
	 if($(".auChk").is(":checked") === true){
		 var noVal = $("input[name=auChk]:checked").val();
		 var url = "/NHMP/auInUser?author=" + noVal;
         var name = "popup test";
         var option = "width = 1080, height = 600, top = 100, left = 200, location = no"
         window.open(url, name, option);
         return false;
	 }else{
		 alert("지정할 권한을 클릭하세요.");
	 }
 }
 function auOutDel(){
	 if($("input:checkbox[name=empDel]").is(":checked") === false){
			alert("삭제하실 사원을 선택해주세요.");	
			return false;
			
		}else{
			  var chkAuthor = $("input[name=auChk]:checked").val();
		
			  if(chkAuthor == "G1"){ 
				 alert("기본권한은 삭제가 불가능합니다.");
				 return false;
			  }else{
				
				  var trueAndFalseDel = confirm( '해당내용으로 삭제 하시겠습니까?' );
				    if(trueAndFalseDel != false){
			  
			 
			var arrayParam = new Array();

				$("input:checkbox[name=empDel]:checked").each(function(){

					arrayParam.push($(this).val());

				});
			
			$.ajax({
	 					url : "auEmpDel",
	 					data : { empDel : arrayParam},
	 					traditional : true,
	 					type : "post",
	 					dataType : "text",
	 					success : function(data){
	 						alert(data);
	 						location.reload();
	 					},
	 					error :function(jqXHR, textStatus, errorThrown){
	 						
	 						console.log("error : " + textStatus);
	 					}
	 					
	 				});
				    }else
				    	return false;
					  }
		}
return true;
 }
 
function auList(id){
	$(".auChk").prop("checked", false);
	$("#" + id).prop("checked", true);
}
 </script>
 <style>
 .Btn{
 
 	
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
    
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
 }
 .auMain{
 	
 	border-radius:5px;
 	padding:20px;
 	width:100%;
 	background:white;
 	box-shadow:1px 1px 1px 1px gray;
 	height:600px;;
 }
 .auLeft{
 	float:left;
 	width:48%;
 	border:1px solid gray;
 	border-radius:5px;
 	padding:20px;
 	display:inline-block;
 	height:530px;
 }
 .auRight{
 	float:right;
 	width:48%;
 	border:1px solid gray;
 	border-radius:5px;
 	padding:20px;
 	display:inline-block;
 	height:530px;
 }
 .auList{
 	border:1px solid gray;
 	border-radius:5px;
 	width:98%;
 	padding:10px;
 	height:450px;
 }
 .auEmp{
 	border:1px solid gray;
 	border-radius:5px;
 	width:98%;
 	padding:10px;
 	height:450px;
 }
 .auR-header{
 	
 	width:98%;
 	display:inline-block;
 	
 }

 </style>
</head>
<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="/NHMP/views/ERP/Employee.jsp"> <b class="logo-abbr"><img
						src="/NHMP/resources/ERP/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="/NHMP/resources/ERP/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="/NHMP/resources/ERP/images/common/logo-text.png" alt="">
				</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            	상단바 시작
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>
				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown">
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">
								<span class="activity active"></span> <img
									src="/NHMP/resources/ERP/images/user/1.png" height="40"
									width="40" alt="">
							</div>
							<div
								class="drop-down dropdown-profile animated fadeIn dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="app-profile.html"><i class="icon-user"></i>
												<span>내정보 보기</span></a></li>


										<hr class="my-2">
										<li><a href="/NHMP/ERP/views/Employee/calendar.jsp"><i
												class="icon-lock"></i> <span>일정관리</span></a></li>
										<li><a href="/NHMP/logout"><i class="icon-key"></i> <span>로그아웃</span></a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<div class="nk-nav-scroll">
				<ul class="metismenu" id="menu">
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="javascript:void()" aria-expanded="false"> 
						<i class="fa fa-users"></i><span class="nav-text">인사관리</span> 
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/list">전체사원조회</a></li>
							<li><a href="/NHMP/views/ERP/Employee/InsertEmployee.jsp">인사정보등록</a></li>
							<li><a href="/NHMP/ochart">조직도</a></li>
							<!--
                            <li><a href="layout-compact-nav.html">Compact Nav</a></li>
                            <li><a href="layout-vertical.html">Vertical</a></li>
                        -->

						</ul>
					</li>
					<!-- <li class="nav-label">Apps</li> -->
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> 
						<i class="fa fa-id-card"></i> 
						<span class="nav-text">권한설정</span> <!--    <i class="icon-envelope menu-icon"></i> <span class="nav-text">권한설정</span> -->
					</a>
						
						<ul aria-expanded="false">
							<li><a href="/NHMP/authall">권한부여관리</a></li>
							<!--
                            <li><a href="email-read.html">수당항목등록</a></li>
                            <li><a href="email-compose.html">급여계산</a></li>
                            -->
						</ul>
					
					</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-plus-square"></i><span
							class="nav-text">환자 관리</span> <!--   <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">환자 관리</span> -->
					</a>

						<ul aria-expanded="false">
							<li><a href="app-profile.html">전체환자 조회</a></li>
							<li><a href="app-calender.html">환자 입원 등록</a></li>
							<li><a href="app-calender.html">상담일지 등록</a></li>
							<li><a href="app-calender.html">투약일지 등록</a></li>
						</ul></li>
					<!--
                    <li>
                            <a  href="javascript:void()" aria-expanded="false">
                                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="fa fa-slideshare"></i> <span class="nav-text">공지사항</span>
                               <i class="icon-graph menu-icon"></i> <span class="nav-text">게시판</span>
                        </a>
                        <ul aria-expanded="false">

                            <li><a href="chart-flot.html">공지사항</a></li>
                            <li><a href="chart-morris.html">자료실</a></li>

                            <li><a href="chart-chartjs.html">Chartjs</a></li>
                            <li><a href="chart-chartist.html">Chartist</a></li>
                            <li><a href="chart-sparkline.html">Sparkline</a></li>
                            <li><a href="chart-peity.html">Peity</a></li>

                        </ul>
                    </li>
                    -->





					<!--   <li class="nav-label">UI Components</li>  -->
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-usd"></i><span
							class="nav-text">급여 관리</span> <!--    <i class="icon-grid menu-icon"></i><span class="nav-text">급여 관리</span>  -->
					</a>
						<ul aria-expanded="false">
							<!-- <li><a href="/NHMP/deduclise">공제항목등록</a></li>
							<li><a href="/NHMP/allowlist">수당항목등록</a></li> -->
							<li><a href="/NHMP/paylist">급여계산</a></li>
							
						</ul>
					<li><a href="/NHMP/nlist" aria-expanded="false"><i class="fa fa-slideshare"></i><span class="nav-text">공지사항</span>
					</a></li>
					<li><a href="javascript:void()" aria-expanded="false"> <i
							class="fa fa-download"></i> <span class="nav-text">자료실</span>
					</a></li>
					</ul>
			</div>
			
		</div>

		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body" style="padding: 40px;">
			<div class="auMain">
				<div class="auLeft">
				<h3>권한목록</h3>
					<div class="auList">
						<table class="auTable" width="100%" cellpadding="3" cellspacing="0" border="1" >
							<tr>
								<th style="padding:5px;"><input type="checkbox" name="auChk-all" id="auChk-all"></th>
								<th>권한코드</th>
								<th>권한명</th>
								<th>권한내용</th>
							</tr>
							<% int i = 0; for(Authority au : auList){ %>
							<tr>
								<td style="padding:5px;"><input type="checkbox" id="auChk<%=i %>"onclick="auList(this.id);" name="auChk" class="auChk" value="<%=au.getAuthorityCode() %>"></td>
								<td><%=au.getAuthorityCode() %></td>
								<td><%=au.getAuthorityName() %></td>
								<td><%=au.getAuthorityEtc() %></td>
							</tr>
							<% i++;} %>
						</table>
					</div>
				</div>
				<div class="auRight">
				<div class="auR-header">
				<div class="qur-header-title"style="flaot:left; width:30%; display:inline-block;">
				<h3>사용자목록</h3>
				</div>
				<div class="auR-button" style="float:right; width:40%; display:inline-block; padding:0px; margin-left:0px;">
				<button class="Btn"style="float:right; display:inline-block; padding:0px; width:82px;margin-top:15px;" onclick="auInUser();">사용자 선택</button>
				
				<input type="button"onclick="auOutDel();" class="Btn" style="float:left; width:40px;margin-top:15px; margin-left:65px; display:inline-block; padding:0px;" value="삭제">
				</div>
				</div>
					<div class="auEmp">
						<table  class="auEmpTable" width="100%" cellpadding="3" cellspacing="0" border="1">
							<tr>
								<th style="padding:5px;"><input type="checkbox" id="empChk-all"></th>
								<th>이름</th>
								<th>직급</th>
								<th>부서</th>
							</tr>
						</table>
						
					</div>
				</div>
			</div>
		</div>

		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright &copy; Designed & Developed by <a
						href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
    
    
    		<script src="/NHMP/resources/ERP/css/plugins/common/common.min.js"></script>
		<script src="/NHMP/resources/ERP/js/custom.min.js"></script>
		<script src="/NHMP/resources/ERP/js/settings.js"></script>
		<script src="/NHMP/resources/ERP/js/gleek.js"></script>
		<!-- <script src="/NHMP/resources/ERP/js/styleSwitcher.js"></script> -->

<!-- 	<script src="/NHMP/resources/ERP/common/common.min.js"></script>
	<script src="/NHMP/resources/ERP/js/custom.min.js"></script>
	<script src="/NHMP/resources/ERP/js/settings.js"></script>
	<script src="/NHMP/resources/ERP/js/gleek.js"></script> -->

</body>

</html>