<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ERP.Employee.model.vo.Employee, java.util.ArrayList"%>
<%
	ArrayList<Employee> empList = (ArrayList<Employee>)request.getAttribute("empList");
	int listCount = (Integer)request.getAttribute("listCount");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int beginPage = (Integer)request.getAttribute("beginPage");
	int endPage= (Integer)request.getAttribute("endPage");
	int maxPage = (Integer)request.getAttribute("maxPage");
	

%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>NHMP</title>


<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/NHMP/resources/ERP/images/common/favicon.png">
<!-- Pignose Calender -->
<link
	href="/NHMP/resources/ERP/css/plugins/pg-calendar/css/pignose.calendar.min.css?after"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
	href="/NHMP/resources/ERP/css/plugins/chartist/css/chartist.min.css?after">
<link rel="stylesheet"
	href="/NHMP/resources/ERP/css/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css?after">
<!-- Custom Stylesheet -->
<link href="/NHMP/resources/ERP/css/style.css?after" rel="stylesheet">









<!-- Favicon icon -->
<!-- 
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
	 -->
<!--  메인 css중요한 링크 -->
<!-- 
<link href="/NHMP/resources/ERP/css/style.css" rel="stylesheet">
 -->
<!-- 아이콘 처리용 -->

<link href="/NHMP/resources/ERP/vendor/fontawesome-free/css/all.min.css?after"
	rel="stylesheet" type="text/css">
	
<!-- 페이징 밑단 색깔처리용 -->
<!-- 
<link href="/NHMP/resources/ERP/css/sb-admin-2.min.css" rel="stylesheet">

 -->








<!-- 스크립트태그 -->
<script type="text/javascript"	src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
  	$(function(){
  		
  		$(".check-all").click(function(){
  			$(".ad").prop("checked", this.checked);
  		});
  		
  		$("#usernewpwd").on("click", function(){
  			if($("input[name=empno]").is(":checked")){
  	
  			$.ajax({
  				url : "/NHMP/newpwd" ,
  				data : {empno : $("#empno").val()},
  				type : "post",
  				
  				success : function(data){
  					 var url = "/NHMP/views/Employee/newPwd.jsp";
  		             var name = "popup test";
  		             var option = "width = 500, height = 500, top = 100, left = 200, location = no"
  		             window.open(url, name, option);
  		             
  		             return false;
  					}
  				});
  			}
  			return false;
  		});
  		
         /* $("#newpwd").click(function(){
        	 
        	 var url = "/NHMP/views/member/newPwd.jsp";
             var name = "popup test";
             var option = "width = 500, height = 500, top = 100, left = 200, location = no"
             window.open(url, name, option);
             
             return false;
         }); */
           
  	});
 
  </script>
<style>
body {
	background: #f4f4f4;
}

.container-fluid {
	background: white;
	box-shadow: 1px 1px 1px 2px #dddddd;
	width:1000px;
	margin: 20px;
}

table, th {
	background: #dddddd;
}

table, td {
	background: white;
}

.icon {
	width: 20px;
	display: inline-block;
	padding: 2px;
	border-radius: 5px 0 0 5px;;
	background: #dddddd;
}

.search {
	font-size: 10pt;
	float: left;
}

select {
	height: 27px;
}

.button {
	float: right;
	font-size: 10pt;
}

