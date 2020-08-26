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
				<table id= "login" style="visibility:hidden;">
				
					<tr>
							<td><%=memVo.getMid()%></td>
					</tr>
					<tr>
							<td><%=memVo.getMpw()%></td>
					</tr>
				
					<script>
						location.href="/EduCatch/index.jsp";
						
					</script>
				<% } %>
			</table>
	</div>
</body>
</html>