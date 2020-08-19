<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<jsp:include page="top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<script type="text/javascript">
	function call(){
		console.log("call");
		cookiedata = document.cookie;
		if (cookiedata.indexOf("ncookie=done") < 0){
		  document.getElementById('layer_pop').style.display = "inline";
		console.log("inline");
		}else {
		  document.getElementById('layer_pop').style.display = "none";
		}
	}
	 function setCookie( name, value, expirehours ) {
		  var todayDate = new Date();
		  todayDate.setHours( todayDate.getHours() + expirehours );
		  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	 } 
	 function closeWin() {
		  if(document.getElementById("pop_today").checked){
		   setCookie( "ncookie", "done" , 24 );
		  }
		  document.getElementById('layer_pop').style.display = "none";
	 } 

	 function ajaxGetPopup(){
		 urls = "eventPopup.ec";
		 console.log("urls>>>"+urls);
		$.ajax({
			url : urls
		}).done(function(resParam){
			 var img = resParam.eventPop[0].eimg;
			 var st ="";
			console.log(resParam.eventPop[0].eimg);
			
			st = "<div class='layer_popup' style='position:absolute; width:500px;left:55%;  top:110px; z-index:1;' id='layer_pop'>";
			st += "<table width='500' border='3' cellpadding='0' cellspacing='0' >";
			st += "<tr>";
			st += "<td> <img src='/EduCatch/assets/img/event/"+img+"' alt='사진업음' width='500' height='500' border='0'/></td>";
			st += "</tr>";
			st += "<tr>";
			st += "<td align='center' height='30' bgcolor='#F5F5F5'>";
			st += "<table width='95%' border='0' cellpadding='0' cellspacing='0'>";
			st += "<tr>";
			st += " <td align='left' class='pop'><input type='checkbox' name='pop_today' id='pop_today' />오늘 하루 이 창 열지 않음</td>";
			st += "<td align='right' class='pop' ><a href='javascript:closeWin();' style='color: black;'>닫기</a></td>";
			st += " </tr>";
			st += "</table>";
			st += "</td>";
			st += "</tr>";
			st += "</table>";
			st += "</div>";
		
				
			$(".pop").html(st);	
			call();			
		}).fail(function(resParam){
			alert('에러');
		});
	 }
	 
	 $(document).ready(function() {
		 ajaxGetPopup();
	});//end of ready()
