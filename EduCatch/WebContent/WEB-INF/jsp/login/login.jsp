<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>로그인</title>
<style type="text/css">
		#login{
			font-size :23px;
			font-weight: bold; 
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
	
	   .login__button.login__button--submit {
	    background-color: #0074e9;
	    color: #fff;
	    padding: 16px 17px;
	    font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
	    font-size: 17px;
	    line-height: 1px;
	    display: block;
	    padding-left: 0;
	    padding-right: 0;
	    width: 350px;
    }
		
		
		 
		
</style>
		
</head>
<body>
	<jsp:include page="../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
 		 <form name = "loginForm" id = "loginForm" method ="post"> 
  				
				<div align = "center" id = "login">로그인
				<hr style="height:4px;border-width:1px;color:black;background-color: #d9d9d9;width:350px"></div>
	
				<div class="js-form-message form-group"  id ="ID">
     		   		<label class="form-label" for="id_login">아이디</label>
        			<input type="email" class="form-control" name="login" id="id_login" placeholder="이메일을 입력해주세요"
       	         	 aria-label="Email address" data-error-class="u-has-error" data-success-class="u-has-success">
           		</div><br>
    		
    			<div class="js-form-message form-group mb-5" id ="PW">
      			   <label class="form-label" for="id_password">
       			   <span class="d-flex justify-content-between align-items-center">비밀번호
         		   <a class="link-muted text-capitalize font-weight-normal" href="/accounts/password/reset/"> </a>
          			</span>
          			</label>
        
        		  <input type="password" class="form-control" name="password" id="id_password" placeholder="********"
               	  aria-label="********">
          
     		   </div> 

				<div align ="center">
    			<button class="login__button login__button--submit _loginSubmitButton" type="submit" >로그인</button>
				</div>
    			  <div align ="center" id = "LOIGN" class ="LOGIN"> 
     			 <hr style="height:4px;border-width:1px;color:black;background-color: #d9d9d9;width:350px"></div>
 			 </form>

	<jsp:include page="../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>