<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">

	.container-mypage {
	
	    max-width: 840px;
	    height: 500px;
	    margin-left: 710px;
	    background-color: #f5f5f0;
	}
	#sideBanner-mypage{
			position: absolute;
			left:0px;
			width:225px;
			height: 500px;
			background: #eaeae1;
			margin-left: 490px;
			padding-left: 12px;
		} 
		
	.sideBox{
		width:200px;
		height:110px;
		background-color: #ffffff;
		margin-top: 15px;
		
	}	
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		//======프로필 수정버튼을 누르면 실행 -> 비밀번호 확인 창
		$("#pwCheck").click(function() {
			console.log("프로필 수정버튼 누름");
			
			window.open("","pop","width=480, height=330");
			$("#clickForm").attr("action","selectPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").attr("target","pop");
			$("#clickForm").submit();
		})//end of myPageMemUpdate
		
/* 			$("#clickForm").attr("action",".ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); */
			
			
			
	});//end of ready()
</script>
</head>
<body>
<%
	Object obj = request.getAttribute("MemberVO");

	if(obj != null){
		MemberVO mvo = (MemberVO)obj;
%>
	<div id="sideBanner-mypage">
	<form id= "clickForm" name = "clickForm">
		<div class ="sideBox">

			<%=mvo.getMname() %>님 	&nbsp;&nbsp;<input type ="button" id="pwCheck" value="수정">
			<br>
			개인정보 변경<br>
			비밀번호 변경<br>
			회원탈퇴
			
		<input type="hidden" id ="mid" name ="mid" value="<%=mvo.getMid()%>">
		</div>
		<div class ="sideBox">
			즐겨찾기
		</div>
		<div class ="sideBox">
			이력조회
		</div>
	</form>	
<%		
	}
%>	
	</div>
	<div class = "container-mypage ">
		<div align="center">
			마이페이지 메인
			<br>
			 여긴 게시글 관리 부분
		</div>
	</div>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>