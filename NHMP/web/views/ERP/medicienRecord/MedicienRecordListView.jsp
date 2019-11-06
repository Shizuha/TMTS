<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="ERP.medicienRecord.model.vo.MedicienRecord, java.util.ArrayList,
	ERP.Employee.model.vo.Employee"%>
<%
	ArrayList<MedicienRecord> list = (ArrayList<MedicienRecord>) request.getAttribute("list");
	Employee emp = (Employee) session.getAttribute("loginEmployee");
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int beginPage = ((Integer) request.getAttribute("beginPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
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
<!-- 메인 CSS 처리용 -->
<link href="/NHMP/resources/ERP/css/style.css?after" rel="stylesheet">
<link href="/NHMP/resources/ERP/css/employeeListViewCss.css"
	rel="stylesheet">
<!-- 아이콘 처리용 -->
<link href="/NHMP/resources/ERP/vender/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">



<!-- 스크립트태그 -->
<script type="text/javascript"
	src="/NHMP/resources/ERP/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		showDiv();

		$("input[name=click]").on("change", function() {
			showDiv();
		});
	});

	function showDiv() {
		if ($("input[name=click]").eq(0).is(":checked")) {
			$("#mr_pat_name_div").css("display", "block");
			$("#mr_emp_name_div").css("display", "none");
		}

		if ($("input[name=click]").eq(1).is(":checked")) {
			$("#mr_pat_name_div").css("display", "none");
			$("#mr_emp_name_div").css("display", "block");
		}
	}
