<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}
%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>  
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>EduCatch</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/EduCatch/assets/img/favicon-96x96.png" type="image/x-icon">
	<link rel="icon" href="/EduCatch/assets/img/favicon-96x96.png" type="image/x-icon">

	<!-- CSS here -->
	<link rel="stylesheet" href="/EduCatch/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/slicknav.css">
    <link rel="stylesheet" href="/EduCatch/assets/css/flaticon.css">
    <link rel="stylesheet" href="/EduCatch/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="/EduCatch/assets/css/gijgo.css">
    <link rel="stylesheet" href="/EduCatch/assets/css/animate.min.css">
    <link rel="stylesheet" href="/EduCatch/assets/css/animated-headline.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/themify-icons.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/slick.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/nice-select.css">
	<link rel="stylesheet" href="/EduCatch/assets/css/style.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style type="text/css">
	.login{
		color: #0d2d3e;
		font-weight: 600;
		display: block;
		font-size: 16px;
		-webkit-transition: 0.3s;
		-moz-transition: 0.3s;
		-o-transition: 0.3s;
		transition: 0.3s;
		text-transform: capitalize;
	}
	.login:hover{
		color: #FF3514;
	}
	</style>
<script type="text/javascript">
	$(document).ready(function(){
		var windowWidth1 = $(window).width();
		if(windowWidth1 < 992) {
            $('.liLogin').show();
            $('.liMy').show();
		} else {
            $('.liLogin').hide();
            $('.liMy').hide();
		}
		$(window).resize(function() {
			var windowWidth = $(window).width();
			if(windowWidth < 992) {
                $('.liLogin').show();
                $('.liMy').show();
			} else {
                $('.liLogin').hide();
                $('.liMy').hide();
			}
		});
	});
</script>
</head>
<!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="/EduCatch/assets/img/logo/Eduloder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area">
            <div class="main-header ">
                <div class="header-bottom header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="index.jsp"><img src="assets/img/logo/Edulogo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-8 col-lg-7">
                                <div class="menu-wrapper  d-flex align-items-center">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav> 
                                            <ul id="navigation">                                                                                          
                                                <li><a href="index.jsp">홈</a></li>
                                                <li><a href="searchMain.ec">학원찾기</a></li>
                                                <li><a href="freeboardlist.ec">커뮤니티</a>
                                                    <ul class="submenu">
                                                        <li><a href="freeboardlist.ec">자유게시판</a></li>
                                                        <li><a href="listReview.ec">후기게시판</a></li>
                                                        <li><a href="listConsult.ec">상담게시판</a></li>
                                                        <li><a href="AcaReq.ec">학원등록요청</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="statics.ec">통계페이지</a></li>
                                                <li><a href="listNotice.ec">공지사항</a>
                                                    <ul class="submenu">
                                                        <li><a href="listNotice.ec">공지사항</a></li>
                                                        <li><a href="listEvent.ec">이벤트</a></li>
                                                		<li><a href="myReview.ec">마이페이지</a></li>
                                                    </ul>
                                                </li>
                                                <%
					                            	if(mvo != null){
					                            		if(mvo.getMauth().equals("2") || mvo.getMauth().equals("3")){
					                            			
					                            %>
                                                <li><a href="manage.ec">관리자</a></li>
                                                <%		}
                                                	}
                                                %>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div> 
                            <%
                            	if(mvo != null){
                            		if(mvo.getMno() != null){
                            	
                            %>
                            <input type="hidden" id="mm" value="1"/>
                           <div class="col-lg-2">
                           <div class="main-menu d-none d-lg-block">
                                <!-- 로그인버튼 예정  -->
                                <div class="search d-none d-lg-block">
                                    <ul class="login">
                                        <li>
                                            <div class="nav-log login">
                                                <img width="25px"src="assets/img/login/mypage.png" alt="마이페이지" /> 내정보
                                            </div>
                                            <ul class="submenu">
                                        		<li><a href="myReview.ec">마이페이지</a></li>
                                                <li><a href="logout.ec">로그아웃</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            </div>
                            <% 
                            		}
                            	}else{
                            	
                            %>
                            <input type="hidden" id="mm" value="0"/>
                            <div class="col-lg-2">
                                <!-- 로그인버튼 예정  -->
                                <div class="search d-none d-lg-block">
                                    <ul class="login">
                                        <li>
                                            <div class="nav-log login">
                                                <a href="login.ec" class="login">로그인</a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <%
                            	}
                            %>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>