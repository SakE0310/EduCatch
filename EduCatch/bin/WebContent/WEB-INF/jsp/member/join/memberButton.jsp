<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function memberButton(){
	console.log("memberButton함수 진입");
	alert("일반회원으로 회원가입하시겠습니까?");
	$("#join").attr("action","memberjoinform.ec");
	$("#join").submit();
}

function academyButton(){
	console.log("academyButton함수 진입");
	alert("학원회원으로 회원가입하시겠습니까??");
	$("#join").attr("action","academyjoinform.ec");
	$("#join").submit();
}
</script>
</head>
<body>
	<form id="join" name="join" method="get">
	<table style="margin-left: auto; margin-right: auto;" border="1">
		<tr>
			<td><input type="button" id="member" value="일반회원" onclick="memberButton()" /></td>			
			<td><input type="button" id="academy" value="학원회원" onclick="academyButton()" /></td>			
		</tr>
	</table>
	</form>
</body>
</html>