<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@
	page import="Main.NursingHospital.model.ov.NursingHospital, java.util.ArrayList, ERP.Deduction.model.vo.Deduction"%>

<%
	NursingHospital loginHospital = (NursingHospital)session.getAttribute("loginHospital");
	ArrayList<Deduction> list = (ArrayList<Deduction>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>TMTS</title>
<script type="text/javascript" src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	function showPopup(url, name) { 
		window.open(url, name, "width=570px, height=650px, left=900, top=50"); 
	}
	
	$(function(){
		var count = <%= list.size()+1 %>;
		$("#btn_add_row").click(function(){
			var lastTr = 'lastTr'+count;
			var last = $('#'+lastTr);
			count +=1;
			var addtr = '<tr align="center" id="lastTr'+count+'">'+
						'	<td><input type="checkbox" style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>'+
						'	<td><input type="text" name="Dname" style="text-align:center; width:100px;" placeholder="공제명"></td>'+
						'	<td><input type="text" name="Dno" value="'+count+'" readonly style="text-align:center; width:25px;"></td>'+
						'	<td><input type="text" name="Dcode" style="text-align:center; width:50px;" placeholder="코드"></td>'+
						'	<td><input type="text" name="Dformula" style="text-align:center; width:100px;" placeholder="계산식"></td>'+
						'	<td><input type="checkbox" id="inFCheck'+count+'" onclick="inFCheck('+count+')" style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>'+
						'	<td><input type="button" class="inFbtn'+count+'" value="수식 입력" onclick="showPopup('+"'/NHMP/insertF','insertF'"+');"disabled></td>'+
						'	<td><input type="text" name="Detc" style="text-align:center; width:100px;" placeholder="설명"></td>'+
						'</tr>';
			last.after(addtr);
		});
		
		$("#btn_delete_row").click(function(){
			if(count >= <%= list.size()+2 %>){
				var lastTr = 'lastTr'+count;		
				var last = $('#'+lastTr);
				last.remove();
				count -= 1;	
			}
		});
		
		
	
		
	});
	
	//수식입력 토글 미완성
	function inFCheck(no){
		var checkbtn = "inFbtn"+no; //체크박스	
		var $checkbtn = $("#"+checkbtn);
		var inFbtn = "inFbtn"+no;	//수식넣기 버튼
		var $inFbtn = $("."+checkbtn);
		if( $inFbtn.attr("disabled") == "disabled" ){
			console.log($inFbtn.attr("disabled"));	
			$inFbtn.removeAttr("disabled");
		}else{
			console.log($inFbtn.attr("disabled") == "disabled");
			$inFbtn.attr("disabled", true);
		}
		
		
	}
/* 
// disabled 처리
$("#txtBox").attr("disabled",true);

// disabled 삭제
$("#txtBox").removeAttr("disabled"); */
	
	
	
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
							<li><a href="/NHMP/paylist">급여계산</a></li>
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
		<div class="content-body" align="center" >
			<br>
			<div style="margin-left:50px;">
				<div style="float: left;">
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="┼" id="btn_add_row" width="25px"> &nbsp;
				<input type="button" value="─" id="btn_delete_row" width="25px">	
						
				</div>
				<br>
				<br>	
				<form action="/NHMP/deducinsert" method="post">
					<table width="1000" cellspacing="0" cellpadding="5" border="1" id="deduction_talbe" style="float: left; ">
						<tr>
							<th></th>
							<th align="center">공제명칭</th>
							<th align="center">표시순서</th>
							<th align="center">계정코드</th>
							<th align="center">계산식</th>
							<th align="center">계산항목</th>
							<th align="center">수식 입력</th>
							<th align="center">비고</th>
						</tr>
						<% for(Deduction d : list){%>
						<tr align="center">
							<td><input type="checkbox" style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>
							<td><input type="text" value="<%= d.getDEDUCTION_NAME() %>" readonly style="text-align:center; width:100px;"></td>
							<td><input type="text" value="<%= d.getDEDUCTION_NO() %>" readonly style="text-align:center; width:25px;"></td>
							<td><input type="text" value="<%= d.getDEDUCTION_CODE() %>" readonly style="text-align:center; width:50px;"></td>
							<td><input type="text" value="<%= d.getDEDUCTION_FORMULA() %>" readonly style="text-align:center; width:100px;"></td>
							<td><input type="checkbox" id="inFCheck<%= d.getDEDUCTION_NO() %>" onclick="inFCheck(<%= d.getDEDUCTION_NO() %>)" style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>
							<td><input type="button" class="inFbtn<%= d.getDEDUCTION_NO() %>" value="수식 입력" onclick="showPopup('/NHMP/insertF', 'insertF');"disabled></td>
							<td><%= d.getDEDUCTION_NAME() %><br> <% if( !d.getDEDUCTION_NAME().equals("null") ) {%>
								<div id="Deduction">
									<div>
										<span><i class="fa fa-info-circle" aria-hidden="true"></i></span>
										<p class="arrow_box"><%= d.getDEDUCTION_ETC() %></p>
									</div>
								</div> <% } %>
						</tr>
						<% } %>
						<tr align="center" id="lastTr<%= list.size()+1 %>">
							<td><input type="checkbox" style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>
							<td><input type="text" name="Dname" style="text-align:center; width:100px;" placeholder="공제명"></td>
							<td><input type="text" name="Dno" value="<%= list.size()+1 %>" readonly style="text-align:center; width:25px;"></td>
							<td><input type="text" name="Dcode" style="text-align:center; width:50px;" placeholder="코드"></td>
							<td><input type="text" name="Dformula" id="Formula" style="text-align:center; width:100px;" readonly placeholder="계산식"></td>
							<td><input type="checkbox" id="inFCheck<%= list.size()+1 %>" onclick="inFCheck(<%= list.size()+1 %>)" style="text-align: center; vertical-align: middle; width: 1.0rem; height: 1.0rem"></td>
							<td><input type="button"  class="inFbtn<%= list.size()+1 %>" value="수식입력"  onclick="showPopup('/NHMP/insertF', 'insertF');"disabled></td>
							<td><input type="text" name="Detc" style="text-align:center; width:100px;" placeholder="설명"></td>
						</tr>
						<!-- 디비에서 list 받아서 가져오기 -->
						<tr>
							<td colspan="8" align="center">
								<input type="submit" value="저장"  width="50px" > &nbsp;
								<input type="reset" value="초기화"  width="50px">
							</td>
						</tr>
					</table>
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