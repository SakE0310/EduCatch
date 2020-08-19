<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.required {
	color: red;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script type="text/javascript"
		        src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function joinCommit(){
	console.log("joinCommit함수 진입");
	
	//이름
	if(document.memberjoin.mname.value.length<=1){
		alert("이름을 입력해주세요");
		document.getElementById("mname").focus();
		return false;
	}
	
	//아이디(이메일)
	if(document.memberjoin.memail0.value==""){
		alert("아이디를 입력해주세요");
		document.getElementById("memail0").focus();
		return false;
	}

	//비밀번호
	if(document.memberjoin.mpw.value==""){
		alert("비밀번호를 입력하세요");
		document.getElementById("mpw").focus();
		return false;
	}
	
	if(document.memberjoin.mpw_r.value==""){
		alert("비밀번호 확인을 해주셔야합니다");
		document.getElementById("mpw_r").focus();
		return false;
	}
	
	/*
	if(document.member.mpw.value.length===0){
		alert("비밀번호를 입력하세요");
		document.getElementById("mpw").focus();
		return false;
	}else{
		var length = document.memberjoin.mpw.value.length;
		if(length<6 || length>12){
			alert("비밀번호 오류 - 6자 이상 12자 이하");
			document.getElementById("mpw").focus();
			return false;
		}
		document.getElementById("mname").focus();
	}
	*/
	
	//핸드폰
	if(document.memberjoin.mtel2.value.length==0 || document.memberjoin.mtel3.value.length==0){
		alert("핸드폰 번호를 입력하세요");
		document.getElementById("mtel2").focus();
		return false;
	}
	//주소
	if(document.memberjoin.maddrno.value.length==0){
		alert("우편번호를 입력하세요");
		document.getElementById("maddrno").focus();
		return false;
	}
	
	alert("회원가입을 완료하시겠습니까?");
	$("#memberjoin").attr("action","memberinsert.ec");
	$("#memberjoin").attr("method","get");
	$("#memberjoin").submit();
}

//주소(우편번호 찾기)
function addrCheck(){
	alert("addrCheck함수진입");
	var width = 500;
	var height = 600;
	daum.postcode.load(function(){
		new daum.Postcode({
			oncomplete: function(data){							
				console.log("새우편번호 >>> : " + data.zonecode);
				console.log("주소값 >>> : " + data.address);
				console.log("빌딩값 >>> : " + data.buildingName);	
				document.memberjoin.maddrno.value = data.zonecode;							
				document.memberjoin.maddr1.value = data.address;
				document.memberjoin.maddr2.value = data.buildingName;
			}	
		}).open({
			left: (window.screen.width / 2) - (width / 2),
			top: (window.screen.height / 2) - (height / 2),
		});						
	});
}
function pwCheck(){
	//비밀번호 확인
	if(document.memberjoin.mpw.value != document.memberjoin.mpw_r.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		document.getElementById("mpw").focus();
		return false;
	}else{
		alert("비밀번호가 일치합니다.");
	}
	
}
//아이디(이메일) 중복 체크
function idCheck(){
	var idVal =document.memberjoin.memail0.value +"@"+ document.memberjoin.memail1.value;
	console.log("idCheck()함수 진입");
	console.log("idVal>>>"+idVal)
	
	$.ajax({
		url:"./memberCheck.ec",
		type:"get",
		data:{mid : idVal},
		success: function(data){
			console.log(data);
			if(data==0){
				alert("사용가능한 아이디입니다");
				$("memail0").attr("readonly",true);
				$("memail1").attr("readonly",true);
				$("#idcheck").hide();
				$("ajaxResData").html("중복체크 완료");
				
			}else{
				alert("중복된 아이디입니다.");
				$("#memail0").val();
				$("#memail1").val();
				$("#memail0").focus();
				return false;
			}
		},
		error: function(request, status, error){
			console.log("error");
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
}

</script>
<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name="" />
</jsp:include>
</head>
<body>
<br><br><br>
<div class="container">
	<form name="memberjoin" id="memberjoin" method="get">
		<table border=1 align="center"  class="table table-striped">
				<div class="mem" align="center">
					<h1>회원가입</h1>
					<p align="right">
						<span class="required">*</span>표시는 필수 입력항목입니다.
					</p>
				</div>
				<tr>
					<td class="mem">
						<span class="required">*</span>회원아이디:
					</td>
					<td>
					<div class="row">
						<div class="col-md-3.5">
						&nbsp;&nbsp;&nbsp;
							<c:if test="${param.emailname ne null }">
								<input type="text" id="memail0" name="memail0" value="${param.emailname }" size=10 readonly />
							@
							<input type="text" id="memail1" name="memail1" value="${param.emailaddr }" size=10 readonly />
							</c:if>
							<c:if test="${param.emailname eq null }">
								<input type="text" id="memail0" name="memail0" value="" size=10 onfocus="this.value=''" />
							@
							<input type="text" id="memail1" name="memail1" value="" size=10 />
							</c:if>
						</div>
						<div class="col-md-6">
							<select name="lemail" onchange="emailCheck()">
								<option value="0">선택하세요</option>
								<option value="9">직접입력</option>
								<option>naver.com</option>
								<option>gmail.com</option>
							</select>
							<div>&nbsp;&nbsp;<input type="button" value="아이디 중복확인" id="idcheck" onclick="idCheck()" /></div>
						</div>
					</div>
						<div id="ajaxResData">아이디 중복체크하시오</div>  
					</td>
				</tr>
				<tr>
					<td class="mem">
						<span class="required">*</span>회원비밀번호:
					</td>
					<td>
						<input type="text" id="mpw" name="mpw" />
						</br>
						<input type="text" id="mpw_r" name="mpw_r" />
						<input type="button" value="비밀번호확인" onclick="pwCheck()" />
						<p>4자 이상 12자 이내의 영문/숫자 조합</p>
						</br>
					</td>
				</tr>
				<tr>
					<td class="mem">
						<span class="required">*</span>회원이름:
					</td>
					<td>
						<input type="text" id="mname" name="mname" value="${param.mname }" />
						</br>
					</td>
				</tr>

				<tr>
					<td class="mem">
						<span class="required">*</span>핸드폰
					</td>
					<td>
						<input type="text" name="mtel1" id="mtel1" value="" maxlength="3" class="join_input" style="width: 70px;" />
						&nbsp;-&nbsp;
						<input type="text" name="mtel2" id="mtel2" value="" maxlength="4" class="join_input" style="width: 70px;" />
						&nbsp;-&nbsp;
						<input type="text" name="mtel3" id="mtel3" value="" maxlength="4" class="join_input" style="width: 70px;" />
					</td>
				</tr>

				<tr>
					<td class="mem">
						<span class="required">*</span>주소
					</td>
					<td>
						<input type="text" id="maddrno" name="maddrno" size=6 />
						<input type="button" value="우편번호 찾기" onclick="addrCheck()" />
						(도로명주소)<br />
						<input type="text" id="maddr1" name="maddr1" size=35 />
						<br>
						<input type="text" id="maddr2" name="maddr2" size=35 />
						<br />
					</td>
				</tr>

				<tr>
					<td colspan=2 align="center">
						<input type="button" id="joincommit" value="등록" onclick="joinCommit()">
						<input type="reset" value="다시">
					</td>
				</tr>
		</table><br><br><br><br><br><br>
	</form>
	</div>
	<jsp:include page="../../../../footer.jsp" flush="true">
		<jsp:param value="" name="" />
	</jsp:include>
</body>
</html>