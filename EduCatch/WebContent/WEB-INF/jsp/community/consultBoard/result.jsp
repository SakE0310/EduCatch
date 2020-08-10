<%@page import="com.kosmo.educatch.vo.ConsultVO"%>
<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
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
	Object obj2=request.getAttribute("ConsultVOO");
	
	

	if(obj !=null){
		String result=(String)obj;
		String isSuccess=(String)obj1;
		
		ConsultVO cvo=(ConsultVO)obj2;
		
		if(result == "update"){
%>
	<script>
		alert("수정완료");
		location.href="selectConsult.ec?cbno=<%= cvo.getCbno()%>";
	</script>
<% 
		}else if(result == "delete"){
			if(isSuccess=="true"){
%>
			<script>
				alert("삭제완료");
				location.href="listConsult.ec";
			</script>
<%
			}else{
%>
			<script>
				alert("삭제실패");
				//공지사항 전체목록으로 이동
				location.href="selectConsult.ec";
			</script>
<%
			}
		}
	}
%>
</body>
</html>