<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="ERP.counselingLog.model.vo.CounselingLog, java.util.ArrayList"%>
<%
	ArrayList<CounselingLog> list = (ArrayList<CounselingLog>) request.getAttribute("list");
%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>TMTS</title>
<style type="text/css">
input[type=checkbox] {
	margin-left: 8px;
	vertical-align: middle;
	width: 1.0rem;
	height: 1.0rem
}

.root {
	margin-left: 50px;
	margin-top: 50px;
	align: center;
	text-align: center;
	width: 1100px;
	border: 1px solid blue;
}

.root .Authlist {
	float: right;
	text-align: center;
	width: 1100px;
	height: 250px;
	color: rgba(0, 0, 0, 1);
	border: 1px solid red;
}

.root .Authlist table {
	float: center;
	width: 1100px;
	background: rgb(241, 33, 104, 0.25);
}

.root .Authlist table th {
	background: rgb(117, 113, 249, 0.5);
	color: rgba(0, 0, 0, 1);
	text-align: center;
}

.root .btnlist input {
	width: 100px;
	background-color: #7571f9;
	border: none;
	color: #fff;
	border-radius: 3px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
}

.root #BLbtn {
	float: left;
	width: 1100px;
}

.root #BLbtn input {
	float: left;
	width: 70px;
	background-color: #7571f9;
	border: none;
	color: #fff;
	border-radius: 3px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
}

.root #BLbtn #SDbtn {
	float: right;
	width: 100px;
}

.content-body {
	margin-left : 50px;
	margin-top : 50px;
	align : center;
	text-align : center;
	width : 1400px;
	float : right;
}
</style>

<script type="text/javascript">
	$(function() {
		showDiv();

		$("input[name=click]").on("change", function() {
			showDiv();
		});
	});

	function showDiv() {
		if ($("input[name=click]").eq(0).is(":checked")) {
			$("#cl_title_div").css("display", "block");
			$("#cl_emp_name_div").css("display", "none");
		}

		if ($("input[name=click]").eq(1).is(":checked")) {
			$("#cl_title_div").css("display", "none");
			$("#cl_emp_name_div").css("display", "block");
		}
	}

	function moveinsert() {
		location.href = "/NHMP/views/ERP/counselingLog/CounselingLogInsertView.jsp";
		return false;
	}

	function movemain() {
		location.href = "/NHMP/views/ERP/Admin_main.jsp";
		return false;
	}
</script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/NHMP/resources/ERP/images/common/favicon.png">
<!-- Pignose Calender -->
<link
	href="/NHMP/resources/ERP/css/plugins/pg-calendar/css/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
	href="/NHMP/resources/ERP/css/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="/NHMP/resources/ERP/css/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="/NHMP/resources/ERP/css/style.css?after" rel="stylesheet">
<!-- 캘린더 -->
<link href='/NHMP/resources/ERP/FullCaldendar/core/main.css'
	rel='stylesheet' />
<link href='/NHMP/resources/ERP/FullCaldendar/daygrid/main.css'
	rel='stylesheet' />
<link href='/NHMP/resources/ERP/FullCaldendar/list/main.css'
	rel='stylesheet' />

<script src='/NHMP/resources/ERP/FullCaldendar/core/main.js'></script>
<script src='/NHMP/resources/ERP/FullCaldendar/daygrid/main.js'></script>
<script src='/NHMP/resources/ERP/FullCaldendar/core/locales/ko.js'></script>
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
				<a href="/NHMP/views/ERP/Admin_main.jsp"> <b class="logo-abbr"><img
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
							<li><a href="/NHMP/list">인사정보관리</a></li>
							<li><a href="layout-one-column.html">인사정보등록</a></li>
							<li><a href="layout-two-column.html">조직도</a></li>
						</ul></li>
					<!-- <li class="nav-label">Apps</li> -->
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-id-card"></i> <span
							class="nav-text">권한설정</span> <!--    <i class="icon-envelope menu-icon"></i> <span class="nav-text">권한설정</span> -->
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/Cautholist">권한관리</a></li>
							<li><a href="/NHMP/Cauthmanager">권한부여관리</a></li>
						</ul></li>
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
					<!--   <li class="nav-label">UI Components</li>  -->
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-usd"></i><span
							class="nav-text">급여 관리</span> <!--    <i class="icon-grid menu-icon"></i><span class="nav-text">급여 관리</span>  -->
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
       <h2 align="center">상담일지 등록 페이지</h2>
		<div class="content-body">
			<form action="/NHMP/counselinsert" method="post" enctype="multipart/form-data">
<table align="center" width="600" border="3" cellspacing="0" cellpadding="5">
<tr><th>상담일지번호</th><td><input type="number" name="cl_no" id="cl_no" ></td></tr>
<tr><th>제목</th><td><input type="text" name="cl_title" id="cl_title" ></td></tr>
<tr><th>날짜</th><td><input type="date" name="cl_date" id="cl_date" ></td></tr>
<tr><th>내용</th><td><input type="text" name="cl_contents" id="cl_contents" ></td></tr>
<tr><th>연락처</th><td>
<input type="tel" name="cl_phone">
</td></tr>
<tr><th>비고</th><td><input type="text" name="cl_comment" id="cl_comment" ></td></tr>
<tr><th>환자명</th><td><input type="text" name="cl_pat_name" id="cl_pat_name" ></td></tr>
<tr><th>상담자</th><td><input type="text" name="cl_emp_name" id="cl_emp_name" ></td></tr>
<tr><th>첨부파일</th><td><input type="file" name="cl_original_filename" id="cl_original_filename" ></td></tr>
<tr>
<th colspan="2" align="center">
<input type="submit" value="등록하기"> &nbsp; &nbsp; &nbsp;
<input type="reset" value="취소하기"> &nbsp; &nbsp; &nbsp;
<input type="button" value="목록" onclick="return movemain();"> &nbsp; &nbsp; &nbsp;
<a href="javascript:history.go(-1)">이전페이지로 이동</a></th>
</tr>
</table>
</form>
			<!-- #/ container -->
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
						href="https://themeforest.net/user/quixlab">이민삼수</a> 2018
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



	<!-- <script src="/NHMP/resources/ERP/js/dashboard/dashboard-1.js"></script> -->
</body>

</html>
