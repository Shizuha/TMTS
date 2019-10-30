<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
	page import="Main.NursingHospital.model.ov.NursingHospital, 
				java.util.ArrayList, ERP.Deduction.model.vo.Deduction, 
				ERP.Allowance.model.vo.Allowance, ERP.Employee.model.vo.Employee"%>

<%
	NursingHospital loginHospital = (NursingHospital)session.getAttribute("loginHospital");
	ArrayList<Allowance> Alist = (ArrayList<Allowance>)request.getAttribute("Alist");
	ArrayList<Deduction> Dlist = (ArrayList<Deduction>)request.getAttribute("Dlist");
	ArrayList<Employee> Elist = (ArrayList<Employee>)request.getAttribute("Elist");
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>TMTS</title>
<style type="text/css">
	#rootdiv{
		float:left;
		width:1100px;
		height:auto;
		/* border : 1px solid red; */
		margin:40px;
	}
	
	#rootdiv #Paylist div{
		height:250px;
	}
	
	#rootdiv #Payleft{
		/* border : 1px solid red; */
		float: left; 
		width: 40%;
	}
	#rootdiv #Payleft table{
		width:100%;
		float:left;
		text-align:center;
		background:#f4f4f4;
		color:#000;
	}
	
	#rootdiv #Payleft table th{
		background: rgb(117, 113, 249, 0.5);
    	color:rgba(0, 0, 0, 1);
    	text-align:center;
    	/* opacity:0.5; */
	}
	
	
	
	#rootdiv #Paycenter{
		/* border : 1px solid red; */
		float: right; 
		width: 300px;
	}
	#rootdiv #Paycenter table{
		width:290px;
		float:right;
		text-align:center;
		background:#f4f4f4;
		color:#000;
	}
	#rootdiv #Paycenter table th{
		background: rgb(117, 113, 249, 0.5);
    	text-align:center;
    	color:rgba(0, 0, 0, 1);
	}
	
	
	
	#rootdiv #Payright{
		/* border : 1px solid red; */
		float: right; 
		width: 30%;
	}
	#rootdiv #Payright table{
		width:290px;
		float:right;
		text-align:center;
		background:#f4f4f4;
		color:#000;
	}
	#rootdiv #Payright table th{
		background: rgb(117, 113, 249, 0.5);
    	text-align:center;
    	color:rgba(0, 0, 0, 1);
	}
	
	#rootdiv div{
		height:300px;
		border:0px;
		margin:0px;
		padding:0px;
		
	}
	#rootdiv #Payresult {
		margin:0%;
		float:right;
	}	
	#rootdiv #Payresult table{
		margin-left:10px;
		width:290px;
		text-align:center;
		background:#f4f4f4;
		color:#000;
	}
	#rootdiv #Payresult table th{
		background: rgb(117, 113, 249, 0.5);
		width:129px;
    	text-align:center;
    	color:rgba(0, 0, 0, 1);
	}

</style>

<script type="text/javascript" src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var payresult = "";
var Ecnt = 0;
var totalresult = "0";
var totalresultA = "0";

function Echeckbox(empid){
	var thispuls = "ECheckBtn"+empid;
	var id = "";
	totalresult = 0;
	if( ($("#"+thispuls).prop('checked')) ){
		if($("#pay").val() == 0 ){
			Ecnt=1;
			id = empid;
			$.ajax({
				url : "/NHMP/getpay",
				type: "post",
				data : {empid : empid},
				dataType : "json",
				success : function(data){
					console.log(data.salary);
					$("#pay").val(data.salary);
					
				}, error : function(jqXHR, textStatus, errorThrown ){
					console.log("error : " + jqXHR + ", " + textStatus + ", " +errorThrown);
				}
			})
		}else{
			Ecnt=1;
			$('input[type="text"]').val(0);
			$('input[type="checkbox"][class="CECheckBtn"]').prop('checked', false);
			$('input[type="checkbox"][class="DCheckBtn"]').prop('checked', false);
			$('input[type="checkbox"][class="ACheckBtn"]').prop('checked', false);
			$("#"+thispuls).prop('checked',true);
			$.ajax({
				url : "/NHMP/getpay",
				type: "post",
				data : {empid : empid},
				dataType : "json",
				success : function(data){
					console.log(data.salary);
					$("#pay").val(data.salary);
				}, error : function(jqXHR, textStatus, errorThrown ){
					console.log("error : " + jqXHR + ", " + textStatus + ", " +errorThrown);
				}
			})
		}
	}else{
		$('input[type="checkbox"][class="CECheckBtn"]').prop('checked', false);
		$('input[type="checkbox"][class="DCheckBtn"]').prop('checked', false);
		$('input[type="checkbox"][class="ACheckBtn"]').prop('checked', false);
		$('input[type="text"]').val(0);
		Ecnt=0;
	}
}



