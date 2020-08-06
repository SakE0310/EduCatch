<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("${result}");
	if("${result}".indexOf("문제") > -1){
		history.go(-1);
	}else{
		location.href="listConsult.ec";
	}
	
</script>
</body>
</html>