<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 테이블부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
	$(document).ready(function() {
		
		//비밀번호 확인
		$("#checkPW").click(function() {
			console.log("비밀번호체크 버튼 누름");
			
			$("#checkForm").attr("action","checkPW.ec");
			$("#checkForm").attr("method","POST");
			$("#checkForm").submit();
		})
		
		//닫기버튼
		$("#closePW").click(function() {
			window.close();
		})
		
	});//end of ready()
</script>
</head>
<body>
<%
	Object obj = request.getAttribute("MemberVO");
	
	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}	
	if(obj != null){
%>
<div class="container">
	<form id ="checkForm" name = "checkForm">
	<br>
	<br>
	
		<h2>비밀번호 확인</h2>
		<table border ="0" class="table table-bordered" >
			<tr>
				<td>아이디 </td>
				<td><div><%=mvo.getMid() %></div></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="mpw" name ="mpw"/></td>
				<input type="hidden" id="mid" name ="mid" value="<%=mvo.getMid() %>"/>
			</tr>
		</table>
		<div align="center">
		<input type="button" value="확인" id ="checkPW">
		<input type="button" value="닫기" id ="closePW">
		</div>
	</form>
<%		
	}
%>
</div>

</body>
</html>