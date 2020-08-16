<%@page import="com.kosmo.educatch.vo.ConsultVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	#contnent{
		width : 600px;
		height: 600px;
	}
	#table_head{
		border-collapse: collapse;
		background-color: #F5F5F5;
	}
	
		.btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #e5e5e5;
	    color: #555;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 1px solid #e5e5e5;
	}
		
	.btn_box_01 {
	    width: auto;
	    padding: 3px 10px;
	}
</style>
<script type="text/javascript">
	
	$(document).ready(function() {

		//삭제 버튼 눌렀을 때
		$("#deleteData").click(function(){
			
			alert("정말로 삭제하시겠습니까?");
			$("#ConsultForm").attr("action","deleteConsult.ec");
			$("#ConsultForm").attr("method","POST");
			$("#ConsultForm").submit();
			
		});
		
		
		$("#listData").click(function(){
			
			alert("listData >>>");
			$("#ConsultForm").attr("action","listConsult.ec");
			$("#ConsultForm").attr("method","POST");
			$("#ConsultForm").submit();
			
		});
		
		
	});	
	

</script>
<body>
<%

	String consultboard_cbno = "";
	Object obj=request.getAttribute("ConsultVO");
	
	if(obj !=null){

		ConsultVO cvo=(ConsultVO)obj;
%>
<p></p>
	<div class="container">
		<form id="ConsultForm" name="ConsultForm">
			<input type="hidden" id="cbno" name="cbno" value="<%= cvo.getCbno()%>"/>
			<table align="center" width="700" height="100" class="table">
			<thead id="table_head">
				<tr>
					<th><div align="center"><%= cvo.getCbsubject() %></div></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>
							<div>
								<span>
								작성자 :<%= cvo.getCbname() %>&nbsp;&nbsp;&nbsp;
								작성일자 :<%= cvo.getCinsertdate() %>&nbsp;&nbsp;&nbsp;
								</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
						<%= cvo.getCbcontent() %>
						</div>
					</td>
				</tr>
			</tbody>
			</table>
		</form>
	</div>
	<p></p>
		<jsp:include page="consultReply.jsp">
			<jsp:param name="consultboard_cbno" value="<%=consultboard_cbno %>"/>
		</jsp:include>
		<table style="margin-left: auto; margin-right: auto;" border="0">
			<tr align="center">
				<td>
					<a href="selectUpdate1.ec?cbno=<%= cvo.getCbno()%>">
					<input type="button" id="updateData" value="수정" class=" btn_light btn_box_01"/>
					</a>
				</td>
				<td>
					<input type="button" id="deleteData" value="삭제" class=" btn_light btn_box_01"/>
				</td>
				<td>
					<input type="button" id="listData" value="목록" class=" btn_light btn_box_01"/>
				</td>

			</tr>
<%
		//}
	}
%>
		</table>
		
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>