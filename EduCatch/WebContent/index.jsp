<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<jsp:include page="top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<style type="text/css">
	
	.footer-tittle{
		font-family: 'Jua', sans-serif;
		margin: 0px;
		padding: 0px;
  		font-size : 20px;
  		font-weight : bold;
	}
	
	/*미디어 쿼리*/
	/* Mobile Device (가로폭 767px 이하) */
	@media all and (max-width:767px) {
		#layer_pop{
			position:absolute; 
			width:250px;
			left:10%;  
			top:110px; 
			z-index:1;
		}
		
		#layer_pop_img{
			width :250px; 
			height :300px;
			border :0px;
		}
		#layer_pop_table{
			width :250px; 
		}
		.layer_pop_a{
			font-size: 12px;
			color: black;
		}
	}
	
	/* Tablet (가로폭 768px 이상, 1023px 이하) */
	@media all and (min-width:768px) and (max-width:1023px) {
	/* 브라우저 가로폭이 768~1023px일때 적용될 css (태블릿) */
		#layer_pop{
			position:absolute; 
			width:350px;
			left:45%;  
			top:110px; 
			z-index:1;
		}
		#layer_pop_table{
			width :350px; 
		}
		
		#layer_pop_img{
			width :350px; 
			height :500px;
			border :0px;
		}
		.layer_pop_a{
			font-size: 16px;
			color: black;
		}
		
	}
	
	/* PC Desktop (가로폭 1024 이상) */
	@media all and (min-width:1024px) {
		#layer_pop{
			position:absolute; 
			width:350px;
			left:55%;  
			top:110px; 
			z-index:1;
		}
		#layer_pop_table{
			width :350px; 
		}
		
		#layer_pop_img{
			width :350px; 
			height :500px;
			border :0px;
		}
		.layer_pop_a{
			font-size: 16px;
			color: black;
		}
		
	}
		a:hover {
		    color: black;
		}
		.footer-number{
			text-align: center;
		
		}
		.footer-pera {
			align: center;
		}
		
</style>
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
			
			st =  "<div class='layer_popup'  id='layer_pop'>";
			st += "<table  border='3' cellpadding='0' cellspacing='0'id='layer_pop_table' >";
			st += "<tr>";
			st += "<td> <img src='/EduCatch/assets/img/event/"+img+"' alt='사진없음' id='layer_pop_img'/></td>";
			st += "</tr>";
			st += "<tr>";
			st += "<td align='center' height='30' bgcolor='#F5F5F5'>";
			st += "<table width='95%' border='0' cellpadding='0' cellspacing='0'>";
			st += "<tr>";
			st += "<td align='left' class='pop'><input type='checkbox' name='pop_today' id='pop_today' /><a href='javascript:checkBtn();' class='layer_pop_a'>오늘 하루 이 창 열지 않음</a></td>";
			st += "<td align='right' class='pop' ><a href='javascript:closeWin();' class='layer_pop_a' >닫기</a></td>";
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
                                    <p data-animation="fadeInLeft" data-delay="0.4s">&nbsp;&nbsp;EduCatch에서 우리동네 학원과 후기를 살펴보세요</p>
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
                                    <p data-animation="fadeInLeft" data-delay="0.4s">&nbsp;EduCatch에서 우리동네 학원과 후기를 살펴보세요</p>
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
                                <h2>원하는 학원을 찾기 힘드셨나요?</h2>
                            </div>
                            <p>Educatch 는 원하는 학원을 시간의 제약을 받지않고 쉽고 빠르게 찾을 수 있습니다. 또한 타 사이트와 차별화된 예약상담 기능을 이용을 하여 직접 방문하지 않아도 학원의 정보를 얻을 수 있습니다. </p>
                        </div>
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                <div class="experience">
                                    
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                <div class="experience">
                               
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-6 col-md-9 offset-md-1 offset-sm-1">
                        <div class="about-right-cap"style=" cursor: pointer;"  onclick="location.href='searchMain.ec'">
                            <div class="about-right-img">
                                <img src="assets/img/gallery/phone.jpg;" alt="">
                            </div>
                            <div class="img-cap" style ="weight : 150px;">
                            	<a href="searchMain.ec" ><img src="/EduCatch/assets/img/gallery/analyze.png" width ="95px" height ="95px" title ="클릭하여 빠른 학원검색" ></a><br>
<!--                                 <span><a style = "font-size : 30px;" href="searchMain.ec" >학원찾기</a></span> --><br>
                                <p><a style="font-size : 18px; font-weight: 100;"  href ="searchMain.ec">클릭하여 빠른 학원 찾기</a></p>
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
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/background.png);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                    <img src="/EduCatch/assets/img/gallery/search.png" width ="110px" height ="110px"><br><br>
                                    <h3>쉬운 학원찾기</h3>
                                    <p>직접 학원에 전화를 하거나, 방문할 필요없이 언제 어디서나 간편하게 주변 학원정보를 찾아보세요.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-gallery no-margin text-center">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/background.png);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                	<img src="/EduCatch/assets/img/gallery/document.png" width ="110px" height ="110px"><br><br>
                                    <h3>필요한 정보를 한 페이지에</h3>
                                    <p>학원에 대한 정보를 한 페이지에서 제공합니다. 다른곳에서 정보를 찾아 헤맬 필요가 없습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-gallery text-center">
                            <div class="gallery-img" style="background-image: url(assets/img/gallery/background.png);"></div>
                            <div class="thumb-content-box">
                                <div class="thumb-content">
                                	<img src="/EduCatch/assets/img/gallery/thums.png" width ="110px" height ="110px"><br><br>
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
                                <h4>학원찾5조</h4>
                                <ul>
                                    <li>김한결   남시현</li>
                                    <li>김기남   손성호</li>
                                    <li>이주연   송채민   박혜미</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>EduCatch</h4>
                                <ul>
                                    <li><a href="searchMain.ec">학원찾기</a></li>
                                    <li><a href="freeboardlist.ec">커뮤니티</a></li>
                                    <li><a href="statics.ec">통계페이지</a></li>
                                    <li><a href="listNotice.ec">공지사항</a></li>
<!--                                <li><a href="listMyPage.ec">마이페이지</a></li> -->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-5 col-sm-8">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>연락하기</h4>
                            </div>
                            <div class="footer-number">
                                <p>Phone: +82 6677 0249</p>
                                <p>Email: educatch2020@gmail.com</p>
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