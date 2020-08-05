<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
<%@ page import = "com.kosmo.educatch.vo.AMemberVO" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
<script type ="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type ="text/javascript">
	
	$(document).ready(function(){
		$("#join").click(function(){
			
			alert("회원가입");
			$("#loginForm").attr("action","joinCheckForm.ec")
			$("#loginForm").submit();
			
		});
		
		// 회원 타입선택 안할 시 alert
		$("#login").click(function(){
			if($("input[name='auth']:checked").val() == null){
				alert("회원타입을 선택해주세요.");
				
			}else{
				
				alert("로그인");
				$("#loginForm").attr("action","loginCheck.ec")
				$("#loginForm").submit();
			}
			
			
		});
		
		

	});
	
		



</script>
<style type="text/css">
		
		
		#Subject{
			font-size :23px;
			font-weight: bold; 
			margin-top:20px;
			margin-bottom:40px;
		}
		
		#ID{
			font-size :13px;
			width:350px;
			margin : auto;
			font-weight: bold;
		}
	
		#PW{
			font-size :13px;
			width:350px;
			margin : auto;
			font-weight: bold;
		}
	
		.genric-btn {
	   		color: #fff;
	   		background: #140C40;
	   		border: 1px solid transparent;
	   		width: 350px;
		}
		
		.radio{
			font-size :13px;
			width:350px;
			margin : auto;
			font-weight: bold;
			margin-top : -20px;
			margin-bottom : 10px;
		
		}
		
		
		 
		
</style>




		
</head>
<body>
 		
 		 <form name = "loginForm" id = "loginForm" method ="post"> 
  				
				<div align = "center" id = "Subject">로그인
				<hr style=" height:3.5px;
							border-width:1px;
							color:black;
							background-color: #d9d9d9;
							width:350px;
							margin-top:10px; 
							margin-bottom : 0px; ">
				</div>
				
				<div class="radio" align = "center">
 				 <label><input type="radio" name="auth" id = "auth1"  value ="1" checked>  일반회원</label>
  				 <label><input type="radio" name="auth" id = "auth2" value ="2">  학원회원</label>
				</div>
				
			
	
				<div class="js-form-message form-group"  id ="ID">
     		   		<label class="form-label" for="id_login">아이디</label>
        			<input type="email" class="form-control" name="login" id="id_login" placeholder="이메일을 입력해주세요"
       	         	 aria-label="Email address" data-error-class="u-has-error" data-success-class="u-has-success">
           		</div><br>
    		
 
    		
    			<div class="js-form-message form-group mb-5" id ="PW">
      			   <label class="form-label" for="id_password">
       			   <span class="d-flex justify-content-between align-items-center">비밀번호
          		   </span></label>
        
        		   <input type="password" class="form-control" name="password" id="id_password" placeholder="********"
               	   aria-label="********">
          
     		    </div> 

				<div align ="center">
    				<button class="genric-btn primary" type="submit" name ="login" id ="login">로그인</button>	
				</div><br>
    
    			<div align = "center">
    				<button class="genric-btn success" type="submit" name ="join" id ="join">회원가입</button>
   				</div>
   				
    			<div align ="center"> 
     			 	<hr style=" height:4px;
     			 				border-width:1px;
     			 				color:black;
     			 				background-color: #d9d9d9;
     			 				width:350px">
     			</div>
 		 </form>

	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>