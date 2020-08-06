<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.NoticeVO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	#contnent{
		width : 600px;
		height: 600px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
			console.log("상세보기 조회");
			
			//===관리자가 수정버튼을 누르면 실행========
			$("#updateData").click(function() {
				console.log("수정버튼 누름");
				
				$("#nsubject").val();
				$("#noticeSelForm").attr("action","updateDisplayNotice.ec");
				$("#noticeSelForm").attr("method","POST");
				$("#noticeSelForm").submit();
				
			})//end of updateData
			
			
			//===관리자가 삭제버튼을 누르면 실행========
			$("#deleteData").click(function() {
				console.log("삭제버튼 누름");
				
				$("#noticeSelForm").attr("action","deleteNotice.ec");
				$("#noticeSelForm").attr("method","POST");
				$("#noticeSelForm").submit();
				
			})//end of deleteData
			
			//===관리자가 취소버튼을 누르면 실행========
			$("#listData").click(function() {
				console.log("취소버튼 누름");
				
				$("#noticeSelForm").attr("action","listNotice.ec");
				$("#noticeSelForm").attr("method","POST");
				$("#noticeSelForm").submit();
				
			})//end of listData
			
			
			
	});//end of ready()
	
</script>
</head>
<body>
<%
	Object obj= request.getAttribute("NoticeVO");

	if(obj != null){
		NoticeVO nvo =(NoticeVO)obj;

%>
	<div>
	<form id="noticeSelForm" name="noticeSelForm" >
		 <input type="text" name="nno" id="nno" value="<%=nvo.getNno() %>" >
		 <input type="text" name="nname" id="nname" value="<%=nvo.getNname() %>" >
		 <input type="text" name="nupdatedate" id="nupdatedate" value="<%=nvo.getNupdatedate()%>" >
		<table align="center" width="700" height="100" border="1">
		 <thead>
             <tr>
                 <th><div><%=nvo.getNsubject() %></div></th>
             </tr>
         </thead>
         <tbody>
         	<tr>
         		<td>
         			<div>
         				<div>
                             <span><em>작성일자 :</em><%=nvo.getNinsertdate()%></span>                                                </div>
                             <span><em>수정일자 :</em><%=nvo.getNupdatedate()%></span>                                                </div>
                         <div>
                         <div id ="nname1" name="nname1" align="right" >
                         	<span><em>작성자 :</em><%=nvo.getNupdatedate()%></span>
                         </div>
         			</div>
         		</td>
         	</tr>
         	<tr>
         		<td>
         			<div align="center">
         				<%=nvo.getNcontent()%>
         				<img src="/EduCatch/assets/img/notice/<%=nvo.getNimg()%>" alt="사진업음"/><br>
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
				<input type="button" value="취소" id="listData">
				
			</td>	
			</tr>
         </tbody>
		</table>
		</form>
	</div>
</body>
</html>










