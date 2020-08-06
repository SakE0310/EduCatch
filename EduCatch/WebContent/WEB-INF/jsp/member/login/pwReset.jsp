<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				margin:50px 280px 10px 80px;
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
		<div align = "center" id = "fpw" >비밀번호 찾기</div>
						
		<div align = "center">	
			<hr style=" height:3.5px;
						border-width:1px;
						color:black;
						background-color: #d9d9d9;
						width:350px;
						margin-top:10px; 
						margin-bottom:40px;">
		</div>
	 	 	<form method ="post" action ="#" id = "pw_reset"> 
	 			<div class ="content" align = "center">
						
				<input type="email" class="form-control input-lg"  id="mid" placeholder="이메일을 입력해주세요"
	       	         	 aria-label="Email address" data-error-class="u-has-error" data-success-class="u-has-success" required><br>
			 	<button type = "submit" class = "genric-btn primary">전송</button>	
			
			
	     		<hr style=" height:4px;
	     			 		border-width:1px;
	     			 		color:black;
	     			 		background-color: #d9d9d9;
	     			 		margin-bottom : 150px;
	     			 		width:350px">
			
			
				</div>
			</form>


<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>