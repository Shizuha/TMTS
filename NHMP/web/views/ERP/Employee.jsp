<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ERP.Employee.model.vo.Employee,
				 java.util.ArrayList,
				 ERP.Calendar.Model.vo.Calendar" %>

<%//스크립트 립 태그라고 함 //위에 페이지있는건 디렉트 태그라고 함.
	Employee emp = (Employee)session.getAttribute("loginEmployee");
	ArrayList<Calendar> list = (ArrayList<Calendar>)session.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>TMTS</title>
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
<!-- 캘린더 -->
<link href='/NHMP/resources/ERP/FullCaldendar/core/main.css' rel='stylesheet' />
<link href='/NHMP/resources/ERP/FullCaldendar/daygrid/main.css' rel='stylesheet' />
<link href='/NHMP/resources/ERP/FullCaldendar/list/main.css' rel='stylesheet' />

<script src='/NHMP/resources/ERP/FullCaldendar/core/main.js'></script>
<script src='/NHMP/resources/ERP/FullCaldendar/daygrid/main.js'></script>
<script src='/NHMP/resources/ERP/FullCaldendar/core/locales/ko.js'></script>

<script type="text/javascript" src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
<script> 
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar3');

  var calendar = new FullCalendar.Calendar(calendarEl, {
  	plugins: [ 'dayGrid', 'interaction', 'list'],
  	defaultView: 'dayGridMonth',
  	selectable: true,
  	locales : 'ko',

      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,addEventButton'
      },

      displayEventTime: false, // don't show the time column in list view
      customButtons: {
          addEventButton: {
            text: '일정 보기',
            click: function() {
          	 window.open("/NHMP/views/ERP/Calendar.jsp");
            }
          }
      }
    });

    calendar.render();
});

$(function(){    
    $.ajax({
		url : "/NHMP/ntop",
		type : "get",
		dataType : "json",
		success : function(data){
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			var values = "";
			
			for(var i in json.list){
				values += "<tr><td style='border-bottom: 1px solid #444444; padding: 10px; text-align: center;  background-color: #e3f2fd;'>" + json.list[i].no + 
				"</td><td style='border-bottom: 1px solid #444444; padding: 10px; text-align: center;  background-color: #e3f2fd;'>" + decodeURIComponent(json.list[i].title).replace(/\+/gi, " ")
				+ "</a></td><td style='border-bottom: 1px solid #444444; padding: 10px; text-align: center;  background-color: #e3f2fd;'>" + json.list[i].date + "</td></tr>";
				/* <a href='/frist/ndetail?no= */
			}
			/* <td style="border-bottom: 1px solid #444444; padding: 10px; text-align: center;  background-color: #e3f2fd; */
			$("#newNotice").html($("#newNotice").html() + values);
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
});
</script>
<!-- 스타일영역 -->

<style>


*, *:before, *:after {
  box-sizing:border-box;
}

.group {
  &:after {
    content: "";
    display: table;
    clear: both;
  }
}


a {
  text-decoration:none;
}

.max(@maxWidth;
  @rules) {
    @media only screen and (max-width: @maxWidth) {
      @rules();
    }
  }

.min(@minWidth;
  @rules) {
    @media only screen and (min-width: @minWidth) {
      @rules();
    }
  }

table {
  clear:both;
  width:100%;
  border:1px solid @calendar-border;
  border-radius:3px;
  border-collapse:collapse;
  color:@calendar-color;
} 
td {
  height:48px;
  text-align:center;
  vertical-align:middle;
  border-right:1px solid @calendar-border;
  border-top:1px solid @calendar-border;
  width:100% / 7;
}
 
td.not-current {
  color:@calendar-fade-color;;
}
td.normal {}
td.today {
  font-weight:700;
  color:@calendar-standout;
  font-size:1.5em;
}
thead td {
  border:none;
  color:@calendar-standout;
  text-transform:uppercase;
  font-size:1.5em;
} 
#btnPrev {
  	float:left;
  	margin-bottom:20px;
  	&:before {
    content:'\f104';
    font-family:FontAwesome;
  
    padding-right:4px;
  }
}
#btnNext {
  	float:right;
  	margin-bottom:20px;
  	&:after {
    content:'\f105';
    font-family:FontAwesome;
   
    padding-left:4px;
  }
}
#btnPrev, #btnNext {
  background:transparent;
  border:none;
  outline:none;
  font-size:1em;
  color:@calendar-fade-color;
  cursor:pointer;
  font-family:"Roboto Condensed", sans-serif;
  text-transform:uppercase;
  transition:all 0.3s ease;
  &:hover {
    color:@calendar-standout;
    font-weight:bold;
  }
}


