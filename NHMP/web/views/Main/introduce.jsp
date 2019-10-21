<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="Main.NursingHospital.model.ov.NursingHospital"
%>

<%
	NursingHospital loginHospital = (NursingHospital)session.getAttribute("loginHospital");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>이민삼수 소개</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700" rel="stylesheet">

    <link rel="stylesheet" href="/NHMP/resources/Main/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/NHMP/resources/Main/css/animate.css">
    
    <link rel="stylesheet" href="/NHMP/resources/Main/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/NHMP/resources/Main/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/NHMP/resources/Main/css/magnific-popup.css">

    <link rel="stylesheet" href="/NHMP/resources/Main/css/aos.css">

    <link rel="stylesheet" href="/NHMP/resources/Main/css/ionicons.min.css">

    <link rel="stylesheet" href="/NHMP/resources/Main/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/NHMP/resources/Main/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/NHMP/resources/Main/css/flaticon.css">
    <link rel="stylesheet" href="/NHMP/resources/Main/css/icomoon.css">
    <link rel="stylesheet" href="/NHMP/resources/Main/css/style.css">
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/NHMP/index.jsp">이 민 삼 수</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="/NHMP/index.jsp" class="nav-link">Home</a></li>
                  <!--  <li class="nav-item"><a href="views/main/about.html" class="nav-link">About</a></li> -->
                  <li class="nav-item"><a href="/NHMP/views/Main/serviceIntro.jsp" class="nav-link">서비스 소개</a></li>
                  <li class="nav-item"><a href="/NHMP/views/Main/functionIntro.jsp" class="nav-link" >기능소개</a></li>
                  <li class="nav-item"><a href="/NHMP/views/Main/serviceCenter.jsp" class="nav-link">온라인 고객센터</a></li>
                  <li class="nav-item"><a href="/NHMP/views/Main/introduce.jsp" class="nav-link">이민삼수 소개</a></li>
                  <% if(loginHospital == null) { //미 로그인%>
                  	<li class="nav-item"><a href="/NHMP/views/Main/login.jsp" class="nav-link"><span>로그인</span></a></li>
                  <% } else if ( loginHospital.getAUTHORITY_CODE().equals("G1") ) {	//관리자 로그인%> 
                  	<li class="nav-item">
                  		<a href="/NHMP/views/Main/login.jsp" class="nav-link">
                  		<span>내정보</span></a>
                  		<li class="nav-item cta"><a href="/NHMP/views/ERP/Admin_main.jsp" class="nav-link"><span>시스템 관리</span></a></li>
                  	</li>
                  <% } else if(loginHospital.getAUTHORITY_CODE().equals("G0")) { //미가입자 로그인%>
                  	<li class="nav-item">
                  		<a href="/NHMP/views/Main/login.jsp" class="nav-link">
                  		<span>내정보</span></a>
                  		<!-- <li class="nav-item cta"><a href="/NHMP/views/ERP/main.jsp" class="nav-link"><span>시스템 관리</span></a></li> -->
                  	</li>
                  <% }else{ //일반 사용자 %>
                  	<li class="nav-item">
                  		<a href="/NHMP/views/Main/login.jsp" class="nav-link">
                  		<span>내정보</span></a>
                  		<li class="nav-item cta"><a href="/NHMP/views/ERP/Admin_main.jsp" class="nav-link"><span>시스템 관리</span></a></li>
                  	</li>
                  <% } %>
              
              <%-- <% if(true) { // 미회원이 보는 화면%>
              	&nbsp;
              <% } else if( loginEmployee.equals("admin") ) { // 관리자 로그인 시 %>
              	<li class="nav-item cta"><a href="/NHMP/views/ERP/main.jsp" class="nav-link"><span>시스템 관리</span></a></li>
              <% } else { // 요양병원 가입자 접속 시 %>
              	&nbsp;
              <% } %> --%>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <div class="hero-wrap hero-wrap-2" style="background-image: url('/NHMP/resources/Main/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-8 ftco-animate text-center text-center mt-5">
          	<p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>이민삼수 소개</span></p>
            <h1 class="mb-3 bread">이민삼수 소개</h1>
          </div>
        </div>
      </div>
    </div>
  
    <section class="ftco-section contact-section bg-primary">
      <div class="container">
        <div class="row d-flex mb-5 contact-info justify-content-center">
        	<div class="col-md-8">
        		<div class="row mb-5">
		          <div class="col-md-4 text-center py-4">
		          	<div class="icon">
		          		<span class="icon-map-o"></span>
		          	</div>
		            <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
		          </div>
		          <div class="col-md-4 text-center border-height py-4">
		          	<div class="icon">
		          		<span class="icon-mobile-phone"></span>
		          	</div>
		            <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
		          </div>
		          <div class="col-md-4 text-center py-4">
		          	<div class="icon">
		          		<span class="icon-envelope-o"></span>
		          	</div>
		            <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
		          </div>
		        </div>
          </div>
        </div>
        <div class="row block-9 justify-content-center mb-5">
          <div class="col-md-10 mb-md-5">
          	<h2 class="text-center">If you got any questions <br>please do not hesitate to send us a message</h2>
            <form action="#" class="bg-light p-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>
        </div>
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div id="map" class="bg-white"></div>
        	</div>
        </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Ignite</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled mb-0">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Unseful Links</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Servers</a></li>
                <li><a href="#" class="py-2 d-block">Windos Hosting</a></li>
                <li><a href="#" class="py-2 d-block">Cloud Hosting</a></li>
                <li><a href="#" class="py-2 d-block">OS Servers</a></li>
                <li><a href="#" class="py-2 d-block">Linux Servers</a></li>
                <li><a href="#" class="py-2 d-block">Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Navigational</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Home</a></li>
                <li><a href="#" class="py-2 d-block">Domain</a></li>
                <li><a href="#" class="py-2 d-block">Hosting</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Blog</a></li>
                <li><a href="#" class="py-2 d-block">Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Office</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/NHMP/resources/Main/js/jquery.min.js"></script>
  <script src="/NHMP/resources/Main/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/NHMP/resources/Main/js/popper.min.js"></script>
  <script src="/NHMP/resources/Main/js/bootstrap.min.js"></script>
  <script src="/NHMP/resources/Main/js/jquery.easing.1.3.js"></script>
  <script src="/NHMP/resources/Main/js/jquery.waypoints.min.js"></script>
  <script src="/NHMP/resources/Main/js/jquery.stellar.min.js"></script>
  <script src="/NHMP/resources/Main/js/owl.carousel.min.js"></script>
  <script src="/NHMP/resources/Main/js/jquery.magnific-popup.min.js"></script>
  <script src="/NHMP/resources/Main/js/aos.js"></script>
  <script src="/NHMP/resources/Main/js/jquery.animateNumber.min.js"></script>
  <script src="/NHMP/resources/Main/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/NHMP/resources/Main/js/google-map.js"></script>
  <script src="/NHMP/resources/Main/js/main.js"></script>
    
  </body>
</html>