function Dcheckbox(Dcode, Dno){
	if($("#pay").val() != 0){
		var payD = "#payD";
		var Did = "DCheckBtn"+Dno;
		payresult = payD+Dno;
		$.ajax({
			url : "/NHMP/getdeduc",
			type: "post",
			data : {Dcode : Dcode},
			success : function(data){
				
				var pay = $("#pay").val();
				var resultformula = data.replace("T01", pay);
				var result = Math.floor(eval(resultformula)/10)*10;
				console.log(result);
				if($("#"+Did).prop('checked')){
					totalresult = eval(eval(totalresult)+eval(result));
					console.log("totalresult : "+totalresult);
					console.log("result : "+result);
					$(payresult).val(result);
					$("#totalD").val(totalresult);
					$("#totalM").val(eval(eval(pay)-eval(totalresult)+eval(totalresultA)));
				}else{
					totalresult = eval(eval(totalresult)-eval(result));
					$(payresult).val(0);
					$("#totalD").val(totalresult);
					$("#totalM").val( eval( eval($("#totalM").val())+eval(result) ) );
				}
				
			}, error : function(jqXHR, textStatus, errorThrown ){
				console.log("error : " + jqXHR + ", " + textStatus + ", " +errorThrown);
			}
		})
	}else{
		alert("한명의 직원을 선택하여 주세요");
		$('input[type="checkbox"][class="DCheckBtn"]').prop('checked', false);
	}
}

function Acheckbox(Acode, Ano){
	if($("#pay").val() != 0){
		var payA = "#payA";
		var Aid = "ACheckBtn"+Ano;
		payresult = payA+Ano;
		$.ajax({
			url : "/NHMP/getallow",
			type: "post",
			data : {Acode : Acode},
			success : function(data){
				
				var pay = $("#pay").val();
				var resultformula = data.replace("T01", pay);
				var resultA = Math.floor(eval(resultformula)/10)*10;
				if($("#"+s).prop('checked')){
					totalresultA = eval(eval(totalresultA)+eval(resultA));
					$(payresult).val(resultA);
					$("#totalA").val(totalresultA);
					$("#totalM").val( eval(eval($("#pay").val())-eval($("#totalD").val())+eval($("#totalA").val())) )  ;
					
				}else{
					totalresultA = eval(eval(totalresultA)-eval(resultA));
					$(payresult).val(0);
					$("#totalA").val(totalresultA);
					$("#totalM").val( eval(eval($("#pay").val())-eval($("#totalD").val())+eval($("#totalA").val())));
				}
				
			}, error : function(jqXHR, textStatus, errorThrown ){
				console.log("error : " + jqXHR + ", " + textStatus + ", " +errorThrown);
			}
		})
	}else{
		alert("한명의 직원을 선택하여 주세요");
		$('input[type="checkbox"][class="DCheckBtn"]').prop('checked', false);
		$('input[type="checkbox"][class="ACheckBtn"]').prop('checked', false);
	}
}

	
	
	
	

