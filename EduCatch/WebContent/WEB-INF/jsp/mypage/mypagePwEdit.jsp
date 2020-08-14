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
		
		//=====비밀번호 변경 버튼 누르면 실행
		$("#pwEdit").click(function() {
			console.log("비밀번호 변경 버튼 누름");
			
			$("#clickForm").attr("action","editPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		})//end of pwEdit
		
<%
	Object obj = request.getAttribute("MemberVO");

	if(obj != null){
		MemberVO mvo = (MemberVO)obj;
		
		/* String NowPW = mvo.getMpw();
		System.out.println("NowPW>>>"+NowPW);//1234 */
		
%>
		//==== 비밀번호 변경 : 비밀번호 변경 버튼 누르면 실행
		$("#updatePW").click(function() {
			console.log("비밀번호 변경버튼 누름");
			
			var DBpw = <%= mvo.getMpw()%>
			var NowPW = $("#mpw").val();
			var NewPW = $("#mpw_new").val();
			var NewPWRe = $("#mpw_new_R").val();
			
			//현재 비밀번호 체크
			if(NowPW !='' ){
				if(NowPW == DBpw ){
					console.log("현재비밀번호 일치");
					
					if(NewPW != '' || NewPWRe !='' ){
						
						//새비밀번호 : 비밀번호 확인
						if(NewPW == NewPWRe ){
							 var length= document.pwEditForm.mpw_new.value.length;
							 if(length <6 || length >12){
								alert("비밀번호 오류- 6자 이상 12자 이하");
								$("#mpw_new").val('');
								$("#mpw_new_R").val('');
								return false; 
							}//end of if((length <6 || length >12))
							console.log("새비밀번호 : 비밀번호  일치 \n 수정가능");
							$("#pwEditForm").attr("action","updatePW.ec");
							$("#pwEditForm").attr("method","POST");
							$("#pwEditForm").submit(); 
							
						}else{
							alert("비밀번호가 일치하지 않습니다.");
							$("#mpw_new").val('');
							$("#mpw_new_R").val('');
						}//end of if(NewPW == NewPWRe)
					}else{
						alert("새 비밀번호를 입력하세요");
					}//end of (NewPW != '' || NewPWRe !='' )
					
				}else{
					alert("현재비밀번호가 일치하지 않습니다.");
					$("#mpw").val('');
				}//end of if-else(NowPW == DBpw )
			}else{
				alert("현재 비밀번호를 입력하세요");
			}//end of if-else(NowPW !='' )
				
			
			
		})//end of updatePW
	
			
			
			
	});//end of ready()
</script>
</head>
<body>
	<div id="sideBanner-mypage">
	<form id= "clickForm" name = "clickForm">
		<div class ="sideBox">

			<%=mvo.getMname() %>님 	 &nbsp;&nbsp;
			<br>
			<input type ="button" id="pwCheck" value="개인정보 변경"><br>
			<input type ="button" id="pwEdit" value="비밀번호 변경"><br>
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
	</div>
	<div class = "container-mypage ">
		<div align="center">
			<form id="pwEditForm" name = "pwEditForm">
			<input type ="text" id="mno" name="mno" value="<%=mvo.getMno()%>">
			<input type ="text" id="mname" name="mname" value="<%=mvo.getMname()%>">
				<table>
					<tr>
						<td>현재 비밀번호</td>
						<td><input type ="password" id="mpw" name="mpw"/></td>
					</tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type ="text" id="mpw_new" name="mpw_new"/></td>
					</tr>
					<tr>
						<td>새 비밀번호 확인</td>
						<td><input type ="text" id="mpw_new_R" name="mpw_new_R"/></td>
					</tr>
				</table>
				<tr>						
				<td colspan=2 align="center">
					<input type="button" id="updatePW" value="비밀번호 변경" >
				</td>
			</tr>
			</form>
<%		
	}
%>	
		</div>
	</div>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>