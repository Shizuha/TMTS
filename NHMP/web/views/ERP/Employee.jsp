<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ERP.Employee.model.vo.Employee"%>
<%@ page import="java.util.ArrayList" %>

<%//스크립트 립 태그라고 함 //위에 페이지있는건 디렉트 태그라고 함.

Employee emp = (Employee)session.getAttribute("loginEmployee");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>NHMP</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Pignose Calender -->
    <link href="/NHMP/resources/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="/NHMP/resources/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="/NHMP/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="/NHMP/resources/css/style.css" rel="stylesheet">
    <!-- 캘린더 -->
<script type="text/javascript">
var Cal = function(divId) {

	  //Store div id
	  this.divId = divId;

	  // Days of week, starting on Sunday
	  this.DaysOfWeek = [
	    '일',
	    '월',
	    '화',
	    '수',
	    '목',
	    '금',
	    '토'
	  ];

	  // Months, stating on January
	  this.Months = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ];

	  // Set the current month, year
	  var d = new Date();

	  this.currMonth = d.getMonth();
	  this.currYear = d.getFullYear();
	  this.currDay = d.getDate();

	};

	// Goes to next month
	Cal.prototype.nextMonth = function() {
	  if ( this.currMonth == 11 ) {
	    this.currMonth = 0;
	    this.currYear = this.currYear + 1;
	  }
	  else {
	    this.currMonth = this.currMonth + 1;
	  }
	  this.showcurr();
	};

	// Goes to previous month
	Cal.prototype.previousMonth = function() {
	  if ( this.currMonth == 0 ) {
	    this.currMonth = 11;
	    this.currYear = this.currYear - 1;
	  }
	  else {
	    this.currMonth = this.currMonth - 1;
	  }
	  this.showcurr();
	};

	// Show current month
	Cal.prototype.showcurr = function() {
	  this.showMonth(this.currYear, this.currMonth);
	};

	// Show month (year, month)
	Cal.prototype.showMonth = function(y, m) {

	  var d = new Date()
	  // First day of the week in the selected month
	  , firstDayOfMonth = new Date(y, m, 1).getDay()
	  // Last day of the selected month
	  , lastDateOfMonth =  new Date(y, m+1, 0).getDate()
	  // Last day of the previous month
	  , lastDayOfLastMonth = m == 0 ? new Date(y-1, 11, 0).getDate() : new Date(y, m, 0).getDate();


	  var html = '<table>';

	  // Write selected month and year
	  html += '<thead><tr>';
	  html += '<td colspan="7">' + this.Months[m] + ' ' + y + '</td>';
	  html += '</tr></thead>';


	  // Write the header of the days of the week
	  html += '<tr class="days">';
	  for(var i=0; i < this.DaysOfWeek.length;i++) {
	    html += '<td>' + this.DaysOfWeek[i] + '</td>';
	  }
	  html += '</tr>';

	  // Write the days
	  var i=1;
	  do {

	    var dow = new Date(y, m, i).getDay();

	    // If Sunday, start new row
	    if ( dow == 0 ) {
	      html += '<tr>';
	    }
	    // If not Sunday but first day of the month
	    // it will write the last days from the previous month
	    else if ( i == 1 ) {
	      html += '<tr>';
	      var k = lastDayOfLastMonth - firstDayOfMonth+1;
	      for(var j=0; j < firstDayOfMonth; j++) {
	        html += '<td class="not-current">' + k + '</td>';
	        k++;
	      }
	    }

	    // Write the current day in the loop
	    var chk = new Date();
	    var chkY = chk.getFullYear();
	    var chkM = chk.getMonth();
	    if (chkY == this.currYear && chkM == this.currMonth && i == this.currDay) {
	      html += '<td class="today">' + i + '</td>';
	    } else {
	      html += '<td class="normal">' + i + '</td>';
	    }
	    // If Saturday, closes the row
	    if ( dow == 6 ) {
	      html += '</tr>';
	    }
	    // If not Saturday, but last day of the selected month
	    // it will write the next few days from the next month
	    else if ( i == lastDateOfMonth ) {
	      var k=1;
	      for(dow; dow < 6; dow++) {
	        html += '<td class="not-current">' + k + '</td>';
	        k++;
	      }
	    }

	    i++;
	  }while(i <= lastDateOfMonth);

	  // Closes table
	  html += '</table>';

	  // Write HTML to the div
	  document.getElementById(this.divId).innerHTML = html;
	};

	// On Load of the window
	window.onload = function() {

	  // Start calendar
	  var c = new Cal("divCal");			
	  c.showcurr();

	  // Bind next and previous button clicks
	  getId('btnNext').onclick = function() {
	    c.nextMonth();
	  };
	  getId('btnPrev').onclick = function() {
	    c.previousMonth();
	  };
	}

	// Get element by id
	function getId(id) {
	  return document.getElementById(id);
	}
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
	width: 18%;
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
	width: 35%;
	height:450px;
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
	height: 450px;
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
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
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
                <a href="index.html">
                    <b class="logo-abbr"><img src="/NHMP/resources/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="/NHMP/resources/images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="/NHMP/resources/images/logo-text.png" alt="">
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
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="/NHMP/resources/images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span>내정보 보기</span></a>
                                        </li>
                                  
                                        
                                        <hr class="my-2">
                                        <li>
                                            <a href="/NHMP/views/member/calendar.jsp"><i class="icon-lock"></i> <span>일정관리</span></a>
                                        </li>
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
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">환자정보관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="/NHMP/views/Employee/employee.jsp">Home 1</a></li>
                            <!-- <li><a href="./index-2.html">Home 2</a></li> -->
                        </ul>
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">사원정보관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="/NHMP/list">전체사원조회</a></li>
                            <li><a href="IsertEmployee.jsp">사원정보등록</a></li>
                            <li><a href="./layout-two-column.html">조직도관리</a></li>
                            
                            
                            <li><a href="./layout-fixed-header.html">Fixed Header</a></li>
                            <li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
                        </ul>
                    </li>
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">권한관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./table-basic.html" aria-expanded="false">Basic Table</a></li>
                            <li><a href="./table-datatable.html" aria-expanded="false">Data Table</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">급여관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./page-login.html">Login</a></li>
                            <li><a href="./page-register.html">Register</a></li>
                            <li><a href="./page-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="./page-error-404.html">Error 404</a></li>
                                    
                                </ul>
                            </li>
                        </ul>
                    </li>
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
					<center><img alt="" src="/NHMP/resources/emp_Img_file/<%=emp.getEmpRenameFilename() %>"></center><br><br>
					<%}else{ %>
					<center><img alt="" src="/NHMP/resources/images/testimonial2.jpg"></center><br><br>
					<%} %>
					<ul id="header_list">
						<li>사원코드:<%=emp.getUserId() %></li><br>
						<li>부서:<%=emp.getDeptCode() %> </li>
						<li style="font-size: 10pt;"><%=emp.getTeamCode() %></li><br>
						<li>이름:<%=emp.getEmpName() %></li><br>
						<li>담당병동:<%=emp.getWardCode() %></li>
					</ul><br>
				</div>
				<% }else{ %>
				<div class="member">
					<center><img alt="" src="/NHMP/resources/images/testimonial2.jpg"></center><br><br>
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
				</div>
			</div>
		<div class="calendar2">
			<div class="calendar">
				
  					<button id="btnPrev" type="button">이전달</button>
	  				<button id="btnNext" type="button">다음달</button>
  				<div id="divCal"></div>
			
		</div>
        	<div class="notice">
        		<div class="panel-heading" >
			<h3 style="font-size:13pt; font-weight:600; background: rgb(117, 113, 249, 0.5);
      			color:rgba(0, 0, 0, 1); height:30px; padding:3px; border-radius:4px;">공지사항</h3><div>
				<a href="#" title="공지사항"style="color:rgba(0, 0, 0, 1);">더보기 <i class="fa fa-angle-right"></i></a>
			</div>
		</div>
		<!-- Table -->
		<div class="table-responsive">
			<table class="table table-hover">
			<thead>
				<tr id="title">
					<th style="text-align:center; color:rgba(0, 0, 0, 1);">제목</th><th style="text-align:center; color:rgba(0, 0, 0, 1);">날짜</th>
				</tr>
			</thead>
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
        	<div>
        </div>
        
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
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
    <script src="/NHMP/resources/plugins/common/common.min.js"></script>
    <script src="/NHMP/resources/js/custom.min.js"></script>
    <script src="/NHMP/resources/js/settings.js"></script>
    <script src="/NHMP/resources/js/gleek.js"></script>
    <script src="/NHMP/resources/js/styleSwitcher.js"></script>

    <!-- Chartjs -->
    <script src="/NHMP/resources/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="/NHMP/resources/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="/NHMP/resources/plugins/d3v3/index.js"></script>
    <script src="/NHMP/resources/plugins/topojson/topojson.min.js"></script>
    <script src="/NHMP/resources/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="/NHMP/resources/plugins/raphael/raphael.min.js"></script>
    <script src="/NHMP/resources/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="/NHMP/resources/plugins/moment/moment.min.js"></script>
    <script src="/NHMP/resources/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="/NHMP/resources/plugins/chartist/js/chartist.min.js"></script>
    <script src="/NHMP/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



</body>
</html>