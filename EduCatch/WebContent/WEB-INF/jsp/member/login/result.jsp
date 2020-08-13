<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Login</title>
</head>
<body>
	<div align="center" class ="body">
			<h3>로그인 확인</h3>
			<table width ="300" border="1">
			
			<% 
				
 				Object obj = request.getAttribute("loginCheck");
			
				if(obj != null){
 				MemberVO mvo =(MemberVO)obj;		
				System.out.println(mvo.getMid());	
				System.out.println(mvo.getMpw());	
			
			
				
				
//  				ArrayList aList = (ArrayList)request.getAttribute("aList");
//  				if(aList != null && aList.size() > 0){
//  					MemberVO mvo =(MemberVO)aList.get(0);
					
				
				%>
				
				
				
				
				<tr>
						<td> ID :</td>
						<td align ="center"><%=mvo.getMid()%></td>
				</tr>
				<tr>
						<td> PW :</td>
						<td align ="center"><%=mvo.getMpw()%></td>
				</tr>
	<%
}
	%>			
	
				
			</table>
	</div>
</body>
</html>