.trlist {
	font-size: 10pt;
	over-flow: hidden;
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
				<a href="index.html"> <b class="logo-abbr"><img
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
					<li class="nav-label">MENU</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-speedometer menu-icon"></i><span
							class="nav-text">환자정보관리</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/index.jsp">Home 1</a></li>
							<!-- <li><a href="./index-2.html">Home 2</a></li> -->
						</ul></li>
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="javascript:void()" aria-expanded="false"> <i
							class="icon-globe-alt menu-icon"></i><span class="nav-text">사원정보관리</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./layout-blank.html">전체사원조회</a></li>
							<li><a href="/NHMP/views/ERP/Employee/IsertEmployee.jsp">사원정보
									등록</a></li>



							<li><a href="./layout-fixed-header.html">Fixed Header</a></li>
							<li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
						</ul></li>

					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-menu menu-icon"></i><span
							class="nav-text">권한관리</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./table-basic.html" aria-expanded="false">Basic
									Table</a></li>
							<li><a href="./table-datatable.html" aria-expanded="false">Data
									Table</a></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-notebook menu-icon"></i><span
							class="nav-text">급여관리</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./page-login.html">Login</a></li>
							<li><a href="./page-register.html">Register</a></li>
							<li><a href="./page-lock.html">Lock Screen</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">Error</a>
								<ul aria-expanded="false">
									<li><a href="./page-error-404.html">Error 404</a></li>

								</ul></li>
						</ul></li>
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
			<div class="container-fluid">
				<div class="search">
					<div class="empname">
						<form action="/NHMP/esel" method="post">
							사용자명:&nbsp;
							<div class="icon">
								<i class="fa fa-search"></i>
							</div>
							<input type="search" name="empname" id="sc">&nbsp;
							부서:&nbsp;<select name="dept">
								<option>--부서구분--</option>
								<option value="40">간호과</option>
								<option value="20">외과</option>
								<option value="30">한방의학과</option>
								<option value="60">원무과</option>
								<option value="50">총무과</option>
								<option value="10">가정의학과</option>
							</select> &nbsp;<input type="submit" value="검색">
						</form>
					</div>
				</div>
				<div class="button">
					<form action="/NHMP/mdel" method="post">
						<input type="hidden" name="page" value="<%=currentPage %>">
						<input type="hidden" name="bpage" value="<%=beginPage %>">
						<input type="submit" value="삭제">&nbsp;
						<button id="usernewpwd">비밀번호초기화</button>
				</div>
				<br>
				<table class="table table-bordered" style="margin-top: 10px;"
					id="dataTable" width="100%" cellspacing="0" border="1">

					<tr class="mainTr">
						<th width="110px"><input type="checkbox" class="check-all">&nbsp;전체선택</th>
						<th >사번</th>
						<th >이름</th>
						<th >입사일</th>
						<th >휴대폰</th>
						<th >이메일</th>
						<th>주소</th>
					</tr>
					<%for(Employee e : empList){ %>

					<tr class="trlist">
						<td><input type="checkbox" class="ad" name="empno" id="empno"
							value="<%=e.getEmpNo() %>"></td>
						<td><%=e.getEmpId()%></td>
						<td><%=e.getEmpName() %></td>
						<td><%=e.getHireDate()  %></td>
						<td><%=e.getPhone()  %></td>
						<td><%=e.getEmail() %></td>
						<td><%=e.getAddress() %></td>

					</tr>

					<%} %>
					<tr>
						<th>&nbsp;</th>
						<th>사번</th>
						<th>이름</th>
						<th>입사일</th>
						<th>휴대폰</th>
						<th>이메일</th>
						<th>주소</th>
					</tr>
				</table>
				</form>
				<div id="pagebox" align="right" style="margin-right: 30px;">
					<a href="/NHMP/list?page=1">시작페이지로<i class="fas fa-angle-left"></i></a>&nbsp;
					<%
						if (beginPage - 10 < 1) { %>

					<a href="/NHMP/list?page=1"><i class="fas fa-angle-double-left"></i></a>

					<%} else {%>

					<a href="/NHMP/list?page=<%=beginPage - 10%>">◀◀</a>

					<%}%>
					&nbsp;
					<% for (int p = beginPage; p <= endPage; p++) {
							if (p == currentPage) {%>

					<a href="/NHMP/list?page=<%=p%>"><font color="red"><b>[<%=p%>]
						</b></font></a>

					<%} else {%>
					<a href="/NHMP/list?page=<%=p%>"><%=p%></a>

					<%}}%>
					&nbsp;
					<%
						if ((endPage + 10) > maxPage) {
					%>
					<a href="/NHMP/list?page=<%=maxPage%>"><i
						class="fas fa-angle-double-right"></i></a>
					<%
						} else {
					%>
					<a href="/NHMP/list?page=<%=endPage + 10%>"><i
						class="fas fa-angle-double-right"></i></a>
					<%
						}
					%>
					&nbsp; <a href="/NHMP/list?page=<%=maxPage%>"><i
						class="fas fa-angle-right">끝 페이지로</i></a>
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
		<script src="/NHMP/resources/ERP/js/styleSwitcher.js"></script>

		<!-- Chartjs -->
		<script
			src="/NHMP/resources/ERP/css/plugins/chart.js/Chart.bundle.min.js"></script>
		<!-- Circle progress -->
		<script
			src="/NHMP/resources/ERP/css/plugins/circle-progress/circle-progress.min.js"></script>
		<!-- Datamap -->
		<script src="/NHMP/resources/ERP/css/plugins/d3v3/index.js"></script>
		<script src="/NHMP/resources/ERP/css/plugins/topojson/topojson.min.js"></script>
		<script
			src="/NHMP/resources/ERP/css/plugins/datamaps/datamaps.world.min.js"></script>
		<!-- Morrisjs -->
		<script src="/NHMP/resources/ERP/css/plugins/raphael/raphael.min.js"></script>
		<script src="/NHMP/resources/ERP/css/plugins/morris/morris.min.js"></script>
		<!-- Pignose Calender -->
		<script src="/NHMP/resources/ERP/css/plugins/moment/moment.min.js"></script>
		<script
			src="/NHMP/resources/ERP/css/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
		<!-- ChartistJS -->
		<script
			src="/NHMP/resources/ERP/css/plugins/chartist/js/chartist.min.js"></script>
		<script
			src="/NHMP/resources/ERP/css/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



		<script src="/NHMP/resources/ERP/js/dashboard/dashboard-1.js"></script>
    
    
    
    
    
<!-- 	<script src="/NHMP/resources/ERP/common/common.min.js"></script>
	<script src="/NHMP/resources/ERP/js/custom.min.js"></script>
	<script src="/NHMP/resources/ERP/js/settings.js"></script>
	<script src="/NHMP/resources/ERP/js/gleek.js"></script> -->

</body>

</html>