<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	
	if(obj != null){
		MemberVO mvo = (MemberVO)obj;
%>
<div>
	<form id ="checkForm" name = "checkForm">
		 개인정보 수정 <br>비밀번호 확인
		<table border ="1">
			<tr>
				<td>아이디 </td>
				<td><div><%=mvo.getMid() %></div></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" id="mpw" name ="mpw"/></td>
				<td><input type="hidden" id="mid" name ="mid" value="<%=mvo.getMid() %>"/></td>
			</tr>
		</table>
		<input type="button" value="확인" id ="checkPW">
		<input type="button" value="닫기" id ="closePW">
	</form>
<%		
	}
%>
</div>

</body>
</html>