<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Main.NursingHospital.model.ov.NursingHospital"%>
<%
	NursingHospital loginAdmin = (NursingHospital)session.getAttribute("loginHospital");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>TMTS</title>
<script type="text/javascript" src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
<script> 

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
	
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
                	 window.open("/NHMP/views/ERP/Calendar.jsp", "", "width=800px, height=600px, left=400, top=200");
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

$(function(){
	//직원수
	$.ajax({
		url : "/NHMP/empcount",
		type : "get",
		success : function(data) {
			$("#empcount").html(data+" 명");
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}

	});
	//신청 대기자 수 
	$.ajax({
		url : "/NHMP/patientcount",
		type : "get",
		success : function(data) {
			$("#patientcount").html(data+" 명");

		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}

	});
	$.ajax({
		url : "/NHMP/wardcount",
		type : "get",
		success : function(data) {
			$("#wardcount").html(data+" 개");

		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}

	});
});
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
<link href='/NHMP/resources/ERP/FullCaldendar/core/main.css' rel='stylesheet' />
<link href='/NHMP/resources/ERP/FullCaldendar/daygrid/main.css' rel='stylesheet' />
<link href='/NHMP/resources/ERP/FullCaldendar/list/main.css' rel='stylesheet' />

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
										<li><a href="/NHMP/views/ERP/Calendar.jsp" onClick="window.open(this.href, '', 'width=800px, height=600px, left=400, top=200'); return false;"><i
												class="icon-lock"></i> <span>일정관리</span></a></li>
										<li><a href="/NHMP/logouts"><i class="icon-key"></i> <span>로그아웃</span></a></li>
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
							class="nav-text">환자 관리</span> <!--   <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">환자 관리</span> -->
					</a>

						<ul aria-expanded="false">
							<li><a href="/NHMP/patientlistview">전체환자 조회</a></li>
							<li><a href="/NHMP/views/ERP/patient/PatientInsertView.jsp">환자 입원 등록</a></li>
							<li><a href="/NHMP/views/ERP/counselingLog/CounselingLogInsertView.jsp">상담일지 등록</a></li> <!-- 경로 수정 -->
							<li><a href="/NHMP/views/ERP/medicienRecord/MedicienRecordInsertView.jsp">투약일지 등록</a></li> <!-- 경로 수정 -->
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-usd"></i><span
							class="nav-text">급여 관리</span> <!--    <i class="icon-grid menu-icon"></i><span class="nav-text">급여 관리</span>  -->
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/deduclise">공제항목등록</a></li>
							<li><a href="/NHMP/allowlist">수당항목등록</a></li>
							<li><a href="/NHMP/paylist">급여계산</a></li>
						
						</ul>
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
		<div class="content-body">

			<div class="container-fluid mt-3" style="width: 96%;">
				<div class="row">
					<div class="col-lg-3 col-sm-6">
						<div class="card gradient-1">
							<div class="card-body">
								<h3 class="card-title text-white">직원 수</h3>
								<div class="d-inline-block">
									<h2 class="text-white" id="empcount">명</h2>
									<!--    <p class="text-white mb-0">Jan - March 2019</p> -->
								</div>
								<span class="float-right display-5 opacity-5"><i
									class="fa fa-address-book"></i></span>
							</div>
						</div>
					</div>
					<div class="col-lg-3
					 col-sm-6">
						<div class="card gradient-2">
							<div class="card-body">
								<h3 class="card-title text-white">환자 수</h3>
								<div class="d-inline-block">
									<h2 class="text-white" id="patientcount">명</h2>
									<!--    <p class="text-white mb-0">Jan - March 2019</p> -->
								</div>
								<span class="float-right display-5 opacity-5"><i
									class="fa fa-wheelchair"></i></span>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6">
						<div class="card gradient-3">
							<div class="card-body">
								<h3 class="card-title text-white">병동</h3>
								<div class="d-inline-block">
									<h2 class="text-white" id="wardcount">개</h2>
									<!--        <p class="text-white mb-0">Jan - March 2019</p> -->
								</div>
								<span class="float-right display-5 opacity-5"><i
									class="fa fa-hospital-o"></i></span>
							</div>
						</div>
					</div>
					<!-- <div class="col-lg-3 col-sm-6">
						<div class="card gradient-4">
							<div class="card-body">
								<h3 class="card-title text-white">즐겨찾기_4</h3>
								<div class="d-inline-block">
									<h2 class="text-white">메뉴 명</h2>
									       <p class="text-white mb-0">Jan - March 2019</p>
								</div>
								<span class="float-right display-5 opacity-5"><i
									class="fa fa-question"></i></span>
							</div>
						</div> -->
					</div>
				</div>
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-12">
                             <div class="card-body">
                             	<h2 style=" text-align:center; background: rgb(117, 113, 249, 0.5);color:rgba(0, 0, 0, 1); border-radius:3px; margin:3px;">금일일정</h2>
                                         <div id='calendar'></div>
                                    </div>
                                       </div>
                                    <div class="card">
                                <div class="card-body" style="background: #f3f3f9; padding:20px;">
                                <h2 style="text-align:center; background: rgb(117, 113, 249, 0.5);color:rgba(0, 0, 0, 1); border-radius:3px; margin:3px;">공지사항</h2>
                                    <h4 class="card-title">
                                    <a href="/NHMP/nlist.ad" title="공지사항"style="color:rgba(0, 0, 0, 1);">더보기 <i class="fa fa-angle-right"></i></a>
								<table id="newNotice" style="width: 500px; border-top: 1px solid #444444; border-collapse: collapse;">
										<tr>
											<th style="border-bottom: 1px solid #444444; padding: 10px; text-align: center; background-color: #bbdefb;">번호</th>
											<th style="border-bottom: 1px solid #444444; padding: 10px; text-align: center; background-color: #bbdefb;">내용</th>
											<th style="border-bottom: 1px solid #444444; padding: 10px; text-align: center; background-color: #bbdefb;">등록일</th>
										</tr>
								</table>
							</h4>
                                    <div id="morris-bar-chart"></div>
                                </div>
                            </div>	
                                     <div class="col-lg-6 col-md-12">
                                </div>
                            </div>
                        </div>
                       <!-- <div class="col-lg-3 col-md-6">
                            <div class="card card-widget">
                                <div class="card-body">
                                    <h5 class="text-muted">Order Overview </h5>
                                    <h2 class="mt-4">5680</h2>
                                    <span>Total Revenue</span>
                                    <div class="mt-4">
                                        <h4>30</h4>
                                        <h6>Online Order <span class="pull-right">30%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-primary" style="width: 30%;" role="progressbar"><span class="sr-only">30% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <h4>50</h4>
                                        <h6 class="m-t-10 text-muted">Offline Order <span class="pull-right">50%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-success" style="width: 50%;" role="progressbar"><span class="sr-only">50% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <h4>20</h4>
                                        <h6 class="m-t-10 text-muted">Cash On Develery <span class="pull-right">20%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-warning" style="width: 20%;" role="progressbar"><span class="sr-only">20% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
              -->
				<!--            <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-0">
                                    <h4 class="card-title px-4 mb-3">Todo</h4>
                                    <div class="todo-list">
                                        <div class="tdl-holder">
                                            <div class="tdl-content">
                                                <ul id="todo_list">
                                                    <li><label><input type="checkbox"><i></i><span>Get up</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox"><i></i><span>Don't give up the fight.</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
                                                </ul>
                                            </div>
                                            <div class="px-4">
                                                <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            -->
				<!--     <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/8.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">Ana Liem</h5>
                                    <p class="m-0">Senior Manager</p>
                                    <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a>
                                </div>
                            </div>
                        </div>
                    </div>-->

				<!--    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/5.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">John Abraham</h5>
                                    <p class="m-0">Store Manager</p>
                                    <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/7.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">John Doe</h5>
                                    <p class="m-0">Sales Man</p>
                                    <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/1.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">Mehedi Titas</h5>
                                    <p class="m-0">Online Marketer</p>
                                    <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                -->
				<!-- <div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="active-member">
									<div class="table-responsive">
										<table class="table table-xs mb-0">
											<thead>
												<tr>
													<th>이름</th>
													<th>부서</th>
													<th>직책</th>
													<th>직무</th>
													<th>출근유무</th>
													<th>활동</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><img src="/NHMP/resources/ERP/images/avatar/1.jpg"
														class=" rounded-circle mr-3" alt="">사라 스밋스</td>
													<td>가정의학과</td>
													<td><span>과장</span></td>
													<td>정규직</td>
													<td><i class="fa fa-circle-o text-success  mr-2"></i>
														출근</td>
													<td><span>마지막 로그인</span> <span class="m-0 pl-3">10
															초 전</span></td>
												</tr>
												<tr>
													<td><img src="/NHMP/resources/ERP/images/avatar/2.jpg"
														class=" rounded-circle mr-3" alt="">왈터 알</td>
													<td>외과</td>
													<td><span>의사</span></td>
													<td>계약직</td>
													<td><i class="fa fa-times-circle mr-2" aria-hidden="true"></i>
														퇴근</td>
													<td><span>마지막 로그인</span> <span class="m-0 pl-3">1
															시간 전</span></td>
												</tr>
												<tr>
													<td><img src="/NHMP/resources/ERP/images/avatar/3.jpg"
														class=" rounded-circle mr-3" alt="">안드류 디</td>
													<td>한방과</td>
													<td><span>레지던트</span></td>
													<td>임시직</td>
													<td><i class="fa fa-circle-o text-warning  mr-2"></i>
														출근</td>
													<td><span>마지막 로그인</span> <span class="m-0 pl-3">5
															초 전</span></td>
												</tr>
												<tr>
													<td><img src="/NHMP/resources/ERP/images/avatar/6.jpg"
														class=" rounded-circle mr-3" alt=""> 메긴 스</td>
													<td>간호과</td>
													<td><span>부장</span></td>
													<td>파견직</td>
													<td><i class="fa fa-times-circle mr-2" aria-hidden="true"></i>
														퇴근</td>
													<td><span>마지막 로그인</span> <span class="m-0 pl-3">1
															시간 전</span></td>
												</tr>
												<tr>
													<td><img src="/NHMP/resources/ERP/images/avatar/4.jpg"
														class=" rounded-circle mr-3" alt=""> 도리스 알</td>
													<td>총무과</td>
													<td><span>인턴</span></td>
													<td>일용직</td>
													<td><i class="fa fa-circle-o text-success  mr-2"></i>
														출근</td>
													<td><span>마지막 로그인</span> <span class="m-0 pl-3">1
															초 전</span></td>
												</tr>
												<tr>
													<td><img src="/NHMP/resources/ERP/images/avatar/5.jpg"
														class=" rounded-circle mr-3" alt="">엘리자베스 다브류</td>
													<td>원무과</td>
													<td><span>팀장</span></td>
													<td>위촉직</td>
													<td><i class="fa fa-times-circle mr-2" aria-hidden="true"></i>
														퇴근</td>
													<td><span>마지막 로그인</span> <span class="m-0 pl-3">2
															시간 전</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> -->
				<!--
                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6">

                        <div class="card">
                            <div class="chart-wrapper mb-4">
                                <div class="px-4 pt-4 d-flex justify-content-between">
                                    <div>
                                        <h4>Sales Activities</h4>
                                        <p>Last 6 Month</p>
                                    </div>
                                    <div>
                                        <span><i class="fa fa-caret-up text-success"></i></span>
                                        <h4 class="d-inline-block text-success">720</h4>
                                        <p class=" text-danger">+120.5(5.0%)</p>
                                    </div>
                                </div>
                                <div>
                                        <canvas id="chart_widget_3"></canvas>
                                </div>
                            </div>
                            <div class="card-body border-top pt-4">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul>
                                            <li>5% Negative Feedback</li>
                                            <li>95% Positive Feedback</li>
                                        </ul>
                                        <div>
                                            <h5>Customer Feedback</h5>
                                            <h3>385749</h3>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div id="chart_widget_3_1"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-sm-6 col-xxl-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Activity</h4>
                                <div id="activity">
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="../../resources/erp/images/avatar/1.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Received New Order</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="../../resources/erp/images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>iPhone develered</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="../../resources/erp/images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>3 Order Pending</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="../../resources/erp/images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Join new Manager</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="../../resources/erp/images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Branch open 5 min Late</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media border-bottom-1 pt-3 pb-3">
                                        <img width="35" src="../../resources/erp/images/avatar/2.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>New support ticket received</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                    <div class="media pt-3 pb-3">
                                        <img width="35" src="../../resources/erp/images/avatar/3.jpg" class="mr-3 rounded-circle">
                                        <div class="media-body">
                                            <h5>Facebook Post 30 Comments</h5>
                                            <p class="mb-0">I shared this on my fb wall a few months back,</p>
                                        </div><span class="text-muted ">April 24, 2018</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-12 col-sm-12 col-xxl-12">
                        <div class="card">
                            <div class="card-body">
                                    <h4 class="card-title mb-0">Store Location</h4>
                                <div id="world-map" style="height: 470px;"></div>
                            </div>
                        </div>
                    </div>
                </div>

                -->

				<!--
                <div class="row">
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-facebook">
                                    <span class="s-icon"><i class="fa fa-facebook"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-linkedin">
                                    <span class="s-icon"><i class="fa fa-linkedin"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-googleplus">
                                    <span class="s-icon"><i class="fa fa-google-plus"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="social-graph-wrapper widget-twitter">
                                    <span class="s-icon"><i class="fa fa-twitter"></i></span>
                                </div>
                                <div class="row">
                                    <div class="col-6 border-right">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">89k</h4>
                                            <p class="m-0">Friends</p>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                            <h4 class="m-1">119k</h4>
                                            <p class="m-0">Followers</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
                -->
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
