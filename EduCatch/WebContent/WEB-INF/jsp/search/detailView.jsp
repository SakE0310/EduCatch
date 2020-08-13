<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="com.kosmo.educatch.vo.SubjectVO"%>
<%@page import="com.kosmo.educatch.vo.ConvenienceVO"%>
<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<%-- -----------CSS------------- --%>
<style type="text/css">

#fontman{
		font-weight: bold;
}

#hhr {
    border-bottom: 5px solid #eceff8;
    border-top: 0 none;
    margin: 30px 0;
    padding: 0;
}

.table{

	color:black;
}



<%-- 스크롤스파이 --%>
* {
  margin: 0;
  padding: 0;
}
.nav {
  background-color: rgba(51, 51, 51, 0.9);
  width: 100%;
  height: 60px;
  top: 0;
}
.nav-menu li {
    display: inline-block;
    margin-right: -6px;
    line-height: 60px;
}
.nav-menu-item {
    display: block;
    padding: 0 90px;
    color: #fff;
    text-decoration: none;          
}
.nav-menu-item:hover,
.isactive {
    background-color: #222;
    color: #fff;
}

.section {
    margin-top: 60px;
    line-height: 22px;
    margin-left: 100px;
    margin-right: 100px;
}
.padding-top10 {
    padding-top:10px;
}

#section-1 {
    height: auto;
    background-color: #ffffff;
    color: #fff;
    padding: 20px;
}
#section-2 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-3 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-4 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}



<%-- 공유하기 --%>
.sns-share {
         text-align:right; 
         padding: 20px 0;
      
      }
      .sns-share li {
         display:inline-block; 
         margin: 0 5px; 
         
      }
      
      .sns-share img {
         border-radius: 20%;
         width : 42px;
         height : 42px;
         
      }


<%-- --전체,컨텐츠-- --%>  
#all{
		border-left:1px solid #f3f3f3;
		border-right:1px solid #f3f3f3;
		background:#f3f3f3;

}

#content{
		width:1000px;
		height:auto;
		margin:0 auto;
		border-left:1px solid #d8d8d8;
		border-right:1px solid #d8d8d8;
		border-top:1px solid #d8d8d8;
		border-bottom:1px solid #d8d8d8;
		background:#ffffff;
}

#linked{ 
		color: black;

}







<!-- 이곳은 카카오맵 API-->

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 700px;
	height: 350px;
}

