<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 비밀번호 수정</title>
<style type="text/css">

	

 #table {
 			margin : 100px 300px 0px 750px;

 		}
 		
 #button { 
 			
 			margin-left : 60px;
 
 
 		}



</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


 	
 	<form name = pwupdate id = pwupdate class = pwupdate  method = POST >
		<div id = "table">
			<div class="content_title" >비밀번호</div>
			<div class="content_content" >
			    <input type="password" id="password_1" class="pw" placeholder="비밀번호">
		 	   
			</div><br>
		 
			<div class="content_title" >비밀번호 확인</div>
			<div class="content_content" >
			    <input type="password" id="password_2" class="pw" placeholder="비밀번호 확인">
			    <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
			    <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
			</div> <br>		
			<div>
				<button type = "submit" id = "button"> 완료 </button>
			</div>
		</div>
	 </form>
 
<script>
    $('.pw').focusout(function () {
        var pwd1 = $("#password_1").val();
        var pwd2 = $("#password_2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
</script>


</body>
</html>