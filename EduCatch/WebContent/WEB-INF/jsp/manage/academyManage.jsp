<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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

<%-- -----------CSS------------- --%>

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







</style>
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
						</a> <a class="nav-link" href="manageAcaMem.ec">
							<div class="sb-nav-link-icon">
								<i class="fas fa-user-check"></i>
							</div> 학원회원 승인
						</a> <a class="nav-link" href="addAca.ec">
							<div class="sb-nav-link-icon">
								<i class="fas fa-plus-square"></i>
							</div> 학원정보 등록
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-sign-out-alt"></i>
							</div> 로그아웃
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
								<i class="fas fa-table mr-1"></i> 학원정보
							</div>
							<div class="card-body">
								<%-- ----------- 카트바디 ------------- --%>
								<%
									//Object obj1 = request.getAttribute("avo");
									//Object obj2 = request.getAttribute("cvo");
									//Object obj3 = request.getAttribute("gvo");
									Object objlist1 = request.getAttribute("academylist"); 
									
									//AcademyVO avo = (AcademyVO)obj1;
									//ConvenienceVO cvo = (ConvenienceVO)obj2;
									//AcademyVO gvo = (AcademyVO)obj3;
									ArrayList academylist = (ArrayList)objlist1;
									
									int academynCnt = academylist.size();
									
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
					<h1 style="font-weight:bold"><%=avo.getAname() %></h1> 
					<h3><img src="/EduCatch/assets/img/Icon_location.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;<%=address %> </h3>
					<h3><img src="/EduCatch/assets/img/Icon_call.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;<%=avo.getAtel() %> </h3>
				</div>
			</div>
			<div style="margin-right:30px">
			</div>
		</div>
	
		
	<hr id="hhr">


		
	<%-- 탭 본문내용1 div --%>
	<div class="section">
	    <section id="section-1">
	        <h1 style="color:black">학원 정보</h1><br><br>
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
	    <%
			}
		}
	    %>
	
	<%-- 탭 본문내용2 div --%>
    <section id="section-2">
    	<hr id="hhr">
       	<h1 style="color:black">수업 정보</h1>
    	<div class="container">
			  <table class="table table-condensed">
       			 <br><br>
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
<%--
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
--%>		      
			    </tbody>
			  </table>
			</div>
    </section>
	<%-- 탭 본문내용3 div --%>
    <section id="section-3">
    <hr id="hhr">
         <h1 style="color:black">편의기능</h1>
	<%--
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
					<img src="/EduCatch/assets/img/convenience/parking.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
					
				}
				//편의점
				if(acstore.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/convenience.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//셔틀버스
				if(acbus.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/bus.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//엘레베이터
				if(acelevator.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/elevator.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//자습실
				if(acstudyroom.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/studyroom.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//휴게실
				if(aclounge.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/lounge.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//사물함
				if(aclocker.equals("Y")){
					%>
					<img src="/EduCatch/assets/img/convenience/locker.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
			%>
			
    --%>
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