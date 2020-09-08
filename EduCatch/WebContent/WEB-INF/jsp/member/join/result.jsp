<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
<script type="text/javascript">
	if("${result}".indexOf("문제")>-1){
		console.log("${result}".indexOf("문제"));
		history.go(-1);
	}else{
		alert("가입하신 이메일 계정으로 인증메일을 전송하였습니다.");
		location.href= "/EduCatch/login.ec";
	}
</script>
</head>
<body>

</body>
</html>