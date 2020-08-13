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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	<div>
		<form id="ConsultForm" name="ConsultForm">
		 
			<input type="hidden" id="cbno" name="cbno" value="<%= cvo.getCbno()%>"/>
		
			<table style="margin-left: auto; margin-right: auto;" border="1">
			<tbody>
				<tr>
					<th><span class="required">*</span>제목</th>
					<td><div><%= cvo.getCbsubject() %></div></td>
				</tr>
				<tr>
					<th><span class="required">*</span>작성자</th>
					<td><div><%= cvo.getCbname() %></div></td>
				</tr>
				<tr>
					<th><span class="required">*</span>내용</th>
					<td><div><%= cvo.getCbcontent() %></div></td>
				</tr>
				<tr>
					<th><span class="required">*</span>날짜</th>
					<td><div><%= cvo.getCinsertdate() %></div></td>
				</tr>	
			</tbody>
			</table>
		</form>
	</div>
	<p></p>
		<table style="margin-left: auto; margin-right: auto;" border="0">
			<tr align="center">
				<td>
					<a href="selectUpdate1.ec?cbno=<%= cvo.getCbno()%>">
					<input type="button" id="updateData" value="수정" />
					</a>
				</td>
				<td>
					<input type="button" id="deleteData" value="삭제" />
				</td>
				<td>
					<input type="button" id="listData" value="목록" />
				</td>

			</tr>
<%
		//}
	}
%>
		</table>
		
		<jsp:include page="consultReply.jsp">
			<jsp:param name="consultboard_cbno" value="<%=consultboard_cbno %>"/>
		</jsp:include>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>