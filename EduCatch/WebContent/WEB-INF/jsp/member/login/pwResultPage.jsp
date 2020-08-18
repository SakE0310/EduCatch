<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
<script type ="text/javascript">
</script>

		<style type="text/css">

			#fpw{
				
				font-size :23px;
				font-weight: bold; 
				color : black;
				margin-top :207px;
				margin-right : 50px;
				width :350px;
				text-align : left;

				}				
		
				
			#pw_reset{
				font-size :13px;
				font-weight: bold;
				width:350px;
				margin : auto;
			
			}
			
			
			.genric-btn {
				line-height: 35px;
			}
			

</style>
</head>
<body>
		<% 
			String resultMsg = (String) request.getAttribute("resultMsg");			
		%>
		<div align = "center">
		<h2 align = "center" id ="fpw">비밀번호찾기</h2></div>
						
		<div align = "center">	
			<hr style=" height:3.5px;
						border-width:1px;
						color:black;
						background-color: #d9d9d9;
						width:400px;
						margin-top:10px; 
						margin-bottom:40px;">
		</div>
	 	 	<form method ="post" action ="#" id = "pwCheckLogin"> 
	 			<div class ="content" align = "center">
						<div><%=resultMsg%></div><br>
					
			 	<button type = "button" onclick = "location.href = 'login.ec' " class = "genric-btn primary">확인</button>	
			
			
	     		<hr style=" height:4px;
	     			 		border-width:1px;
	     			 		color:black;
	     			 		background-color: #d9d9d9;
	     			 		margin-bottom : 391px;
	     			 		width:400px">
			
			
				</div>
			</form>


<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>