.radius_border1 {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol1 {
	position: absolute;
	top: 10px;
	right: 10px;
	/* overflow: hidden; */
	/* width: 130px; */
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol1 span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol1 .btn10 {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol1 .btn10:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol1 .btn10:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol1 .selected_btn10 {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol1 .selected_btn10:hover {
	color: #fff;
}

.custom_zoomcontrol1 {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol1 span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol1 span img {
	width: 15px;
	/* height: 15px; */
	padding: 12px 0;
	border: none;
	z-index: 10;
}

.custom_zoomcontrol1 span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

</style>


<%-- -----------스크립트------------- --%>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fb37ba283dc18386af651f85d45ef34&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		
		<%-- 스크롤사이드 --%>
		var $menu = $(".nav-menu");
	      var $menu_a = $("a", $menu);
	      var id = false;
	      var sections = [];
	      var hash = function(h) {
	        if (history.pushState) {
	          history.pushState(null, null, h);
	        } else {
	          location.hash = h;
	        }
	      };

	      $menu_a.click(function(event) {
	        event.preventDefault();
	        $("html, body").animate(
	          {
	            scrollTop: $($(this).attr("href")).offset().top - $(".nav").height()
	          },
	          {
	            duration: 700,
	            complete: hash($(this).attr("href"))
	          }
	        );
	      });

	      $menu_a.each(function() {
	        sections.push($($(this).attr("href")));
	      });

	      $(window).scroll(function(event) {
	        var scrolling = $(this).scrollTop() + $(this).height() / 3;
	        var scroll_id;
	        for (var i in sections) {
	          var section = sections[i];
	          if (scrolling > section.offset().top) {
	            scroll_id = section.attr("id");
	          }
	        }
	        if (scroll_id !== id) {
	          id = scroll_id;
	          $menu_a.removeClass("isactive");
	          $("a[href='#" + id + "']", $menu).addClass("isactive");
	        }
	      });
	    });
	</script>
</head>
<body>
<%-- -----------부트스크랩 상단------------- --%>
<jsp:include page="../../../top.jsp" flush="true">
	<jsp:param value="" name="" />
</jsp:include>

<%-- ----------- 바디 ------------- --%>
<%
		Object obj1 = request.getAttribute("avo");
		Object obj2 = request.getAttribute("cvo");
		Object obj3 = request.getAttribute("gvo");
		Object listobj1 = request.getAttribute("subjectList"); 
		Object listobj2 = request.getAttribute("reviewlist"); 

		AcademyVO avo = (AcademyVO)obj1;
		ConvenienceVO cvo = (ConvenienceVO)obj2;
		AcademyVO gvo = (AcademyVO)obj3;
		ArrayList subjectlist = (ArrayList)listobj1;
		ArrayList reviewlist = (ArrayList)listobj2;
		
		int subjectnCnt = subjectlist.size();
		int reivewnCnt = reviewlist.size();
		
		double AXPOINT = Double.parseDouble(avo.getAxpoint());
		double AYPOINT = Double.parseDouble(avo.getAypoint());
		String address = avo.getAaddr1() + " " + avo.getAaddr2();
					
%>

<div id="all">

	<section id="content">
	
		<div id="top">
			<div id="topcon" align="center">
			<table style="margin-left: auto; margin-right: auto;" border="0" cellpadding="1" cellspacing="1" id="fontman">
				<tr>
					<td>
					<br><br><br><br>
						<img src="/EduCatch/assets/img/academyLogo/<%= avo.getAlogo() %>" border=0 width="150" height="150" />
					</td>
					<td>
					<br><br><br><br>
						<h1 style="font-weight:bold;" align="center"><%=avo.getAname() %></h1>
						 <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=address %></h4>
						 <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=avo.getAtel() %></h4>
						 <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 학원 평가 : <%= gvo.getRbgrade() %>(점)</h4>
					</td>
				</tr>
			</table>
			
			<h4 align="right">업데이트 날짜 : <%= avo.getAupdatedate()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
			
			</div>
		</div>
		
		   <div class="sns-share">
                 <ul>
                   <li>
                     <a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=http://localhost:8088/EduCatch/listDetailView.ec' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Naver" ><img src="/EduCatch/assets/img/share/naver_blog.png" width="40" alt="네이버 블러그 공유하기"></a>
                   </li>
                   <li>
                     <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" ><img src="/EduCatch/assets/img/share/facebook.png" width="40" alt="페이스북 공유하기"></a>
                   </li>
                   <li>
                      <a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=http:' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;" target="_blank" alt="Share on kakaostory"><img src="/EduCatch/assets/img/share/kakao.png" width="40" alt="카카오스토리 공유하기"></a>
                   </li>
                   &nbsp;&nbsp;&nbsp;
                  
                 </ul>
            </div>
	
	
		
		
<div>
    <nav class="nav clearfix">
        <ul class="nav-menu">
            <li><a class="nav-menu-item" href="#section-1">기본정보</a></li>
            <li><a class="nav-menu-item" href="#section-2">수업정보</a></li>
            <li><a class="nav-menu-item" href="#section-3">편의기능</a></li>
            <li><a class="nav-menu-item" href="#section-4">수강후기</a></li>
        </ul>
    </nav>
</div>



<br><br><br>
<%-- ----------- 카카오맵 API ------------- --%>
		<div align="center">
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<!-- 지도타입 컨트롤 div 입니다 -->
				<div class="custom_typecontrol1 radius_border1">
					<span id="btnRoadmap" class="selected_btn10"
						onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
						class="btn10" onclick="setMapType('skyview')">스카이뷰</span>
				</div>
				<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
				<div class="custom_zoomcontrol1 radius_border1">
					<span onclick="zoomIn()"><img
						src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
						alt="확대"></span> <span onclick="zoomOut()"><img
						src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
						alt="축소"></span>
				</div>
			</div>
			<script>
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(<%= AYPOINT %>, <%= AXPOINT %>),
					level : 3
				};
		
				var map = new kakao.maps.Map(container, options);
			
				
				// markers 배열로 두어 marker 들을 넣음
				var markers = [];
				var marker = new kakao.maps.Marker({
					position : new kakao.maps.LatLng(<%= AYPOINT %>, <%= AXPOINT %>)
				});
				
				markers.push(marker);
				
				// markers를 map에 세팅
				for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(map);
			    }  
		
				function setMapType(maptype) {
					var roadmapControl = document.getElementById('btnRoadmap');
					var skyviewControl = document.getElementById('btnSkyview');
					if (maptype === 'roadmap') {
						map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
						roadmapControl.className = 'selected_btn10';
						skyviewControl.className = 'btn10';
					} else {
						map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
						skyviewControl.className = 'selected_btn10';
						roadmapControl.className = 'btn10';
					}
				}
		
				// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
				function zoomIn() {
					map.setLevel(map.getLevel() - 1);
				}
		
				// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
				function zoomOut() {
					map.setLevel(map.getLevel() + 1);
				}
				
				// 커스텀 오버레이에 표시할 컨텐츠 입니다
				// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
				// 별도의 이벤트 메소드를 제공하지 않습니다 
				
				
				
				var content = '<div class="wrap">' + 
				            '    <div class="info">' + 
				            '        <div class="title">' + 
				            '          <%= avo.getAname()%>  ' + 
				            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">' +
				            '                <img src="/EduCatch/assets/img/academyLogo/<%= avo.getAlogo() %>" border=0 width="73" height="70" >' +
				            '           </div>' + 
				            '            <div class="desc">' + 
				            '                <div class="ellipsis"><%= avo.getAaddr1()%><%= avo.getAaddr2() %> </div>' + 
				            '                <div class="jibun ellipsis">(우)<%= avo.getAaddrno()%> </div> '+ 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +    
				            '</div>';
				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: markers[0].getPosition()       
				});
		
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(markers[0], 'click', function() {
				    overlay.setMap(map);
				});
		
				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
				    overlay.setMap(null);     
				}
			</script>
		</div>
		
	<br>
	<br>
    <hr id="hhr">
		

