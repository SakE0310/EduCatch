<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>EduCatch</title>
        
	    <link rel="shortcut icon" href="/EduCatch/assets/img/favicon-96x96.png" type="image/x-icon">
		<link rel="icon" href="/EduCatch/assets/img/favicon-96x96.png" type="image/x-icon">
        <link href="/EduCatch/assets/css/manageStyles.css" rel="stylesheet" />
        <link href="/EduCatch/assets/css/media.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>

        
<%-- -----------CSS------------- --%>
        <style type="text/css">
        	.sb-nav-link-icon{
        		height: 20px;
        		width: 20px;
        	}
        	
        	#form {
			margin: auto;
		}
		
		
		
		select {
		width: 500px;
		padding: .8em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('arrow.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		}
		
		
		select::-ms-expand {
		    display: none;
		}
		
			
		input[type="file"] {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
			}
		</style>
		
		
		
<%-- -----------스크립트------------- --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fb37ba283dc18386af651f85d45ef34&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		ajaxGetMajor();
		
		$('#ex_filename').on('change', function(){
			
			var filename;
			// 값이 변경되면 
			if(window.FileReader){ 
				// modern browser 
				filename = $(this)[0].files[0].name; 
			} else { 
				// old IE 
				filename = $(this).val().split('/').pop().split('\\').pop(); 
				// 파일명만 추출 
			} // 추출한 파일명 삽입
			var fileType = filename.split(".")[1];
			fileType = fileType.toLowerCase();
			if(fileType=='jpg' || fileType == 'gif' || fileType == 'png' || fileType == 'jpeg' || fileType == 'bmp'){
				
			}else{
				alert('이미지 파일만 선택할 수 있습니다.')
				return false;
			}
			$('#alogo').val(filename);
			
		});
		
		$('#addAcademy').on('click', function(){
			if($('#alogo').val() != null && $('#alogo').val() != ""){
				$('#academyInfo').attr("enctype", "multipart/form-data");
			}else{
			
			}
			
			$('#academyInfo').attr("action", "insertAcademy.ec");
			$('#academyInfo').attr("method", "POST");
			$('#academyInfo').submit();
		});
		
		$(".form-select.major").on('change', 'select', function() {
			  var setMajor = $("#cmajor").val();
			  console.log('setmajor >>> ' + setMajor);
			  ajaxGetMinor(setMajor);
		});
		
		//두번째 주소창값을 가지고 좌표찍기
		$(document).on('keyup', '#aaddr2', function(){
			var geocoder = new kakao.maps.services.Geocoder();
	
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log(result);
			        console.log(result[0].x);
			        console.log(result[0].y);
			        $('#axpoint').val(result[0].x);
					$('#aypoint').val(result[0].y);
			    }
			};
			
			var address = $('#aaddr1').val() + " " + $('#aaddr2').val();
			
			geocoder.addressSearch(address, callback);
			
		});
		
	});
	
	function addrCheck(){
		new daum.Postcode({
			oncomplete: function(data){
				console.log("새우편번호 >>> : " + data.zonecode);
				console.log("주소값 >>> : " + data.address);
				console.log("빌딩값 >>> : " + data.buildingName);	
				$('#aaddrno').val(data.zonecode);
				$('#aaddr1').val(data.address);
				$('#aaddr2').val(data.buildingName);
				
				
				//주소를 가져왔을때 좌표찍기 
				var geocoder = new kakao.maps.services.Geocoder();
	
				var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        console.log(result);
				        console.log(result[0].x);
				        console.log(result[0].y);
				        $('#axpoint').val(result[0].x);
						$('#aypoint').val(result[0].y);
				    }
				};
				
				var address = $('#aaddr1').val() + " " + $('#aaddr2').val();
				
				geocoder.addressSearch(address, callback);
						
					
					
				
			}
		}).open();
	}
	
	function ajaxGetMajor(){
		$.ajax({
			url : "getCmajor.ec",
		}).done(function(resultParam){
			var str="";
			for(i in resultParam.major){
				console.log(i);
				var cmajor = resultParam.major[i].cmajor;
				str += "<option value='"+cmajor+"'>"+cmajor+"</option>\n";
			}
			$('select#cmajor').html(str);
			ajaxGetMinor(resultParam.major[0].cmajor);
			var a = resultParam.major;
		}).fail(function(resultParam){
			alert("초기화에 문제가 발생하였습니다.");
		});
	
	}
	
	function ajaxGetMinor(param){
		console.log("param >>> " + param);
		$.ajax({
			url : "getCminor.ec",
			data : {
				"major" : param
			}
			
		}).done(function(resultParam){
			console.log("getMinor >>> ");
			var str="";
			for(i in resultParam.minor){
				console.log(i);
				var cmajor = resultParam.minor[i].cminor;
				str += "<option value='"+cmajor+"'>"+cmajor+"</option>\n";
			}
			$('select#cminor').html(str);
		}).fail(function(resultParam){
			alert("초기화에 문제가 발생하였습니다.");
		});
	
	}
	</script>
	
	
	
