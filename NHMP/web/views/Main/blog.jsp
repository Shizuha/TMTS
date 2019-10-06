<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>온라인 고객센터</title>
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
	          <li class="nav-item"><a href="/NHMP/index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="/NHMP/views/Main/domain.jsp" class="nav-link">서비스 소개</a></li>
              <li class="nav-item"><a href="/NHMP/views/Main/hosting.jsp" class="nav-link" >기능소개</a></li>
              <li class="nav-item"><a href="/NHMP/views/Main/blog.jsp" class="nav-link">온라인 고객센터</a></li>
              <li class="nav-item"><a href="/NHMP/views/Main/contact.jsp" class="nav-link">이민삼수 소개</a></li>
              <% if(true) { //미 로그인%>
              	<li class="nav-item"><a href="/NHMP/views/Main/login.jsp" class="nav-link"><span>로그인</span></a></li>
              <% }else { //로그인%>
                  
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
          	<p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>온라인 고객센터</span></p>
            <h1 class="mb-3 bread">온라인 고객센터</h1>
          </div>
        </div>
      </div>
    </div>
  
    <section class="ftco-section">
      <div class="container">
        <div class="row d-flex justify-content-center">
          <div class="col-md-10 text-center d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20 img" style="background-image: url('/NHMP/resources/Main/images/image_1.jpg');">
              </a>
              <div class="text pt-4 px-md-5">
              	<div class="meta mb-3">
                  <div><a href="#">Aug 05, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="blog-single.html" class="btn-custom">Continue <span class="icon-long-arrow-right"></span></a></p>
              </div>
            </div>
          </div>
          <div class="col-md-10 text-center d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20 img" style="background-image: url('/NHMP/resources/Main/images/image_2.jpg');">
              </a>
              <div class="text pt-4 px-md-5">
              	<div class="meta mb-3">
                  <div><a href="#">Aug 05, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="blog-single.html" class="btn-custom">Continue <span class="icon-long-arrow-right"></span></a></p>
              </div>
            </div>
          </div>
          <div class="col-md-10 text-center d-flex ftco-animate">
          	<div class="blog-entry">
              <a href="blog-single.html" class="block-20 img" style="background-image: url('/NHMP/resources/Main/images/image_3.jpg');">
              </a>
              <div class="text pt-4 px-md-5">
              	<div class="meta mb-3">
                  <div><a href="#">Aug 05, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="blog-single.html" class="btn-custom">Continue <span class="icon-long-arrow-right"></span></a></p>
              </div>
            </div>
          </div>
          <div class="col-md-10 text-center d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20 img" style="background-image: url('/NHMP/resources/Main/images/image_4.jpg');">
              </a>
              <div class="text pt-4 px-md-5">
              	<div class="meta mb-3">
                  <div><a href="#">Aug 05, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="blog-single.html" class="btn-custom">Continue <span class="icon-long-arrow-right"></span></a></p>
              </div>
            </div>
          </div>
          <div class="col-md-10 text-center d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20 img" style="background-image: url('/NHMP/resources/Main/images/image_5.jpg');">
              </a>
              <div class="text pt-4 px-md-5">
              	<div class="meta mb-3">
                  <div><a href="#">Aug 05, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="blog-single.html" class="btn-custom">Continue <span class="icon-long-arrow-right"></span></a></p>
              </div>
            </div>
          </div>
          <div class="col-md-10 text-center d-flex ftco-animate">
          	<div class="blog-entry">
              <a href="blog-single.html" class="block-20 img" style="background-image: url('/NHMP/resources/Main/images/image_6.jpg');">
              </a>
              <div class="text pt-4 px-md-5">
              	<div class="meta mb-3">
                  <div><a href="#">Aug 05, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="blog-single.html" class="btn-custom">Continue <span class="icon-long-arrow-right"></span></a></p>
              </div>
            </div>
          </div>
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
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