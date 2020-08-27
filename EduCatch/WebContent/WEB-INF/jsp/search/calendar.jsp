<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
</head>
<body>
	<div class="calendar"></div>
	
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
	</script>
</body>
</html>