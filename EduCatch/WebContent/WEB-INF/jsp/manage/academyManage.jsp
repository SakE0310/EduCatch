<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@page import="com.kosmo.educatch.vo.ConvenienceVO"%>
<%@page import="com.kosmo.educatch.vo.SubjectVO"%>
<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
		HttpSession hs = request.getSession(false);
		MemberVO mvo = null;
	    if(hs != null){
			mvo = (MemberVO)hs.getAttribute("user");
		}
	%>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EduCatch</title>

<link rel="shortcut icon" href="/EduCatch/assets/img/favicon-96x96.png"
	type="image/x-icon">
<link rel="icon" href="/EduCatch/assets/img/favicon-96x96.png"
	type="image/x-icon">
<link href="/EduCatch/assets/css/manageStyles.css" rel="stylesheet" />
<link href="/EduCatch/assets/css/media.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<style type="text/css">
@media all and (max-width:767px) {
	#content{
			width:375px;
			height:auto;
			margin:0 auto;
			border-left:1px solid #d8d8d8;
			border-right:1px solid #d8d8d8;
			border-top:1px solid #d8d8d8;
			border-bottom:1px solid #d8d8d8;
			background:#ffffff;
			
	}
	#all{
			background:#f3f3f3;
	}

}
@media all and (min-width:1024px) {
	#content{
			width:1100px;
			height:auto;
			margin:0 auto;
			border-left:1px solid #d8d8d8;
			border-right:1px solid #d8d8d8;
			border-top:1px solid #d8d8d8;
			border-bottom:1px solid #d8d8d8;
			background:#ffffff;
	}
	#all{
			border-left:1px solid #f3f3f3;
			border-right:1px solid #f3f3f3;
			background:#f3f3f3;
	}
}
<%-- -----------CSS------------- --%>
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
			
			
			
.sb-nav-link-icon {
	height: 20px;
	width: 20px;
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



<%-- 버튼 CSS --%>
.btn1{
  background:#172295;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:1.2em;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 12px;
}
.btn1:hover{
  background:#fff;
  color:#172295;
}
.btn1:before,.btn1:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #172295;
  transition:400ms ease all;
}
.btn1:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn1:hover:before,.btn1:hover:after{
  width:100%;
  transition:800ms ease all;
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
    padding: 0 106px;
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



<%-- --전체,컨텐츠-- --%>  
#linked{ 
		color: black;

}




