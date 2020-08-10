<%@page import="com.kosmo.educatch.vo.FreeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object obj=request.getAttribute("result");
	Object obj1=request.getAttribute("isSuccess");
	Object obj2=request.getAttribute("freevo");
	
	

	if(obj !=null){
		String result=(String)obj;
		String isSuccess=(String)obj1;
		
		FreeVO fbvo=(FreeVO)obj2;
		
		if(result == "update"){
%>
	<script>
		alert("수정완료");
		location.href="selectfreeboardDetail.ec?fbno=<%= fbvo.getFbno() %>";
	</script>
<% 
		}else if(result == "delete"){
			if(isSuccess=="true"){
%>
			<script>
				alert("삭제완료");
				location.href="freeboardlist.ec";
			</script>
<%
			}else{
%>
			<script>
				alert("삭제실패");
				location.href="freeboardlist.ec";
			</script>
<%
			}
		}
	}
%>
</body>
</html>