.memberDiv{
	
	width: 100%;
	height: 420px;
	display: inline-block;
	padding: 10px;
	margin-left:10px;
}
.member{
	border-radius: 5px;
	background:white;
	box-shadow: 2px 2px 2px 1px gray;
	width: 33%;
	height:400px;
	float:left;
    color:rgba(0, 0, 0, 1);
}
.member img {
	border-radius: 50px;
	margin-top: 25px;
}

#header_list{
	list-style: none;
	margin-left: 30px;
	text-decoration: none;
}


.calendar1{
	display: inline-block;
	border-radius: 5px;
	background:white;
	box-shadow: 2px 2px 2px 1px gray;
	width: 57%;
	height: 400px;
	margin-left:10px;
}

.calendar2{
	width: 100%;
    height: 450px;
    display: inline-block;
    padding: 10px;
    margin-left: 10px;
}

.calendar{
	border-radius: 5px;
	background:white;
	display: inline-block;
	box-shadow: 2px 2px 2px 1px gray;
	width: 50%;
	height:550px;
	display: inline-block;
	float:left;
	border:1px solid @calendar-border;
	background:@calendar-bg;
	padding:5px;
}
.notice{
	border-radius: 5px;
	background:white;
	display: inline-block;
	box-shadow: 2px 2px 2px 1px gray;
	width: 40%;
	height: 550px;
	margin-left:10px;
	padding:5px;
	overflow:hidden;
#header_list{
	text-align:center;
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
                            <li><a href="layout-horizontal.html">Horizontal</a></li>
                            <li><a href="layout-boxed.html">Boxed</a></li>
                            <li><a href="layout-wide.html">Wide</a></li>


                            <li><a href="layout-fixed-header.html">Fixed Header</a></li>
                            <li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
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
							<li><a href="/NHMP/counsellistview">상담일지 등록</a></li>
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
							<!--
                            <li><a href="ui-button.html">Button</a></li>
                            <li><a href="ui-button-group.html">Button Group</a></li>
                            <li><a href="ui-cards.html">Cards</a></li>
                            -->
							<!-- </ul>
                    </li>



                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="uc-nestedable.html">Nestedable</a></li>
                            <li><a href="uc-noui-slider.html">Noui Slider</a></li>
                            <li><a href="uc-sweetalert.html">Sweet Alert</a></li>
                            <li><a href="uc-toastr.html">Toastr</a></li>
                        </ul>

                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>

                    <li class="nav-label">Forms</li>

                    <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="form-basic.html">Basic Form</a></li>
                            <li><a href="form-validation.html">Form Validation</a></li>
                            <li><a href="form-step.html">Step Form</a></li>
                            <li><a href="form-editor.html">Editor</a></li>
                            <li><a href="form-picker.html">Picker</a></li>
                        </ul>
                    </li> -->
							<!--
                    <li class="nav-label">Table</li>
                -->
							<!--    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="table-basic.html" aria-expanded="false">Basic Table</a></li>
                            <li><a href="table-datatable.html" aria-expanded="false">Data Table</a></li>
                        </ul>
                </li> -->
							<!--
                    <li class="nav-label">Pages</li>
                -->
							<!--  <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="page-login.html">Login</a></li>
                            <li><a href="page-register.html">Register</a></li>
                            <li><a href="page-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="page-error-404.html">Error 404</a></li>
                                    <li><a href="page-error-403.html">Error 403</a></li>
                                    <li><a href="page-error-400.html">Error 400</a></li>
                                    <li><a href="page-error-500.html">Error 500</a></li>
                                    <li><a href="page-error-503.html">Error 503</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>-->
						</ul>
					<li><a href="/NHMP/nlist" aria-expanded="false"> <i
							class="fa fa-slideshare"></i> <span class="nav-text">공지사항</span>
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
		<div class="content-body">
			<div class="memberDiv">
			<%if(emp != null){ %>
				<div class="member">
				<%if(emp.getEmpRenameFilename() != null){ %>
					<center><img alt="" src="/NHMP/resources/ERP/emp_Img_file/<%=emp.getEmpRenameFilename() %>"></center><br><br>
					<%}else{ %>
					<center><img alt="" src="/NHMP/resources/ERP/images/testimonial2.jpg"></center><br><br>
					<%} %>
					<ul id="header_list" style="border: 1px soild;">
						<li>사원코드 :<%=emp.getUserId() %></li><br>
						<li>부서 :<%=emp.getDeptCode() %> </li>
						<li style="font-size: 10pt;">팀 코드 :<%=emp.getTeamCode() %></li><br>
						<li>이름 :<%=emp.getEmpName() %></li><br>
						<li>담당병동 :<%=emp.getWardCode() %></li>
					</ul><br>
				</div>
				<% }else{ %>
				<div class="member">
					<center><img alt="" src="/NHMP/resources/ERP/images/testimonial2.jpg"></center><br><br>
					<ul id="header_list">
						<li>사원코드:</li><br>
						<li>부서:</li>
						<li style="font-size: 10pt;"></li><br>
						<li>이름:</li><br>
						<li>담당병동:</li>
					</ul><br>
				</div>
				<%} %>
				<div class="calendar1">
				<h2 style="background: rgb(117, 113, 249, 0.5);
      			color:rgba(0, 0, 0, 1); border-radius:3px; margin:3px;">금일일정</h2>
      			<% for(Calendar c : list){ %>
      			<table style="border: 1px #000 solid; border-collapse: collapse;">
      			<tr style="border: 1px #000 solid; border-collapse: collapse; ">
      				<th style="border: 1px #000 solid; border-collapse: collapse; padding:10px 30px; text-align: center; background-color: #bbdefb;">날짜</th>
      				<th style="border: 1px #000 solid; border-collapse: collapse; padding:10px 30px; text-align: center; background-color: #bbdefb;">일정명</th>
      				<th style="border: 1px #000 solid; border-collapse: collapse; padding:10px 30px; text-align: center; background-color: #bbdefb;">내용</th>
      			</tr>
      			<tr style="border: 1px #000 solid; border-collapse: collapse;">
      				<td style="border: 1px #000 solid; border-collapse: collapse; padding:10px 30px; background-color: #e3f2fd;"><%=c.getStartdate()%></td>
      				<td style="border: 1px #000 solid; border-collapse: collapse; padding:10px 30px; background-color: #e3f2fd;"><%=c.getTitle()%></td>
      				<td style="border: 1px #000 solid; border-collapse: collapse; padding:10px 30px; background-color: #e3f2fd;"><%=c.getDescription()%></td>
      			</tr>
      			</table>
      			<%} %>
				</div>
			</div>
		<div class="calendar2">
			<div class="calendar" style="overflow:hidden;">
			<div id='calendar3'></div>
		</div>
        	<div class="notice">
        		<div class="panel-heading" >
			<h3 style="font-size:13pt; font-weight:600; background: rgb(117, 113, 249, 0.5);
      			color:rgba(0, 0, 0, 1); height:30px; padding:3px; border-radius:4px;">공지사항</h3><div>
				<a href="/NHMP/nlist" title="공지사항"style="color:rgba(0, 0, 0, 1);">더보기 <i class="fa fa-angle-right"></i></a>
				
			</div>
		</div>
		<!-- Table -->
		<table id="newNotice" style="width: 100%; border-top: 1px solid #444444; border-collapse: collapse;">
				<tr>
					<th style="border-bottom: 1px solid #444444; padding: 10px; text-align: center; background-color: #bbdefb;">번호</th>
					<th style="border-bottom: 1px solid #444444; padding: 10px; text-align: center; background-color: #bbdefb;">내용</th>
					<th style="border-bottom: 1px solid #444444; padding: 10px; text-align: center; background-color: #bbdefb;">등록일</th>
				</tr>
			</table>
			<%-- <% for(Notice no : noList){ %>
				<tbody>
					<tr> 
						<td><a href="views/test/calendar.html" title="sfsdf"><%=no.getNoticeTitle() %></a>
													</td>
						<td class="px80"><%=no.getDate() %></td>
					</tr>
				</tbody>
				
				<%} %> --%>
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



		<script src="/NHMP/resources/ERP/js/dashboard/dashboard-1.js"></script>
</body>

</html>