<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="com.kosmo.educatch.vo.EventVO" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#eno_color{
		color: black;
	}
</style>

<script type="text/javascript">
 $(document).ready(function() {
	
	//===관리자가 등록버튼을 누르면 실행========
	$("#insertData").click(function() {
		console.log("등록버튼 누름");
		
		$("#eventForm").attr("action","insertDisplayEvent.ec");
		$("#eventForm").attr("method","POST");
		$("#eventForm").submit();
		
	})//end of insertData
	
	  
  });//end of ready()
</script>
</head>
<body>
<%
	Object obj= request.getAttribute("eventList");
	
	if(obj != null){
		ArrayList list = (ArrayList)obj;
		int nCnt = list.size();
%>
	<form id="eventForm" name="eventForm">
		<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>이벤트 게시판 목록</h1></td>
			</tr>
			</table>
		</div>
		<div>
			<table border="1" align="center">
			<colgroup>
				<col width="120px"/>
				<col width="600px"/>
				<col width="120px"/>
				<col width="120px"/>
			</colgroup>
			<thead>
				<td align="center">글번호</td>
				<td align="center">제목</td>
				<td align="center">작성자</td>
				<td align="center">등록일자</td>
			</thead>
			<tbody>			
<%		
		if(list !=null && nCnt>0){

			for(int i=0; i<nCnt; i++){
				EventVO evo = (EventVO)list.get(i);
%>
				<tr align="center">
					<td>
					<a href="selectEvent.ec?eno=<%=evo.getEno() %>" id="eno_color"><%=evo.getEno() %></a>
					</td>
					<td><%=evo.getEsubject() %></td>
					<td><%=evo.getEname() %></td>
					<td><%=evo.getEinsertdate()%></td>
				</tr>	
<%				
				}//end of for
			
			}else{
%>
				<tr>
					<td colspan ="4" align="center">
						등록된 글이 없습니다.
					</td>
				</tr>
<%				
			}//end of if(list)
		}//end of if(obj)
%>
				<tr>
				<td colspan="4" align="right">
				<input type="button" value="등록" id="insertData">
				</td>
			</tr>
			</tbody>	
			</table>
		</div>
	</form>

<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>