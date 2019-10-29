<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@
	page import="Main.NursingHospital.model.ov.NursingHospital, Main.NursingHospital.model.ov.NursingHospital, java.util.ArrayList"
%>

<%
	NursingHospital loginHospital = (NursingHospital)session.getAttribute("loginHospital");
	ArrayList<NursingHospital> list = (ArrayList<NursingHospital>)request.getAttribute("list");
%>





<!DOCTYPE html>
<html class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>NHMP</title>
    
    <script type="text/javascript" src="/NHMP/resources/common/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
	function logincheck(){
		var re = /^[A-Za-z0-9]/
		if(!(re.test($("input[type=text]").val())) || !(re.test($("input[type=password]").val()))){
			alert("아이디와 패스워드를 화인해주세요");
			return false;
		}
		if(($("#selecname").val()=="기업을 선택하세요")){
			alert("회사를 선택해 주세요!");
			return false;
		}
	}
	
	function getHost(){
		$.ajax({
			url : "/NHMP/hostinfo",
			type : "post",
			data : {Cname : $("#selecname").val()},
			dataType : "json",
			success : function(data){
				$("#hostid").val(data.hostid);
				$("#hostpwd").val(data.hostpwd);
				alert($("#hostid").val());
				alert($("#hostpwd").val());
			}, error : function(jqXHR, textStatus, errorThrown ){
				console.log("error : " + jqXHR + ", " + textStatus + ", " +errorThrown);
			}
		});
	}
	
	</script>
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/NHMP/resources/ERP/images/assets/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="/NHMP/resources/ERP/css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    
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

    



    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="/NHMP/index.jsp"> <h4>NHMP</h4></a>
        						<% if(loginHospital != null) {%>
        							<div align="center">
										<%= loginHospital.getNH_NAME() %>님,<br>
										메일 0 개&nbsp; &nbsp; &nbsp; 쪽지 0 개<br>
										<!-- 쿼리스트링을 이용하여 값을 전달 (?이름=값) -->
										<a href="/NHMP/myinfo?userid=<%= loginHospital.getNH_USERID() %>">상세정보</a>
										&nbsp; &nbsp; &nbsp; &nbsp; 
										<a href="/NHMP/index.jsp">홈으로</a> 
										&nbsp; &nbsp; &nbsp; &nbsp; 
										<a href="/NHMP/logout">로그아웃</a> <br>
									</div>
        						<% }else {%>
        							<form class="mt-5 mb-5 login-input" action="/NHMP/login" method="post">
        								<input type="hidden" name="hostid" value="" id="hostid">
        								<input type="hidden" name="hostpwd" value="" id="hostpwd">
                                 	  	<div class="form-group">
                                 	  		<select id="selecname" onchange="getHost()">
	                                 	  			<option value="기업을 선택하세요">병원을 선택하세요</option>
                                 	  			<% for( NursingHospital NH : list ) { %>
	                                 	  			<option value="<%= NH.getCOMPANY_NAME() %>" name="company_name"><%= NH.getCOMPANY_NAME() %></option>
                                 	  			<% } %>
                                 	  			<%-- onchange="getHost('<%= NH.getNH_ID() %>')"  --%>
                                 	  		</select>
                                 	  	</div>
                                 	  	<div class="form-group">
                            	            <input type="text" name="userid"class="form-control" placeholder="userID">
                              	     	</div>
                             	      	<div class="form-group">
                              	        	<input type="password" name="userpwd"class="form-control" placeholder="Password">
                             	      	</div>
                           	        	<button class="btn login-form__btn submit w-100" onclick="return logincheck()">로그인</button>
                          	     	</form>
	                                <div align="right">
	                                	비밀번호 몰라?<a href="page-register.html" class="text-primary">여기로</a> 이동~
	                                </div>
	                                <div align="right">
	                                	<a id="signup" href="/NHMP/views/Main/singup.jsp" style="text-align:left" >회원가입</a>
	                                </div>
        						<% } %>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="/NHMP/resources/ERP/css/plugins/common/common.min.js"></script>
    <script src="/NHMP/resources/ERP/js/custom.min.js"></script>
    <script src="/NHMP/resources/ERP/js/settings.js"></script>
    <script src="/NHMP/resources/ERP/js/gleek.js"></script>
    <script src="/NHMP/resources/ERP/js/styleSwitcher.js"></script>
</body>
</html>