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
			
			alert("일반 회원가입");
			$("#loginForm").attr("action","joinCheckForm.ec")
			$("#loginForm").submit();
			
		});
		
		$("#academymem").click(function(){
			
			alert("관리자 회원가입");
			$("#loginForm").attr("action","academyJoinForm.ec")
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
			
			font-size :30px;
			font-weight: bold; 
			color : black;
			text-align : left;
			width:350px;
			margin-top : 75px;
				
		}
		
		#id{
			font-size :18px;
			font-weight: bold;
			width:350px;
			margin : auto;
		}
	
		#pw{
			font-size :18px;
			font-weight: bold;
			width:350px;
			margin : auto;
		}
		
		#login{
			font-size : 17px;
			font-weight: bold;
		}
		
		#join{
			font-size : 17px;
			font-weight: bold;
		}
		
		#question{
			color : #808080;
			font-size : 16px;
			font-weight: bold;
		
		}
		
		#academymem{
			width : 170px;
			padding : 0px 0px;
			margin-top: 10px;
			margin-bottom : 100px;
			font-weight: bold;
			font-size : 16px;
		
		}
		#mid{
			height : 30px;
			font-size : 15px;
		
		}
		
		#mpw{
			height : 30px;
			font-size : 15px;
		
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
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	// init 부분의 key값은 kakao developer에서 발급받아 변경
	Kakao.init('6b4dabec7bbdb2661fd8591e728271ce');
	Kakao.isInitialized();
	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
	// @breif 카카오 로그인 버튼을 생성합니다.
</script>
	</head>
		<body>
 		
 		 <form name = "loginForm" id = "loginForm" method ="post"> 
  				
					<div align = "center">
					<h2 align = "center" id ="subject">로그인</h2></div>
						
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
									
					
					
				
					<!-- ================ 아이디  ================== -->		
					<div class="js-form-message form-group"  id ="id">
	     		   		<label class="form-label" for="id_login">아이디</label>
	        			<input type="email" class="form-control" name="mid" id="mid" placeholder="이메일을 입력해주세요."
	       	         	 aria-label="Email address" data-error-class="u-has-error" data-success-class="u-has-success">
	           		</div><br>
	    		
	 
	    			<!-- ================ 비밀번호 ================== -->
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
			          		   			 		 font-size : 13px;
			          		   			 		 font-weight: bold;">비밀번호를 잊으셨나요?</a>
			          	</div> 
	          		</div> 
	
					<!--===== 로그인 버튼 ======  -->
					<div align ="center">
	    				<button class="genric-btn primary" type="submit" name ="login" id ="login">로그인</button>	
					</div><br>
	    
	    			<!--===== 회원가입 버튼 ====== -->
	    			<div align = "center">
	    				<button class="genric-btn success" type="submit" name ="join" id ="join">회원가입</button>
	   				</div><br>
	
	  				
	     				<p align = "center"><img src="https://ssl.nx.com/S2/p3/login/2016/img_tpa.gif" width="350" height="10" alt="또는"/>
	     				
	     				
				<!-- ============== 소셜 로그인	 ============== -->
	     			<div class = "snslogin" align = "center"  >	
	     			 		
	     			 		<a href ="https://www.naver.com">
	     			 		<img src = "/EduCatch/assets/img/login/naver.png" alt = "naver" id = "naver" >
	     			 		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
							<a href ="https://www.facebook.com">
							<img src = "/EduCatch/assets/img/login/facebook.png" alt = "facebook" id ="facebook" >
							</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							
							<a >	
							<img src="/EduCatch/assets/img/login/kakao.png" alt="kakao" id="kakao">
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
									margin-top:20px;">
						
					</div>
					
					<!--======== 학원관리자 회원가입 ==========-->
					
					<div align = "center">
							<a id ="question">일반 회원이 아니신가요?</a><br>
							<button class="genric-btn success" id ="academymem" type = "submit">학원 관리자 등록</button>
					
					</div>
 		 </form>
 		 <script type="text/javascript">
			var email = "";
			var name = "";
			Kakao.Auth
					.createLoginButton({
						container : '#kakao',
						success : function(authObj) {
							Kakao.API
									.request({
										url : '/v2/user/me',
										success : function(res) {
											alert(JSON.stringify(res))
											console.log(res.properties.nickname);
											console.log(res.kakao_account.email);
											name = res.properties.nickname;
											email = res.kakao_account.email;
											$
													.ajax({
														url : "./memberCheck.ec",
														type : "GET",
														dataType : "JSON",
														data : {
															mid : email
														},
														success : function(data) {
															console.log(data);
															if (data > 0) {
																//이미 회원이 있음
															} else {
																// 회원이 없음
																var emailSplit = email
																		.split('@');
																location.href = "http://localhost:8088/EduCatch/memberjoinform.ec?mname="
																		+ name
																		+ "&emailname="
																		+ emailSplit[0]
																		+ "&emailaddr="
																		+ emailSplit[1]
																		+"&snstype=k"
															}
														},
														error : function(request,
																status, error) {
															alert('실패했습니다.');
															alert("code : "
																	+ request.status
																	+ "\n"
																	+ "message : "
																	+ request.responseText
																	+ "\n"
																	+ "error : "
																	+ error);
														}
													});
										},
										fail : function(error) {
											alert('login success, but failed to request user information: '
													+ JSON.stringify(error))
										},
									})
						},
						fail : function(err) {
							alert('failed to login: ' + JSON.stringify(err))
						},

					});
	</script>

	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>