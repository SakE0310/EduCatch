<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
<script type="text/javascript">
	alert("${result}");
	if("${result}".indexOf("문제")>-1){
		console.log("${result}".indexOf("문제"));
		history.go(-1);
	}else{
		alert("이메일 인증을 진행해주세요.");
		location.href= "http://localhost:8088/EduCatch/login.ec";
	}
</script>
</head>
<body>

</body>
</html>