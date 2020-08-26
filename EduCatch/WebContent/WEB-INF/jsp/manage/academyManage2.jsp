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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fb37ba283dc18386af651f85d45ef34&libraries=services,clusterer,drawing"></script>
<style type="text/css">

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
#all{
		border-left:1px solid #f3f3f3;
		border-right:1px solid #f3f3f3;
		background:#f3f3f3;
}

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

#linked{ 
		color: black;

}


.mb-4, .my-4 {
    margin-bottom: 0.5rem !important;
}
.list{
	margin-bottom: 0.5rem !important;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		ajaxData();
		<%
        if(mvo != null){
			if(mvo.getMauth().equals("3")){
        %>
	        $('#district').on('change',function(){
	        	ajaxGetCity($('#district').val());
	        })
	        $('#city').on('change',function(){
	        	ajaxGetAcaList();
	        })
	        $('#academy').on('change',function(){
	        	$('#acano').val($('#academy').val());
	        	ajaxData();
	        })
	        
	        ajaxGetCity($('#district').val());
			function ajaxGetCity(param){
				console.log("ajaxGetCity param(setDistrict) >>> "+param);
				urls = "getCity.ec"; //controller 지역 소분류
				datas = {"district" : param}; //param = 서울
				$.ajax({
					url : urls,
					data : datas
				}).done(function(resParam){
					console.log("ajaxGetCity resParam >>> "+resParam);
					var st = "";
					for(i in resParam.cityList){
						var city = resParam.cityList[i].city; //강남 강북
						st += "<option value='"+city+"'>"+city+"</option>\n";
					}
					$('#city').html(st);
					console.log("ajaxGetCity end >>>");
					ajaxGetAcaList();
				}).fail(function(resParam){
					alert("에러");
				});
			}
			
			function ajaxGetAcaList(){
				var district = $('#district').val();
				var city = $('#city').val();
				$.ajax({
					url : "getAcaListManage.ec",
					data : {"district" : district,
       						"city" : city},
     			dataType : "json"
				}).done(function(result){
					var st ="";
					console.log("success");
					for(i in result.acaList){
						var name = result.acaList[i].aname;
						var ano  = result.acaList[i].ano;
						if(i==0){
							$('#acano').val(ano);
						}
						st += "<option value='"+ano+"'>" +name+"</option>\n"
					}
					$('#academy').html(st);
					ajaxData();
				}).fail(function(result){
					console.log("fail");
				})
			}
		<%
				}
	        }
		%>
	});
	function ajaxData(){
		var ano = $('#acano').val();
		$.ajax({
			url : "acmb2.ec",
			data : {
				"ano" : ano,
				},
			dataType : "json"
		}).done(function(resultParam){
			$('.card-body').html(resultParam);
		}).fail(function(resultParam){
			if(resultParam.readyState == 4){
				$('.card-body').html(resultParam.responseText);
			}else{
				alert("추가시 DB연결에 문제가 발생하였습니다.");	
			}
		}); 
		
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
					<%
						if(mvo != null){
							if(mvo.getMauth().equals("3")){
			           			
		            %>
					<div class="col-md-12 list">
					<select name="district" id="district">
						<option value="서울" selected>서울</option>
						<option value="경기도">경기도</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종특별자치시">세종특별자치시</option>
						<option value="제주특별자치도">제주특별자치도</option>
					</select>
					<select name="city" id="city">
					</select>
					<select name="academy" id="academy">
					</select>
					</div>
					<div></div>
					<% 
							}
						}
					%>
					<input type="hidden" id="acano" value="<%=mvo.getAcademy_ano() %>">
					<div class="col-md-12">
						<div class="card mb-2">
							<div class="card-header">
								<i class="fas fa-table mr-1"></i> 학원정보
							</div>
							<div class="card-body">
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