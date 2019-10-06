<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>기능소개</title>
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
          	<p class="breadcrumbs mb-0"><span class="mr-3"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>기능소개</span></p>
            <h1 class="mb-3 bread">기능소개</h1>
          </div>
        </div>
      </div>
    </div>
  
    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-4 text-center ftco-animate">
    				<div class="steps">
    					<div class="icon active mb-4 d-flex justify-content-center align-items-center">
    						<span>1</span>
    					</div>
    					<h3>Choose Your Plan</h3>
    					<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
    				</div>
    			</div>
    			<div class="col-md-4 text-center ftco-animate">
    				<div class="steps">
    					<div class="icon mb-4 d-flex justify-content-center align-items-center">
    						<span>2</span>
    					</div>
    					<h3>Create Your Account</h3>
    					<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
    				</div>
    			</div>
    			<div class="col-md-4 text-center ftco-animate">
    				<div class="steps">
    					<div class="icon mb-4 d-flex justify-content-center align-items-center">
    						<span>3</span>
    					</div>
    					<h3>Launch</h3>
    					<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section bg-primary">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4">Our Best Pricing</h2>
            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
          </div>
        </div>
    		<div class="row no-gutters d-flex">
	        <div class="col-lg-3 col-md-6 ftco-animate">
	          <div class="block-7 bg-light">
	            <div class="text-center">
		            <h2 class="heading">Free</h2>
		            <span class="price"><sup>$</sup> <span class="number">0<small class="per">/mo</small></span>
		            <span class="excerpt d-block">100% free. Forever</span>
		            <h3 class="heading-2 mb-3">Enjoy All The Features</h3>
		            
		            <ul class="pricing-text mb-4">
		              <li><strong>150 GB</strong> Bandwidth</li>
		              <li><strong>100 GB</strong> Storage</li>
		              <li><strong>$1.00 / GB</strong> Overages</li>
		              <li>All features</li>
		            </ul>
		            <a href="#" class="btn btn-secondary d-block px-3 py-3 mb-4">Choose Plan</a>
	            </div>
	          </div>
	        </div>
	        <div class="col-lg-3 col-md-6 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
		            <h2 class="heading">Startup</h2>
		            <span class="price"><sup>$</sup> <span class="number">19<small class="per">/mo</small></span></span>
		            <span class="excerpt d-block">All features are included</span>
		            <h3 class="heading-2 mb-3">Enjoy All The Features</h3>
		            
		            <ul class="pricing-text mb-4">
		              <li><strong>450 GB</strong> Bandwidth</li>
		              <li><strong>400 GB</strong> Storage</li>
		              <li><strong>$2.00 / GB</strong> Overages</li>
		              <li>All features</li>
		            </ul>
		            <a href="#" class="btn btn-secondary d-block px-3 py-3 mb-4">Choose Plan</a>
	            </div>
	          </div>
	        </div>
	        <div class="col-lg-3 col-md-6 ftco-animate">
	          <div class="block-7 bg-light">
	            <div class="text-center">
		            <h2 class="heading">Premium</h2>
		            <span class="price"><sup>$</sup> <span class="number">49<small class="per">/mo</small></span></span>
		            <span class="excerpt d-block">All features are included</span>
		            <h3 class="heading-2 mb-3">Enjoy All The Features</h3>
		            
		            <ul class="pricing-text mb-4">
		              <li><strong>250 GB</strong> Bandwidth</li>
		              <li><strong>200 GB</strong> Storage</li>
		              <li><strong>$5.00 / GB</strong> Overages</li>
		              <li>All features</li>
		            </ul>
		            <a href="#" class="btn btn-secondary d-block px-3 py-3 mb-4">Choose Plan</a>
	            </div>
	          </div>
	        </div>
	        <div class="col-lg-3 col-md-6 ftco-animate">
	          <div class="block-7">
	            <div class="text-center">
		            <h2 class="heading">Pro</h2>
		            <span class="price"><sup>$</sup> <span class="number">99<small class="per">/mo</small></span></span>
		            <span class="excerpt d-block">All features are included</span>
		            <h3 class="heading-2 mb-3">Enjoy All The Features</h3>
		            
		            <ul class="pricing-text mb-4">
		              <li><strong>450 GB</strong> Bandwidth</li>
		              <li><strong>400 GB</strong> Storage</li>
		              <li><strong>$20.00 / GB</strong> Overages</li>
		              <li>All features</li>
		            </ul>
			          <a href="#" class="btn btn-secondary d-block px-3 py-3 mb-4">Choose Plan</a>
	            </div>
	          </div>
	        </div>
	      </div>
    	</div>
    </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-lg-6 order-lg-last d-flex">
    				<div class="bg-primary py-md-5 d-flex align-self-stretch">
    					<div class="main">
		    				<img src="/NHMP/resources/Main/images/undraw_data_report_bi6l.svg" class="img-fluid svg" alt="">
		    				<div class="heading-section heading-section-white ftco-animate mt-5 px-3 px-md-5">
			            <h2 class="mb-4">Our Main Services</h2>
			            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
			          </div>
		          </div>
	          </div>
    			</div>
    			<div class="col-lg-6 py-5">
    				<div class="row pt-md-5">
    					<div class="col-md-6 ftco-animate">
    						<div class="media block-6 services text-center">
		            	<div class="icon d-flex align-items-center justify-content-center">
		            		<span class="flaticon-cloud-computing"></span>
		            	</div>
		              <div class="mt-3 media-body media-body-2">
		                <h3 class="heading">Cloud VPS</h3>
		                <p>Even the all-powerful Pointing has no control about the blind texts</p>
		              </div>
		            </div>
    					</div>
    					<div class="col-md-6 ftco-animate">
    						<div class="media block-6 services text-center">
		            	<div class="icon d-flex align-items-center justify-content-center">
		            		<span class="flaticon-cloud"></span>
		            	</div>
		              <div class="mt-3 media-body media-body-2">
		                <h3 class="heading">Share</h3>
		                <p>Even the all-powerful Pointing has no control about the blind texts</p>
		              </div>
		            </div>
    					</div>
    					<div class="col-md-6 ftco-animate">
    						<div class="media block-6 services text-center">
		            	<div class="icon d-flex align-items-center justify-content-center">
		            		<span class="flaticon-server"></span>
		            	</div>
		              <div class="mt-3 media-body media-body-2">
		                <h3 class="heading">VPS</h3>
		                <p>Even the all-powerful Pointing has no control about the blind texts</p>
		              </div>
		            </div>
    					</div>
    					<div class="col-md-6 ftco-animate">
    						<div class="media block-6 services text-center">
		            	<div class="icon d-flex align-items-center justify-content-center">
		            		<span class="flaticon-database"></span>
		            	</div>
		              <div class="mt-3 media-body media-body-2">
		                <h3 class="heading">Dedicated</h3>
		                <p>Even the all-powerful Pointing has no control about the blind texts</p>
		              </div>
		            </div>
    					</div>
    				</div>
          </div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-4">Your Question</h2>
            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div id="accordion">
    					<div class="row">
    						<div class="col-md-6">
    							<div class="card">
						        <div class="card-header">
										  <a class="card-link" data-toggle="collapse"  href="#menuone" aria-expanded="true" aria-controls="menuone">What is your domain name? <span class="collapsed"><i class="ion-ios-arrow-up"></i></span><span class="expanded"><i class="ion-ios-arrow-down"></i></span></a>
						        </div>
						        <div id="menuone" class="collapse show">
						          <div class="card-body">
												<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						          </div>
						        </div>
						      </div>

						      <div class="card">
						        <div class="card-header">
										  <a class="card-link" data-toggle="collapse"  href="#menutwo" aria-expanded="false" aria-controls="menutwo">How long is my domain name valid? <span class="collapsed"><i class="ion-ios-arrow-up"></i></span><span class="expanded"><i class="ion-ios-arrow-down"></i></span></a>
						        </div>
						        <div id="menutwo" class="collapse">
						          <div class="card-body">
												<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						          </div>
						        </div>
						      </div>

						      <div class="card">
						        <div class="card-header">
										  <a class="card-link" data-toggle="collapse"  href="#menu3" aria-expanded="false" aria-controls="menu3">Can I sell my domain name? <span class="collapsed"><i class="ion-ios-arrow-up"></i></span><span class="expanded"><i class="ion-ios-arrow-down"></i></span></a>
						        </div>
						        <div id="menu3" class="collapse">
						          <div class="card-body">
												<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						          </div>
						        </div>
						      </div>
    						</div>

    						<div class="col-md-6">
    							<div class="card">
						        <div class="card-header">
										  <a class="card-link" data-toggle="collapse"  href="#menu4" aria-expanded="false" aria-controls="menu4">Can I cancel a domain? <span class="collapsed"><i class="ion-ios-arrow-up"></i></span><span class="expanded"><i class="ion-ios-arrow-down"></i></span></a>
						        </div>
						        <div id="menu4" class="collapse">
						          <div class="card-body">
												<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						          </div>
						        </div>
						      </div>

						      <div class="card">
						        <div class="card-header">
										  <a class="card-link" data-toggle="collapse"  href="#menu5" aria-expanded="false" aria-controls="menu5">How do I transfer a domain name? <span class="collapsed"><i class="ion-ios-arrow-up"></i></span><span class="expanded"><i class="ion-ios-arrow-down"></i></span></a>
						        </div>
						        <div id="menu5" class="collapse">
						          <div class="card-body">
												<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						          </div>
						        </div>
						      </div>

						      <div class="card">
						        <div class="card-header">
										  <a class="card-link" data-toggle="collapse"  href="#menu6" aria-expanded="false" aria-controls="menu6">How do I setup URL forwarding? <span class="collapsed"><i class="ion-ios-arrow-up"></i></span><span class="expanded"><i class="ion-ios-arrow-down"></i></span></a>
						        </div>
						        <div id="menu6" class="collapse">
						          <div class="card-body">
												<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
						          </div>
						        </div>
						      </div>
    						</div>
    					</div>
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