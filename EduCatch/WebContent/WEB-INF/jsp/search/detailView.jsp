<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>
<body>


<jsp:include page="../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<style>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fb37ba283dc18386af651f85d45ef34&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.478651, 126.878658),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
	
		
		// markers 배열로 두어 marker 들을 넣음
		var markers = [];
		var marker = new kakao.maps.Marker({
			position : new kakao.maps.LatLng(37.478651, 126.878658)
		});
		
		var marker1 = new kakao.maps.Marker({
			position : new kakao.maps.LatLng(37.479051, 126.879919)
		});
		
		markers.push(marker);
		markers.push(marker1);
		
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
		            '          	한국소프트웨어인재개발원' + 
		            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="img">' +
		            '                <img src="http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg" width="73" height="70">' +
		            '           </div>' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차 410 호</div>' + 
		            '                <div class="jibun ellipsis">(우) 08505 (지번) 가산동 426-5</div>' + 
		            '                <div><a href="http://www.ikosmo.co.kr/" target="_blank" class="link">홈페이지</a></div>' + 
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
	
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>