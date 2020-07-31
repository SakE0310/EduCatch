<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>결과 화면</title>
<script type="text/javascript">
	alert("${result}");
	if("${result}".indexOf("문제") > -1){
		history.go(-1);
	}else{
		location.href="listReview.ec";
	}
	
</script>
</head>
<body>

</body>
</html>