<div class="section">
    <section id="section-1">
        <h1>학원 정보</h1><br><br>
        <div class="container">
			  <table class="table table-condensed">
			    <tr>
			        <td>학원명</td>
			        <td><%=avo.getAname() %></td>
			      </tr>
			      <tr>
			        <td>연락처</td>
			        <td><%=avo.getAtel() %></td>
			      </tr>
			      <tr>
			        <td>주소</td>
			        <td><%=address %></td>
			      </tr>
			  </table>
			</div>
        
    </section>

    <section id="section-2">
    	<hr id="hhr">
    	<div class="container">
			  <table class="table table-condensed">
       			 <h1>수업 정보</h1><br><br>
			    <thead>
			      <tr>
			        <th>과목명</th>
			        <th>수강날짜</th>
			        <th>수강시간</th>
			        <th>수강금액</th>
			        <th>수강인원</th>
			      </tr>
			    </thead>
			    <tbody>
<%
	for(int i=0; i<subjectnCnt; i++){
		SubjectVO svo = (SubjectVO)subjectlist.get(i);
		
		if(subjectnCnt>0){
%>
			    <tr>
			        <td><%=svo.getSname() %></td>
			        <td><%=svo.getSday() %></td>
			        <td><%=svo.getStime() %></td>
			        <td><%=svo.getSprice() %></td>
			        <td><%=svo.getSpeople() %></td>
			    </tr>
<%
		}
	}
%>
			      
			    </tbody>
			  </table>
			</div>
    </section>

    <section id="section-3">
    <hr id="hhr">
        <h1>편의기능</h1>
			<br><br>
			<%
				String acparking = cvo.getAcbus();
				String acstore = cvo.getAcstore();
				String acbus = cvo.getAcbus();
				String acelevator = cvo.getAcelevator();
				String acstudyroom = cvo.getAcstudyroom();
				String aclounge = cvo.getAclounge();
				String aclocker = cvo.getAclocker();
				//주차장
				if(acparking.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/parking.png" border=0 width="150" height="150" />
					<%
				}
				//편의점
				if(acstore.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/convenience.png" border=0 width="150" height="150" />
					<%
				}
				//셔틀버스
				if(acbus.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/bus.png" border=0 width="150" height="150" />
					<%
				}
				//엘레베이터
				if(acelevator.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/elevator.png" border=0 width="150" height="150" />
					<%
				}
				//자습실
				if(acstudyroom.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/studyroom.png" border=0 width="150" height="150" />
					<%
				}
				//휴게실
				if(aclounge.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/lounge.png" border=0 width="150" height="150" />
					<%
				}
				//사물함
				if(aclocker.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/locker.png" border=0 width="150" height="150" />
					<%
				}
			%>
    </section>
    <section id="section-4">
    <hr id="hhr">
    	<div class="container">
			  <table class="table table-condensed">
       			 <h1>수업 정보</h1><br><br>
			    <thead>
			      <tr>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>내용</th>
			        <th>별점</th>
			        <th>사진</th>
			      </tr>
			    </thead>
			    <tbody>
<%
	for(int i=0; i<reivewnCnt; i++){
		ReviewVO rvo = (ReviewVO)reviewlist.get(i);
		
		if(reivewnCnt>0){
%>
			    <tr>
			        <td><%=rvo.getRbsubject() %></td>
			        <td><%=rvo.getRbname() %></td>
			        <td><%=rvo.getRbcontent() %></td>
			        <td><%=rvo.getRbgrade() %></td>
			        <td><%=rvo.getRbimg() %></td>
			    </tr>
<%
		}
	}
%>
			      
			    </tbody>
			  </table>
			</div>
    </section>
</div>
	</section>
</div>

<%-- -----------부트스크랩 하단------------- --%>
	<jsp:include page="../../../footer.jsp" flush="true">
		<jsp:param value="" name="" />
	</jsp:include>
</body>
</html>