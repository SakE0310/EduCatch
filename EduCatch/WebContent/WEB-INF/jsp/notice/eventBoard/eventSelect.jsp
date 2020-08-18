<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.EventVO" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>이벤트 상세보기</title>

<!-- 테이블 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	  img {
		 display: block; 
		 margin: 0px auto;
	  }
	  .container box_1170 {
		margin : 0 auto;
		padding : 50px;
	  }
	  .btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #e5e5e5;
	    color: #555;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 1px solid #e5e5e5;
	    height: 40px;
	    font-size: 15px;
		}
	.btn_box_01 {
	    width: auto;
	    padding: 3px 10px;
	    }
	.table {
		position : relative;
		top : 50px;
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
<main align ="center">
	<div class="container box_1170"  align ="center">
		<div class="section-top-border" align ="center">
			<div class="row" align ="center">
				<form id="eventSelForm" name="eventSelForm" >
				<input type="hidden" name="eno" id="eno" value="<%=evo.getEno() %>">
					<table class="table" align ="center">
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
								<input type="button" value="수정" id="updateData" class=" btn_light btn_box_01">
								<input type="button" value="삭제" id="deleteData" class=" btn_light btn_box_01">
								<input type="button" value="목록" id="listData" class=" btn_light btn_box_01">
							</td>	
						</tr>
		         </tbody>
				</table>
				</form>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>