<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.EventVO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세보기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	img {
		 display: block; 
		 margin: 0px auto;
	  }
</style>
<script type="text/javascript">

$(document).ready(function() {
	console.log("이벤트_상세보기 조회");
	
	//===관리자가 수정버튼을 누르면 실행========
	$("#updateData").click(function() {
		console.log("수정버튼 누름");
		
		//수정페이지로 이동
		//$("#esubject").val();//?????
		$("#eventSelForm").attr("action","updateDisplayEvent.ec");
		$("#eventSelForm").attr("method","POST");
		$("#eventSelForm").submit();
		
	})//end of updateData
	
	
	//===관리자가 삭제버튼을 누르면 실행========
	$("#deleteData").click(function() {
		console.log("삭제버튼 누름");
		
		$("#eventSelForm").attr("action","deleteEvent.ec");
		$("#eventSelForm").attr("method","POST");
		$("#eventSelForm").submit();
		
	})//end of deleteData
	
	//===관리자가 목록버튼을 누르면 실행========
	$("#listData").click(function() {
		console.log("목록버튼 누름");
		
		$("#eventSelForm").attr("action","listEvent.ec");
		$("#eventSelForm").attr("method","POST");
		$("#eventSelForm").submit();
		
	})//end of listData
	
	
	
});//end of ready()
</script>
</head>
<body>
<%
	Object obj= request.getAttribute("EventVO");

	if(obj != null){
		EventVO evo =(EventVO)obj;

%>
	<div>
	<form id="eventSelForm" name="eventSelForm" >
		 <input type="text" name="eno" id="eno" value="<%=evo.getEno() %>" >
		<table align="center" width="700" height="100" border="1">
		 <thead>
             <tr>
                 <th><div><%=evo.getEsubject() %></div></th>
             </tr>
         </thead>
         <tbody>
         	<tr>
         		<td>
         			<div>
         				<div>
                             <span><em>작성일자 :</em><%=evo.getEinsertdate()%></span>                                                </div>
                             <span><em>수정일자 :</em><%=evo.getEupdatedate()%></span>                                                </div>
                         <div>
                         <div id ="nname1" name="nname1" align="right" >
                         	<span><em>작성자 :</em><%=evo.getEname()%></span>
                         </div>
         			</div>
         		</td>
         	</tr>
         	<tr>
         		<td>
         			<div>
         				<%=evo.getEcontent()%>
<%
							String img = evo.getEimg();
							if(img != null){
%>
         						<img src="/EduCatch/assets/img/event/<%=evo.getEimg()%>" alt="사진업음"/><br>
<%								
							}//end of if(img)
%>         				
         			</div>
         		</td>
         	</tr>
<%			
	}//end of if(obj)	
%>
			<tr>
			<td align="center">
				<input type="button" value="수정" id="updateData">
				<input type="button" value="삭제" id="deleteData">
				<input type="button" value="목록" id="listData">
				
			</td>	
			</tr>
         </tbody>
		</table>
		</form>
	</div>
</body>
</html>