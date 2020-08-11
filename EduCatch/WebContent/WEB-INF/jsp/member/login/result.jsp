<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div align="center" class ="body">
			<h3>로그인 확인</h3>
			<table  border="1">
			
			<% 
				
// // 				Object obj = request.getAttribute("LoginVO");
// // 				LoginVO lvo =(LoginVO)obj;		
				
				
 				ArrayList aList = (ArrayList)request.getAttribute("aList");
 				if(aList != null && aList.size() > 0){
 					MemberVO mvo =(MemberVO)aList.get(0);
					
			


				
				%>
				
				
				
				
				<tr>
						<td> ID :</td>
						<td align ="center"><b><%=mvo.getMid()%></b></td>
				</tr>
				<tr>
						<td> PW :</td>
						<td align ="center"><b><%=mvo.getMpw()%></b></td>
				</tr>
				
				<%
				}
				%>
				
			</table>
	</div>
</body>
</html>