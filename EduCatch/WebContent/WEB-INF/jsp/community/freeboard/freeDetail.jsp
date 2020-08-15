<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kosmo.educatch.vo.FreeVO"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보조회</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
function updateClick(){
	console.log("updateClick함수 진입");
	alert("수정");
	$("#edit").attr("action","selectfreeboardUD.ec");
	$("#edit").attr("method","POST");
	$("#edit").submit();
}
function deleteClick(){
	console.log("deleteClick함수 진입");
	alert("삭제");
	$("#edit").attr("action","selectfreeboardUD.ec");
	$("#edit").attr("method","POST");
	$("#edit").submit();
}
function listClick(){
	console.log("listClick함수 진입");
	alert("목록");
	$("#edit").attr("action","freeboardlist.ec");
	$("#edit").attr("method","POST");
	$("#edit").submit();
}
</script>
</head>
<body>
	<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
	<!-- action/document/location -->
	<!-- enctype="multipart/form-data" -->
	<form id="edit" name="edit">
		<table style="margin-left: auto; margin-right: auto;" border="1" >
		<% 
			String freeboard_fbno = "";
			
			Object obj = request.getAttribute("freevo"); 
			if(obj!=null){
				FreeVO freevo = (FreeVO)obj;
				freeboard_fbno = freevo.getFbno();
			%>
			<tr>
				<td style="width: 100px">글번호</td>
				<td><input type="text" id="fbno" name="fbno"
					style="width: 98%"/ value=<%=freevo.getFbno() %> readonly /></td>
			</tr>
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="fbsubject" name="fbsubject"
					style="width: 98%" value=<%=freevo.getFbsubject() %> readonly /></td>
			</tr>
			<tr>
				<td style="width: 100px">작성자</td>
				<td><input type="text" id="fbname" name="fbname"
					style="width: 98%" value=<%=freevo.getFbname() %> readonly /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><div><%=freevo.getFbcontent() %></div>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					 <div id ="rbimg" name="rbimg" align="center">
	         				<img src="/EduCatch/assets/img/freeImg/<%= freevo.getFbimg() %>" border=() width="100" height="100"/><br>
	         		</div>
				</td>
			</tr>
		</table>
		<table style="margin-left: auto; margin-right: auto;" border="0">
			<tr align="center">
				<td colspan="3" align="right">
				 <input type="button" id="updateclick" value="수정" onclick="updateClick()" />
				 <input type="button" id="deleteclick" value="삭제" onclick="deleteClick()" />
				 <input type="button" id="listclick" value="목록" onclick="listClick()" />
				</td>
			</tr>
			<!-- ========== 댓글 =========================================== -->
				<jsp:include page="reply.jsp">
					<jsp:param name="freeboard_fbno" value="<%=freeboard_fbno  %>"/>
				</jsp:include>
		
			<%
			} 
			%>
		</table>
		
	</form>
	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>