</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fb37ba283dc18386af651f85d45ef34&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//편의기능수정 셀렉트
		$('#modal-749487').on('click', function(){
            
			var academy_ano = $('#academy_ano').val(); 
			
			$.ajax({
				url : "selectOneConvenienice.ec",
				type : "post",
				data : {
					"academy_ano" : academy_ano,
					},
				dataType : "json"
			}).done(function(resultParam){
				if(resultParam.cvo=="aa"){
					alert('정상적으로 데이터가 등록되지 않았습니다.');
				}else{
					var st = "";
					var acbus = resultParam.cvo.acbus;
					var acelevator = resultParam.cvo.acelevator;
					var aclocker = resultParam.cvo.aclocker;
					var aclounge = resultParam.cvo.aclounge;
					var acparking = resultParam.cvo.acparking;
					var acstore = resultParam.cvo.acstore;
					var acstudyroom = resultParam.cvo.acstudyroom;
					var academy_ano = resultParam.cvo.academy_ano;
					console.log(resultParam.cvo);
			
					st = " <div class='mt-10'>";
					if(acparking=="Y"){
						st +=" 		<input type='checkbox' id='acparking' name='acparking' value='Y' checked>&nbsp;주차장<br><br>";
					}else{
						st +=" 		<input type='checkbox' id='acparking' name='acparking' value='Y' >&nbsp;주차장<br><br>";
					}
					st +=" </div>";
					st +=" <div class='mt-10'>";
					if(acstore=="Y"){
						st +=" 		<input type='checkbox' id='acstore' name='acstore' value='Y' checked>&nbsp;편의점<br><br>";
					}else{
						st +=" 		<input type='checkbox' id='acstore' name='acstore' value='Y'>&nbsp;편의점<br><br>";
					}
					st +=" </div>";
					st +=" 	<div class='mt-10'>";
					if(acbus=="Y"){
						st +=" 		<input type='checkbox' id='acbus' name='acbus' value='Y' checked>&nbsp;셔틀버스<br><br>";
					}else{
						st +=" 		<input type='checkbox' id='acbus' name='acbus' value='Y'>&nbsp;셔틀버스<br><br>";
					}
					st +="	 </div>";
					st +="  <div class='mt-10'>";
					if(acelevator=="Y"){
						st +="	 	<input type='checkbox' id='acelevator' name='acelevator' value='Y' checked>&nbsp;엘리베이터<br><br>";
					}else{
						st +="	 	<input type='checkbox' id='acelevator' name='acelevator' value='Y'>&nbsp;엘리베이터<br><br>";
					}
						st +="	 </div>";
						st +="	 <div class='mt-10'>";
					if(acstudyroom=="Y"){
						st +="	 	<input type='checkbox' id='acstudyroom' name='acstudyroom' value='Y' checked>&nbsp;자습실<br><br>";
						
					}else{
						st +="	 	<input type='checkbox' id='acstudyroom' name='acstudyroom' value='Y'>&nbsp;자습실<br><br>";
						
					}
						st +="	 </div>";
						st +="	 <div class='mt-10'>";
					if(aclounge=="Y"){
						st +="	 	<input type='checkbox' id='aclounge' name='aclounge' value='Y' checked>&nbsp;휴게실<br><br>";
						
					}else{
						
						st +="	 	<input type='checkbox' id='aclounge' name='aclounge' value='Y'>&nbsp;휴게실<br><br>";
					}
						st +="	 </div>";
						st +="	 <div class='mt-10'>";
					if(aclocker=="Y"){
						st +="		 <input type='checkbox' id='aclocker' name='aclocker' value='Y' checked>&nbsp;사물함<br><br>";
					}else{
						st +="		 <input type='checkbox' id='aclocker' name='aclocker' value='Y'>&nbsp;사물함<br><br>";
					}
					
					st +="		 <input type='hidden' id='academy_ano' name='academy_ano' value="+academy_ano+">";
					st +="   </div>";
					
					
					$('.condiv').html(st);
				}
			}).fail(function(resultParam){
				if(resultParam.readyState == 4){
					alert(resultParam.responseText);
				}else{
					alert("추가시 DB연결에 문제가 발생하였습니다.");	
				}
			});
		});
		
		//과목수정 셀렉트
		$('#modal-749411').on('click', function(){
            
			var sno = $("input:checkbox[name='chkInBno']:checked").val();
			console.log(sno);

			
			$.ajax({
				url : "selectOneSubject.ec",
				type : "post",
				data : {
					"sno" : sno,
					},
				dataType : "json"
			}).done(function(resultParam){
				if(resultParam.svo=="aa"){
					alert('정상적으로 데이터가 등록되지 않았습니다.');
				}else{
					var st = "";
					var sname = resultParam.svo.sname;
					var sday = resultParam.svo.sday;
					var stime = resultParam.svo.stime;
					var sprice = resultParam.svo.sprice;
					var speople = resultParam.svo.speople;
					var sdeleteyn = resultParam.svo.sdeleteyn;
					var sno = resultParam.svo.sno;
					
					st = "<table class='table table-condensed'>";
				   	st +="<tr>";
				    st +="   <td>과목명</td>";
				    st +="    <td><input type='text' class='form-control' id='sname' name='sname' value="+sname+"></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강날짜</td>";
				    st +="    <td><input type='text' class='form-control' id='sday' name='sday' value="+sday+"></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강시간</td>";
				    st +="    <td><input type='text' class='form-control' id='stime' name='stime' value="+stime+"></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강금액</td>";
				    st +="    <td><input type='text' class='form-control' id='sprice' name='sprice' value="+sprice+"></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강인원</td>";
				    st +="    <td><input type='text' class='form-control' id='speople' name='speople' value="+speople+"></td>";
				    st +="    <input type='hidden' class='form-control' id='sno' name='sno' value="+sno+">";
				    st +="    <input type='hidden' class='form-control' id='sdeleteyn' name='sdeleteyn' value="+sdeleteyn+">";
				    st +=" </tr>";
				    st +="	</table>";
					$('.subjectdiv').html(st);
				}
			}).fail(function(resultParam){
				if(resultParam.readyState == 4){
					alert(resultParam.responseText);
				}else{
					alert("추가시 DB연결에 문제가 발생하였습니다.");	
				}
			});
		});
		
		//과목삭제 셀렉트
		$('#modal-749489').on('click', function(){
			
            
			var sno = $("input:checkbox[name='chkInBno']:checked").val()
			console.log(sno);

			
			$.ajax({
				url : "selectOneSubject.ec",
				type : "post",
				data : {
					"sno" : sno,
					},
				dataType : "json"
			}).done(function(resultParam){
				if(resultParam.svo=="aa"){
					alert('정상적으로 데이터가 등록되지 않았습니다.');
				}else{
					var st = "";
					var sname = resultParam.svo.sname;
					var sday = resultParam.svo.sday;
					var stime = resultParam.svo.stime;
					var sprice = resultParam.svo.sprice;
					var speople = resultParam.svo.speople;
					var sdeleteyn = resultParam.svo.sdeleteyn;
					var sno = resultParam.svo.sno;
					
					st = "<table class='table table-condensed'>";
				   	st +="<tr>";
				    st +="   <td>과목명</td>";
				    st +="    <td><input type='text' class='form-control' id='sname' name='sname' value="+sname+" readonly></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강날짜</td>";
				    st +="    <td><input type='text' class='form-control' id='sday' name='sday' value="+sday+" readonly></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강시간</td>";
				    st +="    <td><input type='text' class='form-control' id='stime' name='stime' value="+stime+" readonly></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강금액</td>";
				    st +="    <td><input type='text' class='form-control' id='sprice' name='sprice' value="+sprice+" readonly></td>";
				    st +=" </tr>";
				    st +=" <tr>";
				    st +="    <td>수강인원</td>";
				    st +="    <td><input type='text' class='form-control' id='speople' name='speople' value="+speople+" readonly></td>";
				    st +="    <input type='hidden' class='form-control' id='sno' name='sno' value="+sno+">";
				    st +="    <input type='hidden' class='form-control' id='sdeleteyn' name='sdeleteyn' value="+sdeleteyn+">";
				    st +=" </tr>";
				    st +="	</table>";
					$('.subjectdeletediv').html(st);
				}
			}).fail(function(resultParam){
				if(resultParam.readyState == 4){
					alert(resultParam.responseText);
				}else{
					alert("추가시 DB연결에 문제가 발생하였습니다.");	
				}
			});
		});
		
		
		
		//학원정보수정 - 이미지
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
		//학원정보수정 버튼
		$('#updateAcademy').on('click', function(){
			if($('#alogo').val() != null && $('#alogo').val() != ""){
				$('#academyForm').attr("enctype", "multipart/form-data");
			}else{
			
			}
			
			$('#academyForm').attr("action", "manageUpdateAcademy.ec");
			$('#academyForm').attr("method", "POST");
			$('#academyForm').submit();
		});
		
		//과목추가 버튼
		$('#addSubject').on('click', function(){
			$('#subjectForm').attr("action", "manageInsertSubject.ec");
			$('#subjectForm').attr("method", "POST");
			$('#subjectForm').submit();
		});
		
		//과목수정 버튼
		$('#updateSubject').on('click', function(){
			$('#subjectUpdateForm').attr("action", "manageUpdateSubject.ec");
			$('#subjectUpdateForm').attr("method", "POST");
			$('#subjectUpdateForm').submit();
		});
		
		//과목삭제 버튼
		$('#deleteSubject').on('click', function(){
			$('#subjectDeleteForm').attr("action", "manageDeleteSubject.ec");
			$('#subjectDeleteForm').attr("method", "POST");
			$('#subjectDeleteForm').submit();
			
		});
		
		//편의기능수정 버튼
		$('#updateConvenience').on('click', function(){
			$('#convenienceUpdateForm').attr("action", "manageUpdateConvenience.ec");
			$('#convenienceUpdateForm').attr("method", "POST");
			$('#convenienceUpdateForm').submit();
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
	
	
	function checkOnly(chk){	 		
        var obj = document.getElementsByName("chkInBno");	        
        for(var i=0; i < obj.length; i++){ 
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }	
	
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

</script>

</head>
<body class="sb-nav-fixed">
<%-- ----------- 바디 ------------- --%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp"><img alt="logo"
			src="assets/img/favicon-32x32.png"> EduCatch</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">메뉴</div>
						<a class="nav-link" href="manage.ec">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 대시보드
						</a> <a class="nav-link" href="manageAca.ec">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tasks"></i>
							</div> 학원관리
						</a> <a class="nav-link" href="manageReserChk.ec">
							<div class="sb-nav-link-icon">
								<i class="fas fa-check"></i>
							</div> 상담예약 관리
						</a> <%
								if(mvo != null){
									if(mvo.getMauth().equals("3")){
					           			
				            %>
                            <a class="nav-link" href="manageAcaMem.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-check"></i></div>
                              	학원회원 승인
                            </a>
                            
                            <a class="nav-link" href="addAca.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-plus-square"></i></div>
                              	학원정보 등록
                            </a>
                            <%
									}
								}
                            %>
                            <a class="nav-link" href="logout.ec">
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
					<h1 class="mt-4">학원관리</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">학원에 대한 정보를 수정할 수 있습니다.</li>
					</ol>
					<div class="col-md-12">
						<div class="card mb-2">
							<div class="card-header">
								<i class="fas fa-table mr-1" ></i>학원정보
							</div>
							<div class="card-body">
								<%-- ----------- 카트바디 ------------- --%>
								<%
									Object obj = null;
									obj = request.getAttribute("resultStr");
									String str = (String)obj;
									if(str != null && str != "null"){
										out.println("<script>\n");
										out.println("alert('" + str + "');");
										out.println("location.href='manageAca.ec'");
										out.println("</script>\n");
									}
									
								
								
								
									Object objlist1 = request.getAttribute("academylist"); 
									Object objlist2 = request.getAttribute("subjectlist"); 
									Object objlist3 = request.getAttribute("conlist");
									
									ArrayList academylist = (ArrayList)objlist1;
									ArrayList subjectlist = (ArrayList)objlist2;
									ArrayList conlist = (ArrayList)objlist3;
									
									int academynCnt = academylist.size();
									int subjectnCnt = subjectlist.size();
									int connCnt = conlist.size();
									
								%>
								
<div id="all"><%-- 전체 div --%>

	<section id="content"> <%-- 컨텐츠(본문) div --%>
	<%
		for(int i=0; i<academynCnt; i++){
			AcademyVO avo = (AcademyVO)academylist.get(i);
			
			if(academynCnt>0){
				String address = avo.getAaddr1() + " " + avo.getAaddr2();
	%>
		<div class="container-fluid"> <%-- top(윗부분) div --%>
			<h4 align="center" style="margin-top:30px">업데이트 날짜 : <%= avo.getAupdatedate()%></h4>
			<div class="row" style="margin-top:50px">
				<div class="col-md-4" align="right">
					<input type="hidden" id="ano" name="ano" value="<%=avo.getAno() %>"/>
					<input type="hidden" id="academy_ano" name="academy_ano" value="<%=avo.getAcademy_ano() %>"/>
					<input type="hidden" id="member_mno" name="member_mno" />
					<img src="/EduCatch/assets/img/academyLogo/<%= avo.getAlogo() %>" border=0 width="200" height="200" />
				</div>
				<div class="col-md-8" style="margin-top:30px">
					<h3 style="font-weight:bold"><%=avo.getAname() %></h3> 
					<h5><img src="/EduCatch/assets/img/Icon_location.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;<%=address %> </h5>
					<h5><img src="/EduCatch/assets/img/Icon_call.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;<%=avo.getAtel() %> </h5>
				</div>
			</div>
			<div style="margin-right:30px">
			</div>
		</div>
	
		
	<hr id="hhr">


		
	<%-- 탭 본문내용1 div --%>
	<div class="section">
	    <section id="section-1">
	        <h1 style="color:black">학원 정보</h1>
	        <div class="row" style="color:black">
									<div class="col-md-12">
										 <a id="modal-749483" href="#modal-container-749483" role="button" class="btn btn-success" data-toggle="modal"><i class="fas fa-edit"></i> 학원정보수정</a>
									
										<div class="modal fade" id="modal-container-749483" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="myModalLabel">
															학원 정보 수정
														</h5> 
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="academyForm" id="academyForm">
														<table class="table table-condensed">
														   	 <tr>
														        <td>학원명</td>
														        <td><input type="text" class="form-control" id="aname" name="aname" value="<%=avo.getAname() %>"></td>
														     </tr>
														     <tr>
														        <td>연락처</td>
														        <td><input type="text" class="form-control" id="atel" name="atel" value="<%=avo.getAtel() %>"></td>
														     </tr>
														     <tr>
														        <td>우편번호</td>
														        <td>
															        <div class="row">
																	<div class="col-md-8">
																			<input type="text" class="form-control" id="aaddrno" name="aaddrno" value="<%=avo.getAaddrno() %>" readonly />
																	</div>
																	<div class="col-md-4">
																		<a href="javascript:addrCheck();" class="btn btn-primary">찾기</a>
																	</div>
																</div>
																</td>
														     </tr>
														     <tr>
														        <td>주소</td>
														        <td><input type="text" class="form-control" id="aaddr1" name="aaddr1" value="<%=avo.getAaddr1() %>" readonly></td>
														     </tr>
														     <tr>
														        <td>상세주소</td>
														        <td><input type="text" class="form-control" id="aaddr2" name="aaddr2" value="<%=avo.getAaddr2() %>"></td>
														        	<input type="hidden" name="axpoint" id="axpoint" value="<%=avo.getAxpoint() %>">
																	<input type="hidden" name="aypoint" id="aypoint" value="<%=avo.getAypoint() %>">
														     </tr>
														     <tr>
														        <td>로고이미지</td>
														        <td>
															        <div class="row">
																		<div class="col-md-8">
																			<input type="text" class="form-control" id="alogo" name="alogo" readonly>
																		</div>
																		<div class="col-md-4">
																			<label for="ex_filename" class="btn btn-primary">찾기</label>
																			<input type="file" id="ex_filename" name="file" class="upload-hidden">
																		</div>
																	</div>
																</td>
														     </tr>
														</table>
														<input type="hidden" class="form-control" id="ano" name="ano" value="<%=avo.getAno()%>">
													</form>
													</div>
													<div class="modal-footer">
														 
														<button type="button" class="btn btn-primary" id="updateAcademy">
															수정
														</button> 
														<button type="button" class="btn btn-secondary" data-dismiss="modal">
															취소
														</button>
													</div>
												</div>
												
											</div>
										
										</div>
								
									</div>
								</div><!--모달 end-->
								<br><br>
	        <div class="container">
				  <table class="table table-condensed">
				    <tr>
				        <td><img src="/EduCatch/assets/img/Icon_academy.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;학원명</td>
				        <td><%=avo.getAname() %></td>
				      </tr>
				      <tr>
				        <td><img src="/EduCatch/assets/img/Icon_call.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;연락처</td>
				        <td><%=avo.getAtel() %></td>
				      </tr>
				      <tr>
				        <td><img src="/EduCatch/assets/img/Icon_location.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;주소</td>
				        <td><%=address %></td>
				      </tr>
				  </table>
				</div>
	    </section>
	  
	
	<%-- 탭 본문내용2 div --%>
    <section id="section-2">
    	<hr id="hhr">
       	<h1 style="color:black">수업 정보</h1>
       	<div class="row" style="color:black">
									<div class="col-md-8">
										 <a id="modal-749484" href="#modal-container-749484" role="button" class="btn btn-primary" data-toggle="modal"><i class="fas fa-edit"></i> 과목추가</a>
										<div class="modal fade" id="modal-container-749484" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="myModalLabel">
															과목 추가
														</h5> 
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body">
													<form name="subjectForm" id="subjectForm">
														<table class="table table-condensed">
														   	 <tr>
														        <td>과목명</td>
														        <td><input type="text" class="form-control" id="sname" name="sname"></td>
														     </tr>
														     <tr>
														        <td>수강날짜</td>
														        <td><input type="text" class="form-control" id="sday" name="sday"></td>
														     </tr>
														     <tr>
														        <td>수강시간</td>
														        <td><input type="text" class="form-control" id="stime" name="stime"></td>
														     </tr>
														     <tr>
														        <td>수강금액</td>
														        <td><input type="text" class="form-control" id="sprice" name="sprice"></td>
														     </tr>
														     <tr>
														        <td>수강인원</td>
														        <td><input type="text" class="form-control" id="speople" name="speople"></td>
														     </tr>
														</table>
														<input type="hidden" class="form-control" id="sno" name="sno">
														<input type="hidden" class="form-control" id="academy_ano" name="academy_ano" value="<%=avo.getAcademy_ano()%>">
													</form>
													</div>
													<%
			}}
													%>
													<div class="modal-footer">
														 
														<button type="button" class="btn btn-primary" id="addSubject">
															추가
														</button> 
														<button type="button" class="btn btn-secondary" data-dismiss="modal">
															취소
														</button>
													</div>
												</div>
												
											</div>
										
										</div>
										</div>
										<div class="col-md-4" align="right">
											<a id="modal-749411" href="#modal-container-749411" role="button" class="btn btn-success" data-toggle="modal"><i class="fas fa-edit"></i> 과목수정</a>
											<div class="modal fade" id="modal-container-749411" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="myModalLabel">
																과목 수정
															</h5> 
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body">
														<form id="subjectUpdateForm" name="subjectUpdateForm">
															<div class="subjectdiv">
															</div>
														</form>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-primary" id="updateSubject">
																수정
															</button> 
															<button type="button" class="btn btn-secondary" data-dismiss="modal">
																취소
															</button>
														</div>
													</div>
													
												</div>
										
								
								</div><!--모달 end-->
								<a id="modal-749489" href="#modal-container-749489" role="button" class="btn btn-danger" data-toggle="modal"><i class="fas fa-eraser"></i>과목삭제</a>
										<div class="modal fade" id="modal-container-749489" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="myModalLabel">
															과목 삭제
														</h5> 
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body">
														<form id="subjectDeleteForm" name="subjectDeleteForm">
														<div class="subjectdeletediv">
														</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary" id="deleteSubject">
															삭제
														</button> 
														<button type="button" class="btn btn-secondary" data-dismiss="modal">
															취소
														</button>
													</div>
												</div>
												
											</div>
										
								
								</div><!--모달 end-->
								</div>
									
								</div><!--모달 end-->
										 
										 
    	<div class="container">
			  <table class="table table-condensed">
       			 <br><br>
				    <thead>
				      <tr>
				      	<th>     </th>
				        <th>과목명</th>
				        <th>수강날짜</th>
				        <th>수강시간</th>
				        <th>수강금액</th>
				        <th>수강인원</th>
				        <th></th>
				      </tr>
				    </thead>
			    <tbody>

<%

	for(int i=0; i<subjectnCnt; i++){
		SubjectVO svo = (SubjectVO)subjectlist.get(i);
		
		if(subjectnCnt>0){
%>
			    <tr>
			   		<td align="center">
						<input type="checkbox" name="chkInBno" 
								id="chkInBno"  value = <%=svo.getSno() %>
						 	    onclick="checkOnly(this)">
					</td>		
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
    
	<%-- 탭 본문내용3 div --%>
    <section id="section-3">
    <hr id="hhr">
         <h1 style="color:black">편의기능</h1>
          <div class="row" style="color:black">
									<div class="col-md-12">
										 <a id="modal-749487" href="#modal-container-749487" role="button" class="btn btn-success" data-toggle="modal"><i class="fas fa-edit"></i> 편의기능 수정</a>
									
										<div class="modal fade" id="modal-container-749487" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="myModalLabel">
															편의기능 수정
														</h5> 
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body">
													<form id="convenienceUpdateForm" name="convenienceUpdateForm">
															<div class="condiv">
															</div>
													</form>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary" id="updateConvenience">
															수정
														</button> 
														<button type="button" class="btn btn-secondary" data-dismiss="modal">
															취소
														</button>
													</div>
												</div>
												
											</div>
										
										</div>
								
									</div>
								</div><!--모달 end-->
			<br><br>
			<%
			for(int i=0; i<connCnt; i++){
				ConvenienceVO cvo = (ConvenienceVO)conlist.get(i);
				
				if(connCnt>0){
					
				
				String acparking = cvo.getAcparking();
				String acstore = cvo.getAcstore();
				String acbus = cvo.getAcbus();
				String acelevator = cvo.getAcelevator();
				String acstudyroom = cvo.getAcstudyroom();
				String aclounge = cvo.getAclounge();
				String aclocker = cvo.getAclocker();
				//주차장
				if(acparking.equals("Y")){
					%>
					<img title="주차장" src="/EduCatch/assets/img/convenience/parking.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//편의점
				if(acstore.equals("Y")){
					%>
					<img title="편의점" src="/EduCatch/assets/img/convenience/convenience.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//셔틀버스
				if(acbus.equals("Y")){
					%>
					<img title="셔틀버스" src="/EduCatch/assets/img/convenience/bus.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//엘레베이터
				if(acelevator.equals("Y")){
					%>
					<img title="엘레베이터" src="/EduCatch/assets/img/convenience/elevator.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//자습실
				if(acstudyroom.equals("Y")){
					%>
					<img title="자습실" src="/EduCatch/assets/img/convenience/studyroom.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//휴게실
				if(aclounge.equals("Y")){
					%>
					<img title="휴게실" src="/EduCatch/assets/img/convenience/lounge.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//사물함
				if(aclocker.equals("Y")){
					%>
					<img title="사물함" src="/EduCatch/assets/img/convenience/locker.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				}
				}
			%>
			
    
    </section>
</div>
	</section>
</div>
							
							
							
							
							
							
							
							
							
							
							
							
							
								
								
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; EduCatch 2020</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/EduCatch/assets/js/manageScripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>

</body>
</html>