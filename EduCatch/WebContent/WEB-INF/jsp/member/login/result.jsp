<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
<%@ page import = "com.kosmo.educatch.vo.AMemberVO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript">
	window.location()
</script>
</head>
<body>
	<div align="center" class ="body">
		<% 
			MemberVO memVo = (MemberVO) request.getAttribute("MemberVO");			
		%>
			<h3>로그인 확인</h3>
			<table  border="1">
			

				
				<%

				if(memVo != null){
					
				%>
					<tr>
							<td> Member ID :</td>
							<td align ="center"><b><%=memVo.getMid()%></b></td>
					</tr>
					<tr>
							<td> PW :</td>
							<td align ="center"><b><%=memVo.getMpw()%></b></td>
					</tr>
				<% } else {%>
					<tr>
							<td> login Fail </td>
					</tr>
				<% } %>
			</table>
	</div>
</body>
</html>