<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	if("${result}"=="수정 문제"){
		alert("잘못된 경로로 인증하셨습니다");
		$('#login').on('click',function(){
			location.href="index.jsp";
		});
	}else{
		alert("${result}");
		$('#login').on('click',function(){
			location.href="login.ec";
		});	
	}
});
</script>
</head>
<body>
	<h2 align="center">회원가입을 성공하셨습니다. </h2>
	<h3 align="center">다시 로그인을 해주세요 </h3>
	<div align ="center">
		<button name ="login" id ="login">로그인</button>	
	</div><br>
</body>
</html>