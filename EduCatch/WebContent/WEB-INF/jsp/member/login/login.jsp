<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
<%@ page import = "com.kosmo.educatch.vo.AMemberVO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
	<script type ="text/javascript">
	
	$(document).ready(function(){
		$("#join").click(function(){
			
			alert("회원가입");
			$("#loginForm").attr("action","joinCheckForm.ec")
			$("#loginForm").submit();
			
		});
		
		$("#login").click(function(){
				
			alert("로그인");
			$("#loginForm").attr("action","loginCheck.ec")
			$("#loginForm").submit();
		
		});
		

			
	});
		


</script>
<style type="text/css">
		
		
		#subject{
			
			font-size :23px;
			font-weight: bold; 
			margin:50px 280px 10px 0px;
		}
		
		#id{
			font-size :13px;
			font-weight: bold;
			width:350px;
			margin : auto;
		}
	
		#pw{
			font-size :13px;
			font-weight: bold;
			width:350px;
			margin : auto;
		}
		
	
		.genric-btn {
	   		color: #fff;
	   		background: #140C40;
	   		width: 350px;
	   		border: 1px solid transparent;
		}
		
		.snslogin img{
			border-radius: 20%;
			width : 42px;
			height : 42px;
			
		
		}
		
		
		 
		
</style>

	</head>
		<body>
 		
 		 <form name = "loginForm" id = "loginForm" method ="post"> 
  				
					<div align = "center" id = "subject" >로그인</div>
						
					<div align = "center">	
							<hr style=" 
									height:3.5px;
									border-width:1px;
									color:black;
									background-color: #d9d9d9;
									width:350px;
									margin-top:10px; 
									margin-bottom:20px;">
					</div>
									
					
					
				
		
					<div class="js-form-message form-group"  id ="id">
	     		   		<label class="form-label" for="id_login">아이디</label>
	        			<input type="email" class="form-control" name="mid" id="mid" placeholder="이메일을 입력해주세요"
	       	         	 aria-label="Email address" data-error-class="u-has-error" data-success-class="u-has-success">
	           		</div><br>
	    		
	 
	    			<!--   -->
	    			<div class="js-form-message form-group mb-5" id ="pw">
	      			    <label class="form-label" for="id_password">
	       			    <span class="d-flex justify-content-between align-items-center">비밀번호
	          		  	 </span></label>
	        
	        			   <input type="password" class="form-control" name="mpw" id="mpw" placeholder="********"
	               	 			  aria-label="********">
	               	   
			               	<div style= "width : 350px" align = "right">
			          		   <a class="link-muted text-capitalize font-weight-normal" href="pwReset.ec"
			          		   			style = "color : #808080;
			          		   			 		 border-bottom: 1px dashed #97a4af;
			          		   			 		 font-size : 11px;">비밀번호를 잊으셨나요?</a>
			          	</div> 
	          		</div> 
	
					<!-- 로그인 버튼  -->
					<div align ="center">
	    				<button class="genric-btn primary" type="submit" name ="login" id ="login">로그인</button>	
					</div><br>
	    
	    			<!-- 회원가입 버튼  -->
	    			<div align = "center">
	    				<button class="genric-btn success" type="submit" name ="join" id ="join">회원가입</button>
	   				</div><br>
	
	  				
	     				<p align = "center"><img src="https://ssl.nx.com/S2/p3/login/2016/img_tpa.gif" width="350" height="10" alt="또는"/>
	     				
	     				
	     			<div class = "snslogin" align = "center"  >	
	     			 		
	     			 		<a href ="https://www.naver.com">
	     			 		<img src = "/EduCatch/assets/img/login/naver.png" alt = "naver" id = "naver" >
	     			 		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
							<a href ="https://www.facebook.com">
							<img src = "/EduCatch/assets/img/login/facebook.png" alt = "facebook" id ="facebook" >
							</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
							<a href ="#">
							<img src = "/EduCatch/assets/img/login/kakao.png" alt = "kakao" id = "kakao" >
							</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
							<a href ="https://www.google.co.kr">
							<img src = "/EduCatch/assets/img/login/google.png" alt = "google" id= "google">
							</a>
							
	     			
	     			</div>
	     			
	     			
	     			
	     			
	     			<div align = "center">	
							<hr style=" 
									height:3.5px;
									border-width:1px;
									color:black;
									background-color: #d9d9d9;
									width:350px;
									margin-top:20px; 
									margin-bottom:80px;">
					</div>
	     	     			
 		 </form>

	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>