</head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp"><img alt="logo" src="assets/img/favicon-32x32.png"> EduCatch</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                            <a class="nav-link" href="manage.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <a class="nav-link" href="manageAca.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-tasks"></i></div>
                              	학원관리
                            </a>
                            <a class="nav-link" href="manageReserChk.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-check"></i></div>
                              	 상담예약 관리
                            </a>
                            <a class="nav-link" href="manageAcaMem.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-check"></i></div>
                              	학원회원 승인
                            </a>
                            
                            <a class="nav-link" href="addAca.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-plus-square"></i></div>
                              	학원정보 등록
                            </a>
                            
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                                로그아웃
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">학원정보 등록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">등록요청된 학원정보를 토대로 DB에 입력할 수 있습니다.</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-2">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                       		 학원등록
                                    </div>
                                    <div class="card-body">
                                    
                                    <%-- ----------- 바디 ------------- --%>
<%
	Object obj = null;
	obj = request.getAttribute("resultStr");
	String str = (String)obj;
	if(str != null && str != "null"){
		out.println("<script>\n");
		out.println("alert('" + str + "');");
		out.println("location.href='academyPage.ec'");
		out.println("</script>\n");
	}
%>
	<main>
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-lg-8 col-md-8" id="form">
						<form name="academyInfo" id="academyInfo">
						
						<h1 align="center">학원 등록</h1>
						
						<hr>
						<br>
						
							<div class="form-group">
								<label for="exampleInputEmail1">
									<h3>학원 이름</h3>
								</label>
								<input type="text" class="form-control" id="aname" name="aname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">
									<h3>학원 전화번호</h3>
								</label>
								<input type="text" class="form-control" id="atel" name="atel">
							</div>
							<h3>학원 분야</h3>
							<div class="mt-10">
								<div class="form-select major" id="default-select">
									<select id="cmajor" name="cmajor">
										<option value="">분야구분</option>
										<option value="2">2</option>
									</select>
								</div>
							</div>
							<div class="mt-10">
								<div class="form-select minor" id="default-select">
									<select id="cminor" name="cminor">
										<option value=""></option>
									</select>
								</div>
							</div>
							<br>
							<h3>편의기능 </h3>
							<div class="row">
								 <br>&nbsp;&nbsp;&nbsp;&nbsp;
								 <div class="mt-10">
									 <input type="checkbox" id="acparking" name="acparking" value="Y">주차장&nbsp;&nbsp;
								 </div>
								 <div class="mt-10">
								 	<input type="checkbox" id="acstore" name="acstore" value="Y">편의점&nbsp;&nbsp;
								 </div>
								 	<div class="mt-10">
								 <input type="checkbox" id="acbus" name="acbus" value="Y">셔틀버스&nbsp;&nbsp;
								 </div>
								 <div class="mt-10">
								 	<input type="checkbox" id="acelevator" name="acelevator" value="Y">엘리베이터&nbsp;&nbsp;
								 </div>
								 <div class="mt-10">
								 	<input type="checkbox" id="acstudyroom" name="acstudyroom" value="Y">자습실&nbsp;&nbsp;
								 </div>
								 <div class="mt-10">
								 	<input type="checkbox" id="aclounge" name="aclounge" value="Y">휴게실&nbsp;&nbsp;
								 </div>
								 <div class="mt-10">
									 <input type="checkbox" id="aclocker" name="aclocker" value="Y">사물함&nbsp;&nbsp;
							   	 </div>
							</div>
							<h3>우편번호(도로명주소)</h3>
							<div class="row">
								<div class="col-md-8">
										<input type="text" class="form-control" id="aaddrno" name="aaddrno" readonly />
								</div>
								<div class="col-md-4">
									<a href="javascript:addrCheck();" class="btn btn-primary">찾기</a>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="exampleInputEmail1">
									<h3>주소</h3>
								</label>
								<input type="text" class="form-control" id="aaddr1" name="aaddr1" readonly >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">
									<h3>상세주소</h3>
								</label>
								<input type="text" class="form-control" id="aaddr2" name="aaddr2">
								<input type="hidden" name="axpoint" id="axpoint" >
								<input type="hidden" name="aypoint" id="aypoint" >
							</div>
							<h3>로고이미지</h3>
							<div class="row">
								<div class="col-md-8">
									<input type="text" class="form-control" id="alogo" name="alogo" readonly>
								</div>
								<div class="col-md-4">
									<label for="ex_filename" class="btn btn-primary">찾기</label>
									<input type="file" id="ex_filename" name="file" class="upload-hidden">
								</div>
							</div>
							<br>
							<button type="button" id="addAcademy" class="btn btn-primary">
								학원등록
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
                                    
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; EduCatch 2020</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/EduCatch/assets/js/manageScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>