</script>
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
				<%
					if (emp != null) {
				%>
				<a href="/NHMP/views/ERP/Employee.jsp"> <b class="logo-abbr"><img
						src="/NHMP/resources/ERP/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="/NHMP/resources/ERP/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="/NHMP/resources/ERP/images/common/logo-text.png" alt="">
				</span>
				</a>
				<%
					} else {
				%>
				<a href="/NHMP/views/ERP/Admin_main.jsp"> <b class="logo-abbr"><img
						src="/NHMP/resources/ERP/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="/NHMP/resources/ERP/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="/NHMP/resources/ERP/images/common/logo-text.png" alt="">
				</span>
				</a>
				<%
					}
				%>
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
				<%
					if (emp != null) {
				%>
				<ul class="metismenu" id="menu">
					<%
						if (emp.getAuthorityCode().equals("G5")) {
					%>
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="javascript:void()" aria-expanded="false"> <i
							class="fa fa-users"></i><span class="nav-text">인사관리</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/list">전체사원조회</a></li>
							<li><a href="/NHMP/views/ERP/Employee/InsertEmployee.jsp">인사정보등록</a></li>
							<li><a href="/NHMP/ochart">조직도</a></li>
						</ul></li>
					<%
						}
					%>
					<%
						if (emp.getAuthorityCode().equals("G2")) {
					%>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-plus-square"></i><span
							class="nav-text">환자 관리</span> <!--   <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">환자 관리</span> -->
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/patientlistview">전체환자 조회</a></li>
							<li><a href="/NHMP/views/ERP/patient/PatientInsertView.jsp">환자
									입원 등록</a></li>
							<li><a
								href="/NHMP/views/ERP/counselingLog/CounselingLogInsertView.jsp">상담일지
									등록</a></li>
							<li><a
								href="/NHMP/views/ERP/medicienRecord/MedicienRecordInsertView.jsp">투약일지
									등록</a></li>
						</ul></li>
					<%
						}
					%>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-usd"></i><span
							class="nav-text">급여 관리</span> <!--    <i class="icon-grid menu-icon"></i><span class="nav-text">급여 관리</span>  -->
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/Epaylist">급여계산</a></li>
						</ul>
					<li><a href="/NHMP/nlist" aria-expanded="false"> <i
							class="fa fa-slideshare"></i> <span class="nav-text">공지사항</span>
					</a></li>
					<li><a href="/NHMP/drlist" aria-expanded="false"> <i
							class="fa fa-download"></i> <span class="nav-text">자료실</span>
					</a></li>
					<%
						} else {
					%>
					<ul class="metismenu" id="menu">
						<li class="mega-menu mega-menu-sm"><a class="has-arrow"
							href="javascript:void()" aria-expanded="false"> <i
								class="fa fa-users"></i><span class="nav-text">인사관리</span>
						</a>
							<ul aria-expanded="false">
								<li><a href="/NHMP/list">전체사원조회</a></li>
								<li><a href="/NHMP/views/ERP/Employee/InsertEmployee.jsp">인사정보등록</a></li>
								<li><a href="/NHMP/ochart">조직도</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class="fa fa-id-card"></i> <span
								class="nav-text">권한설정</span>
						</a>
							<ul aria-expanded="false">
								<li><a href="/NHMP/authlist">권한부여관리</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class="fa fa-plus-square"></i><span
								class="nav-text">환자 관리</span>
						</a>
							<ul aria-expanded="false">
								<li><a href="/NHMP/patientlistview">전체환자 조회</a></li>
								<li><a href="/NHMP/views/ERP/patient/PatientInsertView.jsp">환자
										입원 등록</a></li>
								<li><a
									href="/NHMP/views/ERP/counselingLog/CounselingLogInsertView.jsp">상담일지
										등록</a></li>
								<li><a
									href="/NHMP/views/ERP/medicienRecord/MedicienRecordInsertView.jsp">투약일지
										등록</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class="fa fa-usd"></i><span
								class="nav-text">급여 관리</span>
						</a>
							<ul aria-expanded="false">
								<li><a href="/NHMP/Epaylist">급여계산</a></li>
							</ul> <%
 	}
 %>
						<li><a href="/NHMP/nlist.ad" aria-expanded="false"> <i
								class="fa fa-slideshare"></i> <span class="nav-text">공지사항</span>
						</a></li>
						<li><a href="/NHMP/drlist.ad" aria-expanded="false"> <i
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
		<div class="content-body" align="center" style="padding: 40px;">
			<h2 align="center">
				투약일지 전체 목록 :
				<%=list.size()%>
				개
			</h2>
			<center>
				<div class="searchbox">
					<div>
						<h2>검색할 항목을 선택하세요</h2>
						<input type="radio" name="click" value="mr_pat_name" checked
							style="font-size: 16px;"><label style="font-size: 16px;">
							환자명 </label> &nbsp; &nbsp; &nbsp; <input type="radio" name="click"
							value="mr_emp_name" style="font-size: 16px;"> <label
							style="font-size: 16px;">투약자 </label> &nbsp; &nbsp; &nbsp;
					</div>
					<div id="mr_pat_name_div">
						<form action="/NHMP/recordsearch" method="post">
							<input type="hidden" name="search" value="mr_pat_name"
								style="font-size: 16px;"> <label
								style="font-size: 16px;">검색할 환자명을 입력하시오 : <input
								type="search" name="mr_pat_name" style="font-size: 16px;">
							</label> <input type="submit" value="검색" style="font-size: 16px;">
						</form>
					</div>
					<div id="mr_emp_name_div">
						<form action="/NHMP/recordsearch" method="post">
							<input type="hidden" name="search" value="mr_emp_name"> <label
								style="font-size: 16px;">검색할 투약자를 입력하시오 : <input
								type="search" name="mr_emp_name" style="font-size: 16px;">
							</label> <input type="submit" value="검색" style="font-size: 16px;">
						</form>
					</div>
				</div>
			</center>
			<table align="center" width="1200" border="1" cellspacing="1"
				cellpadding="5">
				<tr>
					<th style="font-size: 16px;">투약일지번호</th>
					<th style="font-size: 16px;">날짜</th>
					<th style="font-size: 16px;">증상</th>
					<th style="font-size: 16px;">투약명</th>
					<th style="font-size: 16px;">투약시간</th>
					<th style="font-size: 16px;">용량</th>
					<th style="font-size: 16px;">비고</th>
					<th style="font-size: 16px;">환자명</th>
					<th style="font-size: 16px;">투약자</th>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						MedicienRecord mr = list.get(i);
				%>
				<tr>
					<td align="center" style="font-size: 16px;"><a
						href="/NHMP/recorddetail?mr_no=<%=mr.getMrNo()%>"><%=mr.getMrNo()%></a></td>
					<td style="font-size: 16px;"><%=mr.getMrDate()%></td>
					<td style="font-size: 16px;"><%=mr.getMrState()%></td>
					<td style="font-size: 16px;"><%=mr.getMrName()%></td>
					<td style="font-size: 16px;"><%=mr.getMrTime()%></td>
					<td style="font-size: 16px;"><%=mr.getMrMany()%></td>
					<td style="font-size: 16px;"><%=mr.getMrComment()%></td>
					<td style="font-size: 16px;"><%=mr.getMrPatName()%></td>
					<td style="font-size: 16px;"><%=mr.getMrEmpName()%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th colspan="30"><a href="javascript:history.go(-1);"
						style="font-size: 16px;">이전페이지로 이동</a></th>
				</tr>
			</table>
			<div id="pagebox" align="center">
				<a href="/NHMP/recordlistview?page=1">|◁</a> &nbsp;
				<%
					if ((beginPage - 10) < 1) {
				%>
				<a href="/NHMP/recordlistview?page=1">◀◀</a>
				<%
					} else {
				%>
				<a href="/NHMP/recordlistview?page=<%=beginPage - 10%>">◀◀</a>
				<%
					}
				%>
				&nbsp;
				<%
					for (int p = beginPage; p <= endPage; p++) {
						if (p == currentPage) {
				%>
				<a href="/NHMP/recordlistview?page=<%=p%>"><font color="red"><b>[<%=p%>]
					</b></font></a>
				<%
					} else {
				%>
				<a href="/NHMP/recordlistview?page=<%=p%>"><%=p%></a>
				<%
					}
					}
				%>
				&nbsp;
				<%
					if ((endPage + 10) > maxPage) {
				%>
				<a href="/NHMP/recordlistview?page=<%=maxPage%>">▶▶</a>
				<%
					} else {
				%>
				<a href="/NHMP/recordlistview?page=<%=endPage + 10%>">▶▶</a>
				<%
					}
				%>
				&nbsp; <a href="/NHMP/recordlistview?page=<%=maxPage%>">▷|</a>
			</div>
			<div align="center">
				<a href="/NHMP/views/ERP/Employee.jsp">홈으로 이동</a>
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