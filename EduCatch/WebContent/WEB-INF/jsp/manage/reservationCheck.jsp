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
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/timepicker@1.13.14/jquery.timepicker.min.css">
<style type="text/css">
.sb-nav-link-icon {
	height: 20px;
	width: 20px;
}
.fc-daygrid-day :hover{
	background-color:#fff4e3;
}
.fc-day-sun { 
	color:red;  
 }
 .fc-day-sat { 
	color:blue;  
 }
.fc-day-other .fc-daygrid-day-number { display:none;}
</style>
</head>
<body class="sb-nav-fixed">
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
					<h1 class="mt-4">상담예약 확인</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">상담 신청한 회원을 확인 할 수 있습니다.</li>
					</ol>
					<div class="col-md-12">
						<div class="card mb-1">
							<div class="card-header">
								<i class="fas fa-table mr-1"></i> 학원정보
							</div>
							<div class="card-body">
								<div id="calendar"></div>
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
	<div class="modal fade" id="updateModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">예약정보 수정/삭제</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        	<div class="input-group mb-3">
        	<input type="hidden" name="ttno" class="ttno" />
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">날짜</span>
			  </div>
			  <input type="text" id="date" class="form-control date"aria-describedby="basic-addon1" readonly>
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">시간</span>
			  </div>
			  <input type="text" class="form-control timepicker" id="timepicker" aria-describedby="basic-addon1">
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">인원</span>
			  </div>
			  <input type="text" class="form-control count"aria-describedby="basic-addon1" id="cnt">
			</div>
			<hr />
			<div>
				<div id="people">
					<table class="table table-striped chkPeople">
					  <thead>
					    <tr>
					      <th scope="col">순번</th>
					      <th scope="col">이름</th>
					      <th scope="col">전화번호</th>
					    </tr>
					  </thead>
					  <tbody>
					  </tbody>
					 </table>
				</div>
			</div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" id="btnCancel" type="button" data-dismiss="modal">취소</button>
          <button class="btn btn-danger" id="btnDelete" type="button">삭제</button>
          <button class="btn btn-success" id="btnUpdate" type="button">수정</button>
        </div>
      </div>
		</div>
	</div>
	<div class="modal fade" id="selectModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">예약정보 확인하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="input-group mb-3">
          	<input type="hidden" name="ttno" class="ttno" />
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">날짜</span>
			  </div>
			  <input type="text" class="form-control date"aria-describedby="basic-addon1" readonly>
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">시간</span>
			  </div>
			  <input type="text" class="form-control timepicker" id="timepicker1" aria-describedby="basic-addon1" readonly>
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">인원</span>
			  </div>
			  <input type="text" class="form-control count"aria-describedby="basic-addon1" readonly>
			</div>
			<hr />
			<div>
				<h5>신청자</h5>
				<div id="people">
					<table class="table table-striped chkPeople" id="chkPeople">
					  <thead>
					    <tr>
					      <th scope="col">순번</th>
					      <th scope="col">이름</th>
					      <th scope="col">전화번호</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<tr>
					  		<td>1</td>
					  		<td>2</td>
					  		<td>3</td>
					  	</tr>
					  </tbody>
					 </table>
				</div>
			</div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" id="btnCancel" type="button" data-dismiss="modal">확인</button>
        </div>
      </div>
		</div>
	</div>
	<div class="modal fade" id="insertModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">예약정보 등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
       		<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">날짜</span>
			  </div>
			  <input type="text" name="date3" id="date3" class="form-control date"aria-describedby="basic-addon1" readonly>
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">시간</span>
			  </div>
			  <input type="text" class="form-control timepicker" id="timepicker3" aria-describedby="basic-addon1">
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">인원</span>
			  </div>
			  <input type="text" class="form-control count"aria-describedby="basic-addon1" name="cnt3" id="cnt3">
			</div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" id="btnCancel" type="button" data-dismiss="modal">취소</button>
          <button class="btn btn-primary" id="btnSubmit" type="button">등록</button>
        </div>
      </div>
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
<script src="https://cdn.jsdelivr.net/npm/timepicker@1.13.14/jquery.timepicker.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			drawCalendar();
			setSize();
			$('#btnSubmit').on('click',function(){
				ajaxInsertTime();
			});
			$('#btnUpdate').on('click',function(){
				ajaxUpdateTime();
			});
			$('#btnDelete').on('click',function(){
				ajaxDeleteTime();
			});
		});
		
		function drawCalendar(){
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				locale : 'ko',
				height : 'auto',
				dateClick : function(info) {
					var day = info.dateStr.split('-')[2];
					var data = calendar.getEventById(day);
					if(data){
						var time = data.start.getHours() +":"+data.start.getMinutes();
						var people = data._def.extendedProps.people;
						var ttno = data._def.extendedProps.ttno;
						if(!info.dayEl.classList.contains('fc-day-past')){
							showModal(info.dateStr,"update",time, people, ttno);							
						}else{
							showModal(info.dateStr,"select",time, people, ttno);							
						}
					}else if(!info.dayEl.classList.contains('fc-day-other')&&!info.dayEl.classList.contains('fc-day-today')){
						showModal(info.dateStr,"insert");
					}else if(info.dayEl.classList.contains('fc-day-today')){
						alert("당일에 예약일정을 설정 할 수 없습니다.");
					}
				}
			});
			var year = calendar.getDate().getFullYear();
			var month = calendar.getDate().getMonth()+1;
			if(month/10 < 1){
				month = "0"+month;
			}
			
			var date = year +"-"+month
			
			calendar.removeAllEvents();
			$.ajax({
       			url : "selectReser.ec",
       			data : {"date" : date}
       		}).done(function(resultParam){
       			for(result in resultParam.data){
       				var ttdate = resultParam.data[result].ttdate;
       				var tttime = resultParam.data[result].tttime;
       				var people = resultParam.data[result].ttpeople;
       				var ttno = resultParam.data[result].ttno;
       				var ttid = resultParam.data[result].ttdate.split('-')[2];
       				calendar.addEvent({
       					'id' : ttid,
       					'title' : '상담',
       					'start' : ttdate+" "+tttime,
       					'people' : people,
       					'ttno' : ttno
       				});
       			}
       			
       		}).fail(function(resultParam){
       			alert("초기화에 문제가 발생하였습니다.");
       			
       		});
			calendar.render();
			setSize();
			$('.fc-prev-button, .fc-next-button').on('click',function(){
				year = calendar.getDate().getFullYear();
				month = calendar.getDate().getMonth()+1;
				if(month/10 < 1){
					month = "0"+month;
				}
				date = year +"-"+month
				$.ajax({
	       			url : "selectReser.ec",
	       			data : {"date" : date}
	       		}).done(function(resultParam){
	       			calendar.removeAllEvents();
	       			for(result in resultParam.data){
	       				var ttdate = resultParam.data[result].ttdate;
	       				var tttime = resultParam.data[result].tttime;
	       				var people = resultParam.data[result].ttpeople;
	       				var ttno = resultParam.data[result].ttno;
	       				var ttid = resultParam.data[result].ttdate.split('-')[2];
	       				calendar.addEvent({
	       					'id' : ttid,
	       					'title' : '상담',
	       					'start' : ttdate+" "+tttime,
	       					'people' : people,
	       					'ttno' : ttno
	       				});
	       			}
	       			
	       		}).fail(function(resultParam){
	       			alert("초기화에 문제가 발생하였습니다.");
	       			
	       		});
			});
		}
		
		function setSize(){
			var windowWidth1 = $(window).width();
			if(windowWidth1 < 768) {
				$('.fc-event-time').hide();
				$('.fc-event-title').hide();
			} else {
				$('.fc-event-time').show();
				$('.fc-event-title').show();
			}
			$(window).resize(function() {
				var windowWidth = $(window).width();
				if(windowWidth < 768) {
					$('.fc-event-time').hide();
					$('.fc-event-title').hide();
				} else {
					$('.fc-event-time').show();
					$('.fc-event-title').show();
				}
			});
		}
		
		function showModal(date, type, time, people, ttno){
			$('.date').val(date);
			$('.ttno').val(ttno);
			$('.timepicker').timepicker({ 'scrollDefault': 'now' , 'timeFormat': 'H:i'});
			$('.count').val(people);
			if(type != "insert"){
			ajaxSearchPeoplie(date, type, time, people, ttno);
			}else{
				$('#insertModal').modal();
			}
		};
		
		function ajaxSearchPeoplie(date, type, time, people, ttno){
			$.ajax({
       			url : "selectMemList.ec",
       			data : {"ttno" : ttno}
       		}).done(function(resultParam){
       			$('.chkPeople > tbody').remove();
       			$('.chkPeople').append('<tbody></tbody>');
       			if(resultParam.list.length >0 ){
       				for(i in resultParam.list){
       					$('.chkPeople > tbody').append('<tr><td>'+resultParam.list[i].mno+'</td><td>'+resultParam.list[i].mname+'</td><td>'+resultParam.list[i].mtel+'</td></tr>');
           			}
       			}else{
       				$('.chkPeople > tbody').append('<tr><td colspan=3>신청인원이 없습니다. </td></tr>');
       			}
       			if(type == "update"){
    				$('#timepicker').timepicker('setTime',new Date(date+" "+time));
    				$('#updateModal').modal();
    			}else{
    				$('#timepicker1').timepicker('setTime',new Date(date+" "+time));
    				$('#selectModal').modal();	
    			}
       		}).fail(function(resultParam){
       			alert("조회시 DB연결에 문제가 발생하였습니다.");
       			$('.chkPeople > tbody').remove();
       			$('.chkPeople').append('<tbody></tbody>');
       			$('.chkPeople > tbody').append('<tr><td colspan=3>신청인원이 없습니다. </td></tr>');
       			if(type == "update"){
    				$('#timepicker').timepicker('setTime',new Date(date+" "+time));
    				$('#updateModal').modal();
    			}else{
    				$('#timepicker1').timepicker('setTime',new Date(date+" "+time));
    				$('#selectModal').modal();	
    			}
       		});
		}
		
		function ajaxInsertTime(){
			var date = $('#date3').val();
			var time = $('#timepicker3').val();
			var people = $('#cnt3').val();
			$.ajax({
       			url : "insertTimeTable.ec",
       			type : "post",
       			data : {"date" : date,
       					"time" : time,
       					"people" : people},
     			dataType : "json"
       		}).done(function(resultParam){
       			$('#insertModal').modal("hide");
       			if(resultParam.result=="success"){
       				drawCalendar();
       			}else{
       				alert('정상적으로 데이터가 등록되지 않았습니다.');
       			}
       		}).fail(function(resultParam){
       			alert("추가시 DB연결에 문제가 발생하였습니다.");
       		});
		}
		
		function ajaxUpdateTime(){
			var ttno = $('.ttno').val();
			var time = $('#timepicker').val();
			var people = $('#cnt').val();
			$.ajax({
       			url : "updateTimeTable.ec",
       			type : "post",
       			data : {"ttno" : ttno,
       					"time" : time,
       					"people" : people},
     			dataType : "json"
       		}).done(function(resultParam){
       			$('#updateModal').modal("hide");
       			if(resultParam.result=="success"){
       				drawCalendar();
       			}else{
       				alert('정상적으로 데이터가 수정되지 않았습니다.');
       			}
       		}).fail(function(resultParam){
       			alert("추가시 DB연결에 문제가 발생하였습니다.");
       		});
		}
		
		function ajaxDeleteTime(){
			var ttno = $('.ttno').val();
			$.ajax({
       			url : "deleteTimeTable.ec",
       			type : "post",
       			data : {"ttno" : ttno},
     			dataType : "json"
       		}).done(function(resultParam){
       			$('#updateModal').modal("hide");
       			if(resultParam.result=="success"){
       				drawCalendar();
       			}else{
       				alert('정상적으로 데이터가 수정되지 않았습니다.');
       			}
       		}).fail(function(resultParam){
       			alert("추가시 DB연결에 문제가 발생하였습니다.");
       		});
		}
	</script>
</body>
</html>