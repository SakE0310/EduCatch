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
			var pw = $("#mpw").val();
			var pwchk = $("#mpw_chk").val();
			if(pw != "" && pw == pwchk){
				$("#pwChange").attr("action","passwdChange.ec")
				$("#pwChange").submit();
			}else if(pw == ""){
				alert("비밀번호를 입력해 주세요.");
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
		
		});
		

			
	});
		
</script>

		<style type="text/css">

	
			#fpw{
				
				font-size :30px;
				font-weight: bold; 
				color : black;
				text-align : left;
				width:350px;
				margin-top :155px;
			}			
		
				
			#pw_reset{
				font-size :13px;
				font-weight: bold;
				width:350px;
				margin : auto;
			
			}
			
			#pw {
				font-weight: bold;
				font-size: 20px;
				text-align : left;
				width :350px;
			}
			#pwconfirm{
				font-size: 20px;
				font-weight: bold;
				text-align : left;
				width :350px;
			}
			
			.genric-btn {
				line-height: 35px;
			}
			

</style>
</head>
<body>
	<% 
		MemberVO memberVO = (MemberVO) request.getAttribute("MemberVO");			
	%>
		<div align = "center">
		<h2 align = "center" id ="fpw">비밀번호변경</h2></div>
						
		<div align = "center">	
			<hr style=" height:3.5px;
						border-width:1px;
						color:black;
						background-color: #d9d9d9;
						width:350px;
						margin-top:10px; 
						margin-bottom:33px;">
		</div>
	 	 	<form method ="post" action ="#" id = "pwChange"> 
	 			<div class ="content" align = "center">
					<div style="width:350px;margin-top:10px; ">
						<label class="form-label" for="id_password"> 
							<span class="d-flex justify-content-between align-items-center" id="pw">비밀번호</span>
						</label> 
						<input type="password" style="height: 35px; font-size : 14px;" class="form-control" name="mpw" id="mpw" placeholder="********" aria-label="********">
					</div>
					<div style="width:350px;margin-top:10px;margin-bottom:30px ">
						<label class="form-label" for="id_password"> 
							<span class="d-flex justify-content-between align-items-center" id ="pwconfirm">비밀번호 확인</span>
						</label> 

						<input type="password" style="height: 35px; font-size : 14px;" class="form-control" name="mpw_chk" id="mpw_chk" placeholder="********" aria-label="********">
		
					</div>
					
					<label name="pwLabel" style="color:red;font-size:12px;display:none"> 비밀번호가 일치하지 않습니다.</label>
					
					<button type = "button" name="pwReset" id="pwReset" class = "genric-btn primary">변경</button>	
			
			
	     		<hr style=" height:4px;
	     			 		border-width:1px;
	     			 		color:black;
	     			 		background-color: #d9d9d9;
	     			 		margin-bottom : 309px;
	     			 		width:350px">
			
			
				</div>

				<input type="hidden" id="findpw" name="findpw" value="<%=memberVO.getFindpw()%>"></input>
			</form>


<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>