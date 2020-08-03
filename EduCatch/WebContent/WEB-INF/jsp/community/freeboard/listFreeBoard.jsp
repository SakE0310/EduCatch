<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kosmo.educatch.vo.FreeVO"  %>
<%@ page import="java.util.List"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function insertPopup(){
		console.log("insertPopup()들어옴");
		$("#fbno").val("");
		//window.open("","pop","width=480, height=250");
		$("#freeBoardForm").attr("action","selectfreeboardI.ec");
		//$("#freeBoardForm").attr("target","pop");
		$("#freeBoardForm").submit();
	}
</script>
</head>
<body>
	<jsp:include page="../../../../top.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
<form id="freeBoardForm" name="freeBoardForm" method="get">
		<input type="hidden" name="fbno" id="fbno"/>
	</form>
	<div>
		<table border="0">
			<tr><th><h4>자유게시판 목록</h4></th></tr>
		</table>
	</div>	
	<div>
		<table border="1">
			<colgroup>
				<col width="120px"/>
				<col width="220px"/>
				<col width="120px"/>
				<col width="300px"/>
				<col width="110px"/>
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>내용</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
			<% 
			Object obj = request.getAttribute("freeboardlist"); 
			if(obj!=null){
				List<FreeVO> list = (List<FreeVO>)obj;
				for(int i=0; i<list.size(); i++){
					FreeVO freevo = (FreeVO)list.get(i);
			%>
					<tr>			
						<td align="center"><%=freevo.getFbno() %></td>					
						<td align="center"><a href="selectfreeboardUD.ec?fbno=<%=freevo.getFbno() %>" style="color:black;"><%=freevo.getFbsubject() %></a></td>
						<td align="center"><%=freevo.getFbname() %></td>
						<td align="center"><%=freevo.getFbcontent() %></td>
						<td align="center"><%=freevo.getFbimg() %></td>
					</tr>
					<%
				}
					%>
				<tr>
					<td colspan="4" align="center">
					처리할 버튼을 선택하세요</td>
					<td align="center">
					<input type="button" onclick="insertPopup()"
					value="[글쓰기]"/></td>
				</tr>
				<%
			}else{
				%>
					<tr>
						<td colspan="5" align="center">
						등록된 학과 정보가 존재하지 않습니다 </td>
					</tr>				
				<%
			}
				%>
			</tbody>
		</table>
	</div>
	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>