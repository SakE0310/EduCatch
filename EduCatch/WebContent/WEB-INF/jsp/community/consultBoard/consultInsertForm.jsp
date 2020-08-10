<%@page import="java.util.ArrayList"%>
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

	if(obj !=null){
		String result=(String)obj;
		
		
		if(result.indexOf("문제") > -1){
%>
			<script>
				alert("등록 실패");
				history.go(-1);
			</script>
<%
		}
		else{
%>
			<script>
				alert("등록 성공");
				location.href="listConsult.ec";
			</script>
<% 
		}

	}
%>
</body>
</html>