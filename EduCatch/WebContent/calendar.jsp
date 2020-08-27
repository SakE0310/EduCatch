<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/timepicker@1.13.14/jquery.timepicker.min.css">
<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/timepicker@1.13.14/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
	<div id="calendar"></div>
	<div class="modal" id="applyRes" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">상담예약하기</h4>
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
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">현재</span>
			  </div>
			  <input type="text" class="form-control countNow"aria-describedby="basic-addon1" readonly>
			</div>
			<hr />
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" id="btnCancel" type="button" data-dismiss="modal">확인</button>
        </div>
      </div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			drawCalendar();
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
						if(!info.dayEl.classList.contains('fc-day-past')&&!info.dayEl.classList.contains('fc-day-today')){
							showModal(info.dateStr,"update",time, people, ttno);							
						}
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
			var ano = "A00001";
			$.ajax({
	   			url : "selectReser.ec",
	   			data : {"date" : date,
	   					"ano" : ano},
				dataType : "json"
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
			$('.fc-prev-button, .fc-next-button').on('click',function(){
				year = calendar.getDate().getFullYear();
				month = calendar.getDate().getMonth()+1;
				if(month/10 < 1){
					month = "0"+month;
				}
				date = year +"-"+month
				$.ajax({
	       			url : "selectReser.ec",
	       			data : {"date" : date, "ano" : ano}
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
		function ajaxSearchPeoplie(date, type, time, people, ttno){
			var ano = "A00001";
			$.ajax({
	   			url : "selectMemList.ec",
	   			data : {"ttno" : ttno,
	   					"ano" : ano}
	   		}).done(function(resultParam){
	   			if(resultParam.list.length >0 ){
	   				var len = resultParam.list.length;
	   			}else{
	   				$('.countNow').val("0");
	   			}	
				$('#timepicker1').timepicker('setTime',new Date(date+" "+time));
				$('#applyRes').modal();
	   		}).fail(function(resultParam){
	   			alert("조회시 DB연결에 문제가 발생하였습니다.");
				$('#timepicker1').timepicker('setTime',new Date(date+" "+time));
				$('#applyRes').modal();
	   		});
		}
		function showModal(date, type, time, people, ttno){
			$('.date').val(date);
			$('.ttno').val(ttno);
			$('.timepicker').timepicker({ 'scrollDefault': 'now' , 'timeFormat': 'H:i'});
			$('.count').val(people);
			ajaxSearchPeoplie(date, type, time, people, ttno);
		}
	</script>
</body>
</html>