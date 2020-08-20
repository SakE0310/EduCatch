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
			HttpSession hs = request.getSession(false);
			MemberVO memVo = (MemberVO) hs.getAttribute("user");
		%>
			

				
				<%

				if(memVo != null){
					
				%>
				<h2>로그인 정보</h2>
				<table border=1>
				
					<tr>
							<td> Member ID :</td>
							<td align ="center"><b><%=memVo.getMid()%></b></td>
					</tr>
					<tr>
							<td> PW :</td>
							<td align ="center"><b><%=memVo.getMpw()%></b></td>
					</tr>
					<script>
						location.href="http://localhost:8088/EduCatch/index.jsp";
						
					</script>
				<% } %>
			</table>
	</div>
</body>
</html>