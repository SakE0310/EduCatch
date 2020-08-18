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
	
	$(document).ready(function(){
		
		$("#pwReset").click(function(){
				
			$("#pw_reset").attr("action","passwordReset.ec")
			$("#pw_reset").submit();
		
		});
		

			
	});
		
</script>

		<style type="text/css">

	
			#fpw{
				
				font-size :23px;
				font-weight: bold; 
				color : black;
				margin-top :207px;
				width :350px;
				text-align : left;

				}			
		
				
			#pw_reset{
				font-size :13px;
				font-weight: bold;
				width:350px;
				margin : auto;
			
			}
			
			
			#mid{
			
			height : 40px;
			font-size : 15px;
			
			}
			
			.genric-btn {
				line-height: 35px;
			}
			

</style>
</head>
<body>
		<div align = "center">
		<h2 align = "center" id ="fpw">비밀번호찾기</h2></div>
						
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
						
				<input type="email" class="form-control input-lg"  id="mid" name="mid" placeholder="회원가입 시 등록한 이메일을 입력해주세요."
	       	         	 aria-label="Email address" data-error-class="u-has-error" data-success-class="u-has-success" required><br>
			 	<button type = "submit" name="pwReset" id="pwReset" class = "genric-btn primary">전송</button>	
			
			
	     		<hr style=" height:4px;
	     			 		border-width:1px;
	     			 		color:black;
	     			 		background-color: #d9d9d9;
	     			 		margin-bottom : 380px;
	     			 		width:350px">
			
			
				</div>
			</form>


<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>