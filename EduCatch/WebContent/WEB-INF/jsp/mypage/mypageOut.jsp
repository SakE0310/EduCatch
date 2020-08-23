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
	
		
<%
	Object obj = request.getAttribute("memberVO");

	if(obj != null){
		MemberVO mvo = (MemberVO)obj;
		
		/* String NowPW = mvo.getMpw();
		System.out.println("NowPW>>>"+NowPW);//1234 */
		
%>
//회원탈퇴 버튼 클릭
$(document).ready(function() {
	var clickYN =0;
	$("#checkpw").click(function(){
		console.log("확인버튼 클릭");
	
		var DBpw = "<%= mvo.getMpw()%>";
		console.log(">>>"+DBpw);
		var pass = $("#mpw").val();
	
		if(pass !=""){
			if(pass == DBpw){
				alert("비밀번호 일치");
				clickYN =1;
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				$("#mpw").val('');
				clickYN=0;
			}
		}else{
			alert("비밀번호를 입력하세요");
		}
	
	});

	$("#memberOut").click(function(){
		console.log("회원탈퇴버튼 클릭");
		console.log("clickYN>>"+clickYN);
		if(clickYN==1){
			$("#pwOutForm").attr("action","memberout.ec");
			$("#pwOutForm").attr("method","POST");
			$("#pwOutForm").submit(); 
		}else{
			alert("비밀번호 확인 버튼을 눌러주세요");
		}

		});
	
	});

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
			<form id="pwOutForm" name = "pwOutForm">
			<input type ="text" id="mno" name="mno" value="<%=mvo.getMno()%>">
			<input type ="text" id="mname" name="mname" value="<%=mvo.getMname()%>">
				<table>
					<tr>
						<td><%=mvo.getMname() %>님 탈퇴하시겠습니까?</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type ="text" id="mid" name="mid" value="<%=mvo.getMid() %>" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type ="password" id="mpw" name="mpw"/></td>
						<td><input type ="button" id="checkpw" name="checkpw" value="확인"/></td>
					</tr>
				<tr>						
				<td colspan=2 align="center">
					<input type="button" id="memberOut" name="memberOut" value="회원탈퇴" >
				</td>
			</tr>
				</table>
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