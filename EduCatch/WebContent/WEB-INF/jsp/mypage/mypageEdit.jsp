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

<!-- 주소  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	.required{
		color : red;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		//==사이드바=============================================
		//======프로필 수정버튼을 누르면 실행 -> 비밀번호 확인 창
		$("#pwCheck").click(function() {
			console.log("프로필 수정버튼 누름");
			
			window.open("","pop","width=480, height=330");
			$("#clickForm").attr("action","selectPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").attr("target","pop");
			$("#clickForm").submit();
		})//end of myPageMemUpdate

		//수정페이지 부분==================================
		console.log("수정수정 분리분리");
		
		var tel = document.getElementById("tel").value;
		console.log("tel>>>"+tel);
		tel = tel.split('-');
		document.getElementById("mtel1").value=tel[0];
		document.getElementById("mtel2").value=tel[1];
		document.getElementById("mtel3").value=tel[2];
		
		//주소
		$("#addrCheck").click(function() {
			console.log("addrCheck함수 들어옴");
			var width=500;
			var height=600;
			
			new daum.Postcode({
		        oncomplete: function(data) {
		        	console.log("다음 API");
		        	console.log("우편번호 >>> : " + data.zonecode);
					console.log("주소값 >>> : " + data.roadAddress);
					console.log("빌딩값 >>> : " + data.buildingName);
		        	
		        	document.getElementById('maddrno').value=data.zonecode;
					document.getElementById('maddr1').value=data.roadAddress;
					document.getElementById('maddr2').value=data.buildingName;
		        }
		    }).open({
		    	left: (window.screen.width / 2) - (width / 2),
				top: (window.screen.height / 2) - (height / 2), 
		    	
		    });
		})//end of addrCheck()
		
		/* //비밀번호 체크
		$("#checkPW").click(function() {
			console.log("비밀번호 체크함수 들어옴");
			
			var pwd1 = $("#mpw").val();
			var pwd2 = $("#mpw_r").val();
			console.log("pwd1>>>"+pwd1);
			console.log("pwd2>>>"+pwd2);
			
			if ( pwd1 != '' && pwd2 == '' ) {
				alert("비밀번호를 입력하세요");
				$("#mpw").val('');
				$("#mpw_r").val('');
	        } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	                var length= document.mypageEditForm.mpw.value.length;
					if(length <6 || length >12){
						alert("비밀번호 오류- 6자 이상 12자 이하");
						$("#mpw").val('');
						$("#mpw_r").val('');
						$("#mpw").focus();
						return false; 
					}
	            } else {
					alert("비밀번호가 일치하지 않습니다.");
					$("#mpw").val('');
					$("#mpw_r").val('');
					
	            }
	        }//end of if-else 
			
		});//end of chechPW
		 */
		$("#mypageEdit").click(function() {
			console.log("수정버튼 누름");
			
			//이름
			if(document.mypageEditForm.mname.value==''){
				alert("이름을 입력하세요");
				$("#mname").focus();
				return false;
			}else{
				var exp= /^[가-힣]{2,4}$/;
				
				if(!exp.test(document.mypageEditForm.mname.value)){
					alert("이름 오류- 한글로 입력");
					$("#mname").focus();
					return false;
				}
				$("#mte1").focus();
			}//end of if(mname)
			
				
			//핸드폰	
			var tel1 = 	$("#mtel1").val();
			var tel2 = 	$("#mtel2").val();
			var tel3 = 	$("#mtel3").val();
			
			var telT = tel1+"-"+tel2+"-"+tel3;
			console.log("telT>>>"+telT);
				
			if(telT.length == 0){
				alert("핸드폰 번호를 입력하세요");
				$("#mtel1").focus();
				return false;
			}else{
				var exp = /^\d{3}\-\d{4}\-\d{4}$/;
				if (!exp.test(telT)) {
					alert("핸드폰 번호 오류 - 000-0000-0000 형식");
					$("#mtel1").focus();
					return false;
				}
			}//end of phone	
				
			//주소
			if(document.mypageEditForm.maddrno.value.length==0){
				alert("주소를 입력하세요");
				$("#maddrno").focus();
				return false;
			}//end of addr	
			
			alert("수정");
			/* $("#clickForm").attr("action",".ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); */
				
		})
			
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
			개인정보변경<br>
			비밀번호변경<br>
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
		<form id="mypageEditForm" name="mypageEditForm">
			<table border="1">
				<tr>
					<td class="mem">아이디</td>
					<td><input type="text" id="mid" name="mid" value="<%=mvo.getMid() %>" readOnly/></td>
				</tr>
				<!-- <tr>
					<td class="mem"><span class="required">*</span>비밀번호</td>
					<td><input type="text" id="mpw" name="mpw"></br>
						<input type="text" id="mpw_r" name="mpw_r"/>
						<input type="button" value="비밀번호확인" id="checkPW"/></br>
					</td>
				</tr> -->
				<tr>
					<td class="mem"><span class="required">*</span>회원이름</td>
					<td>
					<input type="text" id="mname" name="mname" value="<%=mvo.getMname() %>"/></br>
					</td>
				</tr>
				<tr>
<%

%>				
				<td class="mem"><span class="required">*</span>핸드폰</td>
				<td>
				<input type ="hidden" id="tel" value="<%=mvo.getMtel()%>">
					<select id="mtel1" name="mtel1">
						<option value="010">010</option>
						<option value="017">017</option>
						<option value="016">016</option>
					</select>
					<input type="text" id="mtel2" name="mtel2"/> - 
					<input type="text" id="mtel3" name="mtel3"/>
				</td>
			</tr>
			<tr>
				<td class="mem"><span class="required">*</span>주소</td>
				<td>
					 <input type="text" id="maddrno" name="maddrno" size=6 value="<%= mvo.getMaddrno()%>"/>
					 <input type="button" value="우편번호 찾기" id="addrCheck"/>(도로명주소)<br>
					 <input type="text" id="maddr1" name="maddr1" size=35 value="<%=mvo.getMaddr1() %>" /><br>							 
					 <input type="text" id="maddr2" name="maddr2" size=35 value="<%=mvo.getMaddr2() %>" /><br>
				</td>
			</tr>
			</table>
			<tr>						
				<td colspan=2 align="center">
					<input type="button" id="mypageEdit" value="수정" >
					<input type="reset" value="다시">
				</td>
			</tr>
<%		
	}
%>	
		</form>
		</div>
	</div>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>