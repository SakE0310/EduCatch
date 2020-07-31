<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		.LOGIN{
			background-image: #007bff;
		}
		
		 
		
</style>
		
</head>
<body>
	<jsp:include page="../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
  <form name = "loginForm" id = "loginForm"> 
  
	<div align = "center" id = "login">로그인
	<hr style="height:5px;border-width:1px;color:black;background-color:black;width:350px"></div>
	
	<div class="js-form-message form-group" id ="ID">
          <label class="form-label" for="id_login">아이디</label>
          <input type="email" class="form-control" name="login" id="id_login" placeholder="이메일을 입력해주세요"
                 aria-label="Email address"
                data-error-class="u-has-error" data-success-class="u-has-success">
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
      <div align ="center" id = "LOIGN" class ="LOGIN"> 	
      <button type="button" class="btn btn-primary" style ="width: 350px">로그인</button>
      </div>  
      
      <div align = "center">
      <hr style="height:5px;border-width:1px;color:black;background-color:black;width:350px">
      </div>
      
      
  </form>

	<jsp:include page="../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>