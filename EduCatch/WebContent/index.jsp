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
	 function checkBtn() {
		console.log("누름");
		if(document.getElementById("pop_today").checked == false){
			document.getElementById("pop_today").checked = true;
		}else{
			document.getElementById("pop_today").checked = false;
		}
	}

	 function ajaxGetPopup(){
		 urls = "eventPopup.ec";
		 console.log("urls>>>"+urls);
		$.ajax({
			url : urls
		}).done(function(resParam){
			 var img = resParam.eventPop[0].eimg;
			 var st ="";
			
			st =  "<div class='layer_popup' style='position:absolute; width:350px;left:55%;  top:110px; z-index:1;' id='layer_pop'>";
			st += "<table width='350' border='3' cellpadding='0' cellspacing='0' >";
			st += "<tr>";
			st += "<td> <img src='/EduCatch/assets/img/event/"+img+"' alt='사진업음' width='350' height='500' border='0'/></td>";
			st += "</tr>";
			st += "<tr>";
			st += "<td align='center' height='30' bgcolor='#F5F5F5'>";
			st += "<table width='95%' border='0' cellpadding='0' cellspacing='0'>";
			st += "<tr>";
			st += "<td align='left' class='pop'><input type='checkbox' name='pop_today' id='pop_today' /><a href='javascript:checkBtn();' style='color: black;'>오늘 하루 이 창 열지 않음</a></td>";
			st += "<td align='right' class='pop' ><a href='javascript:closeWin();' style='color: black;'>닫기</a></td>";
			st += "</tr>";
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
                                    <p data-animation="fadeInLeft" data-delay="0.4s">EduCatch에서 우리동네 학원과 후기를 살펴보세요</p>
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
                                <h2>We have all your needs, from micro macro1</h2>
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
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/g1.jpg);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <h3>쉬운 학원찾기</h3>
                                    <p>직접 학원에 전화를 하거나, 방문할 필요없이 언제 어디서나 간편하게 주변 학원정보를 찾아보세요.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-gallery no-margin text-center">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/g2.jpg);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <h3>필요한 정보를 한 페이지에</h3>
                                    <p>학원에 대한 정보를 한 페이지에서 제공합니다. 다른곳에서 정보를 찾아 헤맬 필요가 없습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-gallery text-center">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/g3.jpg);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <h3>믿을 수 있는 학원 정보</h3>
                                    <p>학원 QnA와 회원들의 후기를 통해 궁금점을 해결 하세요. 학원 QnA는 학원 담당자들이 답변을 달아줍니다.</p>
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
        <!-- Services Area End -->
        <!-- Want To work -->
        
        <!-- Want To work End -->
        <!-- Contact form Start -->
        <!-- Contact form End -->
        <!--? Blog Area Start -->
        <!-- Blog Area End -->
        <!-- Want To work 2-->
        <!-- Want To work End 2-->
    </main>
    <footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
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
                </div>
            </div>
        </div>
        <div class="pop"></div>
        <jsp:include page="footer.jsp" flush="true">
        <jsp:param value="" name=""/>
        </jsp:include>
</html>