</script>


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
<!-- icon CDN 방식 적용 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
				<a href="/NHMP/views/ERP/main.jsp"> <b class="logo-abbr"><img
						src="/NHMP/resources/ERP/images/common/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="/NHMP/resources/ERP/images/common/logo-compact.png" alt=""></span>
					<span class="brand-title"> <img align="middle"
						src="/NHMP/resources/ERP/images/common/logo-text.png" ailgn="">
				</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>
				<div class="header-left">
					<div class="input-group icons">
						<div class="input-group-prepend">
							<span
								class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
								id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
						</div>
						<input type="search" class="form-control" placeholder="검색할 메뉴 명"
							aria-label="Search Dashboard">
						<div class="drop-down animated flipInX d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
						</div>
					</div>
				</div>
				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-email-outline"></i>
								<span class="badge badge-pill gradient-1">3</span>
						</a>
							<div class="drop-down animated fadeIn dropdown-menu">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">3 New Messages</span> <a
										href="javascript:void()" class="d-inline-block"> <span
										class="badge badge-pill gradient-1">3</span>
									</a>
								</div>
								<div class="dropdown-content-body">
									<ul>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/NHMP/resources/ERP/images/avatar/1.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Saiful Islam</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/NHMP/resources/ERP/images/avatar/2.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Adam Smith</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Can you do me a
														favour?</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/NHMP/resources/ERP/images/avatar/3.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Barak Obama</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img"
												src="/NHMP/resources/ERP/images/avatar/4.jpg" alt="">
												<div class="notification-content">
													<div class="notification-heading">Hilari Clinton</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hello</div>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i>
								<span class="badge badge-pill gradient-2">3</span>
						</a>
							<div
								class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">2 New Notifications</span> <a
										href="javascript:void()" class="d-inline-block"> <span
										class="badge badge-pill gradient-2">5</span>
									</a>
								</div>
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events near you</h6>
													<span class="notification-text">Within next 5 days</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Started</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Ended
														Successfully</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events to Join</h6>
													<span class="notification-text">After two days</span>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown d-none d-md-flex"><a
							href="javascript:void(0)" class="log-user" data-toggle="dropdown">
								<span>korean</span> <i class="fa fa-angle-down f-s-14"
								aria-hidden="true"></i>
						</a>
							<div
								class="drop-down dropdown-language animated fadeIn  dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()">English</a></li>
										<li><a href="javascript:void()">Korean</a></li>
									</ul>
								</div>
							</div></li>
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
												<span>마이페이지</span></a></li>
										<li><a href="javascript:void()"> <i
												class="icon-envelope-open"></i> <span>Inbox</span>
												<div class="badge gradient-3 badge-pill gradient-1">3</div>
										</a></li>

										<hr class="my-2">
										<li><a href="page-lock.html"><i class="icon-lock"></i>
												<span>Lock Screen</span></a></li>
										<li><a href="page-login.html"><i class="icon-key"></i>
												<span>Logout</span></a></li>
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
						href="javascript:void()" aria-expanded="false"> <i
							class="fa fa-users"></i><span class="nav-text">인사관리</span> <!-- <i class="icon-globe-alt menu-icon"></i><span class="nav-text">인사설정</span>-->
					</a>
						<ul aria-expanded="false">
							<li><a href="layout-blank.html">인사정보관리</a></li>
							<li><a href="layout-one-column.html">인사정보등록</a></li>
							<li><a href="layout-two-column.html">조직도</a></li>
						</ul>
					</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-id-card"></i> <span
							class="nav-text">권한설정</span>
					</a>
						<% if(loginHospital != null) { %>
						<ul aria-expanded="false">
							<li><a href="/NHMP/authall">권한부여관리</a></li>
						</ul>
						<% } %>
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
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-usd"></i><span
							class="nav-text">급여 관리</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/deduclise">공제항목등록</a></li>
							<li><a href="/NHMP/allowlist">수당항목등록</a></li>
							<li><a href="/NHMP/paylistD">급여계산</a></li>
						</ul>
					<li><a href="javascript:void()" aria-expanded="false"> <i
							class="fa fa-slideshare"></i> <span class="nav-text">공지사항</span>
					</a></li>
					<li><a href="javascript:void()" aria-expanded="false"> <i
							class="fa fa-download"></i> <span class="nav-text">자료실</span>
					</a></li>
			</div>
			</ul>
		</div>

		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div id="rootdiv">
				<form action="">
					<br> <br>
					<div id="Paylist">
						<div id="Payleft"">
							<table border="1" margin="0 0 0 0">
								<tr>
									<th>선택</th>
									<th>이름</th>
									<th>사번</th>
								</tr>
								<%
									for (Employee e : Elist) {
								%>
								<tr align="center">
									<td><input type="checkbox" name="ECheckBtn"
										id="ECheckBtn<%=e.getEmpId()%>" class="CECheckBtn"
										onclick="Echeckbox('<%=e.getEmpId()%>')"
										style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>
									<td><%=e.getEmpName()%></td>
									<td><%=e.getEmpId()%></td>
								</tr>
								<%
									}
								%>
								<!-- 디비에서 list 받아서 가져오기 -->
							</table>
						</div>
						<!-- Payleft -->

						<div id="Paycenter">
							<table width="auto" border="1" margin="0 0 0 0">
								<tr>
									<th>선택</th>
									<th align="center">공제명칭1</th>
								</tr>
								<%
									for (Deduction d : Dlist) {
								%>
								<tr align="center">
									<td><input type="checkbox" class="DCheckBtn"
										id="DCheckBtn<%=d.getDEDUCTION_NO()%>"
										onclick="Dcheckbox('<%=d.getDEDUCTION_CODE()%>','<%=d.getDEDUCTION_NO()%>')"
										style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem">
									</td>
									<td><%=d.getDEDUCTION_NAME()%></td>
								</tr>
								<%
									}
								%>
								<!-- 디비에서 list 받아서 가져오기 -->
							</table>
						</div>
						<!-- Paycenter -->

						<div id="Payright">
							<table width="auto" border="1" margin="0 0 0 0">
								<tr>
									<th>선택</th>
									<th align="center">수당명칭2</th>
								</tr>
								<%
									for (Allowance a : Alist) {
								%>
								<tr align="center">
									<td><input type="checkbox" class="ACheckBtn" 
										id="ACheckBtn<%= a.getALLOWANCE_NO() %>"
										onclick="Acheckbox('<%= a.getALLOWANCE_CODE() %>','<%= a.getALLOWANCE_NO() %>')"
										style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>
									<td><%=a.getALLOWANCE_NAME()%></td>
								</tr>
								<%
									}
								%>
								<!-- 디비에서 list 받아서 가져오기 -->
							</table>
						</div>
						<!-- Payright -->
						<div id="Payresult">
							<table border="1">
								<div id="Payresult">
									<table border="1">
										<%
											for (Allowance a : Alist) {
										%>
										<tr>
											<th style="text-align: center;"><%=a.getALLOWANCE_NAME()%>
											<td style="text-align: center;"><input type="text"
												id="payA<%= a.getALLOWANCE_NO() %>" class="CpayA"
												value="0" style="text-align: right; width: 140px;" readonly>원
											</td>
											</th>
											</th>
											<%
												}
											%>
										
										<tr>
											<th style="text-align: center;">수당총액
											<td style="text-align: center;"><input type="text"
												id="totalA" value="0"
												style="text-align: right; width: 140px;" readonly>원
											</td>
											</th>
										</tr>
										<tr>
											<th style="text-align: center;">월수령액
											<td style="text-align: center;"><input type="text"
												id="totalM" value="0"
												style="text-align: right; width: 140px;" readonly>원
											</td>
											</th>
										</tr>
									</table>
								</div>

								<div id="Payresult">
									<table border="1" id="resultwindow">
										<%
											for (Deduction d : Dlist) {
										%>
										<tr>
											<th style="text-align: center;"><%=d.getDEDUCTION_NAME()%>
											<td style="text-align: center;"><input type="text"
												id="payD<%=d.getDEDUCTION_NO()%>" class="CpayD" value="0"
												style="text-align: right; width: 140px;" readonly>원
											</td>
											</th>
											</th>
											<%
												}
											%>
										
										<tr>
											<th style="text-align: center;">공제총액
											<td style="text-align: center;"><input type="text"
												id="totalD" value="0"
												style="text-align: right; width: 140px;" readonly>원
											</td>
											</th>
										</tr>
										<tr>
											<th style="text-align: center;">기본급
											<td style="text-align: center;"><input type="text"
												id="pay" value="0" style="text-align: right; width: 140px;"
												readonly>원</td>
											</th>
										</tr>
									</table>
								</div>
							</table>
						</div>
					</div>
				</form>
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
							href="https://themeforest.net/user/quixlab">이민삼수</a> 2019
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
</body>

</html>
