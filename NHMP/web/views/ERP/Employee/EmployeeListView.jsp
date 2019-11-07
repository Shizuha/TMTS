<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ERP.Employee.model.vo.Employee, java.util.ArrayList"%>
<%
	Employee emp = (Employee)session.getAttribute("loginEmployee");
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
<!-- 메인 CSS 처리용 -->
<link href="/NHMP/resources/ERP/css/style.css?after" rel="stylesheet">
<link href="/NHMP/resources/ERP/css/employeeListViewCss.css" rel="stylesheet">


	

<!-- 스크립트태그 -->
  <script type="text/javascript" src="/NHMP/resources/ERP/js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		
  		$(".check-all").click(function(){
  			$(".ad").prop("checked", this.checked);
  		});
  		
          $("#usernewpwd").click(function(){
        	 if($("input[name=empno]").is(":checked") == true){
        		var noVal = $("input[name=empno]:checked").val();  
        	 var url = "/NHMP/newpwd?empno=" + noVal;
             var name = "popup test";
             var option = "width = 500, height = 500, top = 100, left = 200, location = no"
             window.open(url, name, option);
             return false;
             
        	 }else{
        		 alert("선택된사원이 없습니다. 사원을 선택해주세요.");
        		 return false;
        	 }
        	 
         });
         
         
           
  	});
 	
  	function trueAndFalse() {
  		
  		var trueAndFalseDel = confirm( '정말로 삭제하시겠습니까?' );
  		
        if(trueAndFalseDel != false){
        	return true;
        }else
        	return false;
        
        
        
  	}
  </script>


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
				<%if(emp != null){ %>
				<a href="/NHMP/views/ERP/Employee.jsp">
				 <b class="logo-abbr"><img
						src="/NHMP/resources/ERP/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="/NHMP/resources/ERP/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="/NHMP/resources/ERP/images/common/logo-text.png" alt="">
				</span>
				</a>
				<%}else{ %>
				<a href="/NHMP/views/ERP/Admin_main.jsp">
				 <b class="logo-abbr"><img
						src="/NHMP/resources/ERP/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="/NHMP/resources/ERP/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="/NHMP/resources/ERP/images/common/logo-text.png" alt="">
				</span>
				</a>
				<%} %>
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
				<%if(emp != null){ %>
				<ul class="metismenu" id="menu">
					<%if(emp.getAuthorityCode().equals("G5")){ %>
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="javascript:void()" aria-expanded="false"> 
						<i class="fa fa-users"></i><span class="nav-text">인사관리</span> 
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/list">전체사원조회</a></li>
							<li><a href="/NHMP/views/ERP/Employee/InsertEmployee.jsp">인사정보등록</a></li>
							<li><a href="/NHMP/ochart">조직도</a></li>
						</ul>
					</li>
						<%} %>
						<%if(emp.getAuthorityCode().equals("G2")){ %>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-plus-square"></i><span
							class="nav-text">환자 관리</span> <!--   <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">환자 관리</span> -->
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/patientlistview">전체환자 조회</a></li>
							<li><a href="/NHMP/views/ERP/patient/PatientInsertView.jsp">환자
									입원 등록</a></li>
							<li><a href="/NHMP/counsellistview">상담일지 등록</a></li>
							<li><a href="/NHMP/recordlistview">투약일지 등록</a></li>
						</ul></li>
					<%} %>
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
						<%}else{ %>
						<ul class="metismenu" id="menu">
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="javascript:void()" aria-expanded="false"> 
						<i class="fa fa-users"></i><span class="nav-text">인사관리</span> 
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/list">전체사원조회</a></li>
							<li><a href="/NHMP/views/ERP/Employee/InsertEmployee.jsp">인사정보등록</a></li>
							<li><a href="/NHMP/ochart">조직도</a></li>
						</ul>
					</li>
					<li><a class="has-arrow" href="javascript:void()"aria-expanded="false"> <i class="fa fa-id-card"></i>
						<span class="nav-text">권한설정</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/authlist">권한부여관리</a></li>
						</ul>
					</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-plus-square"></i><span
							class="nav-text">환자 관리</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/patientlistview">전체환자 조회</a></li>
							<li><a href="/NHMP/views/ERP/patient/PatientInsertView.jsp">환자
									입원 등록</a></li>
							<li><a href="/NHMP/counsellistview">상담일지 등록</a></li>
							<li><a href="/NHMP/recordlistview">투약일지 등록</a></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="fa fa-usd"></i><span
							class="nav-text">급여 관리</span> 
					</a>
						<ul aria-expanded="false">
							<li><a href="/NHMP/Epaylist">급여계산</a></li>
						</ul>
						<%} %>
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
		<div class="content-body" style="padding: 40px;">
			<div class="container-fluid">
			<div class="search">
				<div class="empname">
					<form action="/NHMP/esel" method="post" >
					사용자명:&nbsp; <div class="icon"><i class="fa fa-search"></i></div><input type="search" name="empname" id="sc">&nbsp;
					부서:&nbsp;<select name="dept">
							<option>--부서구분--</option>
							<option value="40">간호과</option>
							<option value="20">외과</option>
							<option value="30">한방의학과</option>
							<option value="60">원무과</option>
							<option value="50">총무과</option>
							<option value="10">가정의학과</option>
						</select>
						&nbsp;<input type="submit" id="button1" value="검색">
					</form>	
				</div>
			</div>
			<div class="button">
			<form action="/NHMP/mdel" method="post" onsubmit="return trueAndFalse();">
			<input type="hidden" name="page" value="<%=currentPage %>">
			<input type="hidden" name="bpage" value="<%=beginPage %>">
			<input type="submit" id="delbutton"value="삭제">&nbsp;
			<button id="usernewpwd">비밀번호초기화</button></div><br>
                <table class="table table-bordered" style="margin-top:10px;"id="dataTable" width="100%" cellspacing="0" border="1">
                  
                    <tr class="mainTr">
                      <th><input type="checkbox" class="check-all">&nbsp;전체선택</th>
                      <th style="width:5%;">사번</th>
                      <th>이름</th>
                      <th>입사일</th>
                      <th>휴대폰</th>
                      <th>이메일</th>
                      <th>주소</th>
                    </tr>
                  <%for(Employee e : empList){ %>
                  	
                    <tr class="trlist">
                      <td><input type="checkbox" class="ad" name="empno" id="empno" value="<%=e.getEmpNo() %>"></td>
                      <td><a href="/NHMP/minfo?empid=<%=e.getEmpId() %>"><%=e.getEmpId()%></a></td>
                      <td><a href="/NHMP/minfo?empid=<%=e.getEmpId() %>"><%=e.getEmpName() %></a> </td>
                      <td><a href="/NHMP/minfo?empid=<%=e.getEmpId() %>"><%=e.getHireDate()  %></a></td>
                      <td><a href="/NHMP/minfo?empid=<%=e.getEmpId() %>"><%=e.getPhone()  %></a></td>
                      <td><a href="/NHMP/minfo?empid=<%=e.getEmpId() %>"><%=e.getEmail() %></a></td>
                      <td><a href="/NHMP/minfo?empid=<%=e.getEmpId() %>"><%=e.getAddress() %></a></td>
                      
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
				<div id="pagebox" align="center" style="margin-right: 30px;">
					<a href="/NHMP/list?page=1"><i id="i1"class="fa fa-fast-backward" aria-hidden="true"></i></a>&nbsp;
					<%
						if (beginPage - 10 < 1) { %>
						
					<a href="/NHMP/list?page=1"><i id="i2" class="fa fa-hand-o-left" aria-hidden="true"></i></a>
					
					<%} else {%>
						
					<a href="/NHMP/list?page=<%=beginPage - 10%>">◀◀</a>
					
					<%}%>
					&nbsp;
					<% for (int p = beginPage; p <= endPage; p++) {
							if (p == currentPage) {%>
							
					<a href="/NHMP/list?page=<%=p%>"><font color="red" size="3"><b>(<%=p%>)</b></font></a>

					<%} else {%>
					<a href="/NHMP/list?page=<%=p%>"><%=p%></a>

					<%}}%>
					&nbsp;
					<%
						if ((endPage + 10) > maxPage) {
					%>
					<a href="/NHMP/list?page=<%=maxPage%>"><i id="i3" class="fa fa-hand-o-right" aria-hidden="true"></i></a>
					<%
						} else {
					%>
					<a href="/NHMP/list?page=<%=endPage + 10%>"><i id="i3" class="fas fa-angle-double-right"></i></a>
					<%
						}
					%>
					&nbsp; <a href="/NHMP/list?page=<%=maxPage%>"><i id="i4" class="fa fa-fast-forward" aria-hidden="true"></i></a>
				</div>
				<i style="margin-left:546px;" class="fa fa-child" aria-hidden="true"></i>
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