</script>
</head>
<body>
    <main>
        <!--? slider Area Start-->
        <div class="slider-area position-relative">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-7 col-lg-9 col-md-8 col-sm-9">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay="0.2s">우리동네 학원찾기</h1>
                                    <p data-animation="fadeInLeft" data-delay="0.4s">EduCatch에서 우리동네 학원과 후기를 살펴보세요</p>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
                <!-- Single Slider -->
                <div class="single-slider slider-height d-flex align-items-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-7 col-lg-9 col-md-8 col-sm-9">
                                <div class="hero__caption">
                                    <h1 data-animation="fadeInLeft" data-delay="0.2s">우리동네 학원찾기</h1>
                                    <p data-animation="fadeInLeft" data-delay="0.4s">EduCatch에서 우리동네 학원과 후기를 살펴보세요!</p>
                                </div>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        <!--? About 1 Start-->
        <section class="about-low-area section-padding40">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-xl-6 col-lg-6 col-md-10">
                        <div class="about-caption mb-50">
                            <!-- Section Tittle -->
                            <div class="section-tittle mb-35">
                                <span class="element">About Us</span>
                                <h2>We have all your needs, from micro macro</h2>
                            </div>
                            <p>We collect and analyze information about your general usage of the website, products, services, and courses. We might track your usage patterns to see what features of the website you commonly use, website traffic volume, frequency of visits, type and time of transactions, type of browser, browser language.</p>
                        </div>
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                <div class="experience">
                                    <span>454 m</span>
                                    <p>Delivery Packages</p>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                <div class="experience">
                                    <span>127</span>
                                    <p>Countries Covered</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-6 col-md-9 offset-md-1 offset-sm-1">
                        <div class="about-right-cap">
                            <div class="about-right-img">
                                <img src="assets/img/gallery/about1.png" alt="">
                            </div>
                            <div class="img-cap">
                                <span>20</span>
                                <p>Years of experience</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About  End-->
        <!--? Gallery Area Start -->
        <div class="gallery-area">
            <div class="container-fluid p-0 fix">
                <div class="row no-gutters">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-gallery text-center">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/gallery1.png);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <h3>Mechanical Engineering</h3>
                                    <p>We collect and analyze information about your general usage of the website, products, services.</p>
                                    <a href="services.html">Learn More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-gallery no-margin text-center">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/gallery2.png);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <h3>Mechanical Engineering</h3>
                                    <p>We collect and analyze information about your general usage of the website, products, services.</p>
                                    <a href="services.html">Learn More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-gallery text-center">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/gallery3.png);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <h3>Mechanical Engineering</h3>
                                    <p>We collect and analyze information about your general usage of the website, products, services.</p>
                                    <a href="services.html">Learn More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Gallery Area End -->
        <!--? Categories Area Start -->
        <div class="categories-area section-padding40 gray-bg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8">
                        <div class="section-tittle text-center mb-100">
                            <span class="element">Features</span>
                            <h2>To increase productivity and cost effectiveness on the market.</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-cat">
                            <div class="cat-icon">
                                <img src="assets/img/gallery/icon1.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="services.html">Quality</a></h5>
                                <p>We collect and analyze information about your general usage of the website, products, services, and courses.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-cat">
                            <div class="cat-icon">
                                <img src="assets/img/gallery/icon2.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="services.html">Reliablity</a></h5>
                                <p>We collect and analyze information about your general usage of the website, products, services, and courses.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-cat">
                            <div class="cat-icon">
                                <img src="assets/img/gallery/icon3.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="services.html">Experience</a></h5>
                                <p>We collect and analyze information about your general usage of the website, products, services, and courses.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-cat">
                            <div class="cat-icon">
                                <img src="assets/img/gallery/icon4.png" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="services.html">Manufacturing</a></h5>
                                <p>We collect and analyze information about your general usage of the website, products, services, and courses.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- cat End -->
        <!-- Services Area start -->
        <div class="service-area section-bg" data-background="assets/img/gallery/section_bg01.png">
            <div class="container">
                <div class="row align-items-end no-gutters">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="single-main position-relative">
                            <div class="single-wrapper active">
                                <div class="single-services ">
                                    <span>01.</span>
                                    <h4>Building Yead</h4>
                                    <p>We collect and analyze information about your general usage of the website to the products services and courses.</p>
                                </div>
                                <div class="services-btn">
                                    <a href="project.html">View More</a>
                                </div>
                            </div>
                            <span class="transparrent-btn active position-absolute">02. Meghna Bridge</span>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="single-main position-relative ">
                            <div class="single-wrapper hide">
                                <div class="single-services ">
                                    <span>02.</span>
                                    <h4>Meghna Bridge</h4>
                                    <p>We collect and analyze information about your general usage of the website to the products services and courses.</p>
                                </div>
                                <div class="services-btn">
                                    <a href="project.html">View More</a>
                                </div>
                            </div>
                            <span class="transparrent-btn position-absolute">02. Meghna Bridge</span>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="single-main position-relative">
                            <div class="single-wrapper hide">
                                <div class="single-services ">
                                    <span>03.</span>
                                    <h4>Kalis Vadru</h4>
                                    <p>We collect and analyze information about your general usage of the website to the products services and courses.</p>
                                </div>
                                <div class="services-btn">
                                    <a href="project.html">View More</a>
                                </div>
                            </div>
                            <span class="transparrent-btn position-absolute">03. Kalis Vadru</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Services Area End -->
        <!-- Want To work -->
        <section class="wantToWork-area gray-bg ">
            <div class="container">
                <div class="wants-wrapper w-padding2">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-xl-8 col-lg-9 col-md-8">
                            <div class="wantToWork-caption wantToWork-caption2">
                                <h2>Up to 40% Off</h2>
                                <p>We collect and analyze information about your general usage of the website, products, services, and courses.</p>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4">
                            <a href="#" class="btn w-btn wantToWork-btn">Learn More <i class="ti-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Want To work End -->
        <!-- Contact form Start -->
        <div class="contact-form testimonial-area section-padding40 mb-40">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row justify-content-center">
                    <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10">
                        <div class="section-tittle text-center mb-100">
                            <span class="element">Testimonial</span>
                            <h2>Some amazing words from our clients</h2>
                        </div>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-6 col-md-12">
                        <!-- Testimonial Start -->
                        <div class="h1-testimonial-active">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial">
                                <div class="testimonial-caption">
                                    <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering through.</p>
                                    <div class="rattiong-caption">
                                        <span>- Micky Mouse,<span>Business Man</span> </span>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial">
                                <div class="testimonial-caption">
                                    <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering through.</p>
                                    <div class="rattiong-caption">
                                        <span>- Micky Mouse,<span>Business Man</span> </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <!-- slider -->
                        <div class="single-man-slider">
                            <div class="man-slider-active">
                                <div class="single-mam-img">
                                    <img src="assets/img/gallery/man1.png" alt="">
                                </div>
                                <div class="single-mam-img">
                                    <img src="assets/img/gallery/man1.png" alt="">
                                </div>
                                <div class="single-mam-img">
                                    <img src="assets/img/gallery/man1.png" alt="">
                                </div>
                                <div class="single-mam-img">
                                    <img src="assets/img/gallery/man1.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <!-- galary -->
                        <div class="single-gallery">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/gallery2.png);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <h3><a href="#">Need to make<br> an enquiry?</a></h3>
                                    <p>We collect and analyze information about your general usage of the website products.</p>
                                    <a href="services.html">Learn More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <!-- contact-form -->
                        <div class="form-wrapper">
                            <div class="row ">
                                <div class="col-xl-12">
                                    <div class="section-tittle section-tittle2 mb-30">
                                        <h2>Drop your message</h2>
                                    </div>
                                </div>
                            </div>
                            <form id="contact-form" action="#" method="POST">
                                <div class="row">
                                    <div class="col-lg-12 col-md-6">
                                        <div class="form-box user-icon mb-15">
                                            <input type="text" name="name" placeholder="Your Name">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6">
                                        <div class="form-box email-icon mb-15">
                                            <input type="text" name="email" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6">
                                        <div class="form-box email-icon mb-15">
                                            <input type="text" name="email" placeholder="Phone no.">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 mb-15">
                                        <div class="select-itms">
                                            <select name="select" id="select2">
                                                <option value="">Topic</option>
                                                <option value="">Topic one</option>
                                                <option value="">Topic Two</option>
                                                <option value="">Topic Three</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-box message-icon mb-15">
                                            <textarea name="message" id="message" placeholder="Message"></textarea>
                                        </div>
                                        <div class="submit-info">
                                            <button class="submit-btn2" type="submit">Send Message</button>
                                        </div>
                                    </div>
                                </div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact form End -->
        <!--? Blog Area Start -->
        <section class="home-blog-area pb-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="section-tittle mb-100">
                            <span class="element">From News</span>
                            <h2>News & Media center</h2>
                            <p>We collect and analyze information about your general usage of the website products services and courses.</p>
                            <a href="blog_details.html" class="all-btn">View All</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="assets/img/gallery/home-blog1.png" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p>22 Apr 2020</p>
                                    <h3><a href="blog_details.html">We might track your usage patterns to see</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="assets/img/gallery/home-blog2.png" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p>22 Apr 2020</p>
                                    <h3><a href="blog_details.html">The massive stadium screens at the MCG</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Area End -->
        <!-- Want To work 2-->
        <section class="wantToWork-area">
            <div class="container">
                <div class="wants-wrapper w-padding3">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-xl-3 col-lg-3 col-md-3">
                            <div class="wantToWork-caption wantToWork-caption2">
                                <div class="logo">
                                    <img src="assets/img/logo/logo.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-8 col-md-8">
                            <div class="double-btn f-right ">
                                <a href="#" class="btn w-btn wantToWork-btn mr-20">Learn More <i class="ti-arrow-right"></i></a>
                                <a href="#" class="btn2 w-btn wantToWork-btn">Learn More <i class="ti-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Want To work End 2-->
    </main>
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-2 col-lg-2 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Company</h4>
                                <ul>
                                    <li><a href="#">Why choose us</a></li>
                                    <li><a href="#"> Review</a></li>
                                    <li><a href="#">Customers</a></li>
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">Carrier</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Production</h4>
                                <ul>
                                    <li><a href="#">Technology</a></li>
                                    <li><a href="#">Products</a></li>
                                    <li><a href="#">Quality</a></li>
                                    <li><a href="#">Sales geography</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-5 col-sm-8">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Contact Us</h4>
                                <div class="footer-pera">
                                    <p class="info1">Address: 789/A green avenue Dhanmondi, Dhaka</p>
                                </div>
                            </div>
                            <div class="footer-number">
                                <p>Phone: +10 783 3674 356</p>
                                <p>Email: company@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle mb-50">
                                <h4>Newsletter</h4>
                                <p>Subscribe our newsletter to get updates about our services</p>
                            </div>
                            <!-- Form -->
                            <div class="footer-form">
                                <div id="mc_embed_signup">
                                    <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative mail_part" novalidate="true">
                                        <input type="email" name="EMAIL" id="newsletter-form-email" placeholder=" Email Address " class="placeholder hide-on-focus" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your email address'">
                                        <div class="form-icon">
                                            <button type="submit" name="submit" id="newsletter-submit" class="email_icon newsletter-submit button-contactForm">
                                                Subscribe
                                            </button>
                                        </div>
                                        <div class="mt-10 info"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pop"></div>
        <jsp:include page="footer.jsp" flush="true">
        <jsp:param value="" name=""/>
        </jsp:include>
</html>