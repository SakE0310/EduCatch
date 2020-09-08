<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<style type="text/css">
@media all and (max-width:767px) {
	#memail0{
		width:68px;
		margin-right:0px;
	}
	#memail1{
		width:68px;
	}
	.gol{
		margin-left:38px;
	}
	.nice-select{
		width:78px;
		height: 30px;
		line-height: 50px;
	}
	.current{
		font-size: 11px;
		margin-right:18px;
		margin-bottom:18px;
	}
	#idcheck{
		font-size:11px;
		width:100px;
	}
	#pw{
		font-size:11px;
		width:100px;
		margin-left:50px;
	}
	#mname{
		width:89px;
	}
	#mtel2{
		width:45px;
	}
	#mtel3{
		margin-left:20px;
		width:45px;
	}	
	
	#maddrno{
		width:68px;
	}
	#mpw, #mpw_r{
		width:89px;
	}
	
	#addrfind{
		font-size:11px;
		width:90px;
		margin-left:55px;
	}
	.mem{
		font-size:14px;
	}
	p{
		font-size:10px;
	}
	
}
@media all and (min-width:1024px) {
}
.required {
	color: red;
}
.memberin{
	margin-top:44px;
	margin-bottom:40px;
}
#memail0{
	margin-right:3px;
}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
		        src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//비밀번호값이 바뀌면 다시 비밀번호 확인이 필요
	$(".pw").on('change',function(){
		console.log("비밀번호 확인필요");
		$("#pw_check").val("N");
	});
	
	//아이디 변경시 다시 버튼확인
	$(".id").on('change',function(){
		console.log("아이디 중복체크 확인필요");
		$("#id_check").val("N");
	});
});
function joinCommit(){
	console.log("joinCommit함수 진입");
	
	//이름
	if(document.memberjoin.mname.value.length<=1){
		alert("이름을 입력해주세요");
		document.getElementById("mname").focus();
		return false;
	}
	else{
		var name = /^[가-힣]{2,4}$/;
		if(!name.test(document.memberjoin.mname.value)){
			alert("이름 형식이 올바르지 않습니다");
			document.getElementById("mname").focus();
			return false;
		}
	}
	//아이디(이메일)
	if(document.memberjoin.memail0.value==""){
		alert("아이디를 입력해주세요");
		document.getElementById("memail0").focus();
		return false;
	}
	/*
	else{
		var email = document.memberjoin.memail0.value+'@'+document.memberjoin.memail.value;
		console.log(email);
		var exp = /^[a-zA-Z0-9_-]+\@[a-zA-Z]+\.[a-zA-Z]+$/;
		if (!exp.test(email)) {
			alert("이메일 형식이 올바르지 않습니다.");
			document.getElementById("memail1").focus();
			return false;
		}
	}
	*/
	
	//아이디 중복체크 버튼 누를때
	if(document.memberjoin.id_check.value != "idcheckY"){
		alert("아이디 중복체크를 확인해주세요");
		return false;
	}
    
	//비밀번호
	if(document.memberjoin.mpw.value==""){
		alert("비밀번호를 입력하세요");
		document.getElementById("mpw").focus();
		return false;
	}else{
		var regex =/^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!regex.test(document.memberjoin.mpw.value)){
			alert("비밀번호형식에 맞게 입력해주세요");
			document.getElementById("mpw").focus();
			return false;
		}
	}
	//비밀번호 확인버튼
	if(document.memberjoin.pw_check.value != "pw_checkY"){
		alert("비밀번호 확인 버튼을 눌러주세요");
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
	}else{
		var mtel = document.memberjoin.mtel1.value+'-'+document.memberjoin.mtel2.value+'-'+document.memberjoin.mtel3.value;	
		console.log(mtel);
		var regExp =/^\d{3}-\d{3,4}-\d{4}$/;
		if(!regExp.test(mtel)){
			alert("핸드폰 번호를 제대로 입력해주세요");
			documemt.getElementById("mtel2").value();
			return false;
		}
	}
		
		
	//우편번호
	if(document.memberjoin.maddrno.value.length==0){
		alert("우편번호를 입력하세요");
		document.getElementById("maddrno").focus();
		return false;
	}
	//기본주소
	if(document.memberjoin.maddr1.value.length==0){
		alert("기본주소를 입력하세요");
		document.getElementById("maddr1").focus();
		return false;
	}
	
	alert("회원가입을 완료하시겠습니까?");
	$("#memberjoin").attr("action","memberinsert.ec");
	$("#memberjoin").attr("method","get");
	$("#memberjoin").submit();


}

function backButton(){
	history.go(-1);
}
/*
$(document).ready(function(){
	console.log(">>>>");
	$('input[type="text"]').each(function(){

		this.value = $(this).attr('title');
		$(this).addClass('text-label');

		$(this).focus(function(){
			if(this.value == $(this).attr('title')) {
				this.value = '';
				$(this).removeClass('text-label');
			}
		});

		$(this).blur(function(){
			if(this.value == '') {
				this.value = $(this).attr('title');
				$(this).addClass('text-label');
			}
		});
	});
});
*/
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
	//var mpw = document.getElementById("mpw");
	//var mpw_r = document.getElementById("mpw_r");
	if(document.memberjoin.mpw.value != document.memberjoin.mpw_r.value){
	//if(mpw != mpw_r){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		document.getElementById("mpw").focus();
		mpw.value = "";
		mpw_r.value="";
		mpw.focus();
		return false;
	}else{
		var regex =/^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!regex.test(document.memberjoin.mpw.value)){
			alert("비밀번호형식에 맞게 입력해주세요");
			document.getElementById("mpw").focus();
			return false;
		}else{
			alert("비밀번호가 일치합니다.");
			document.memberjoin.pw_check.value = "pw_checkY";
			return true;
		}
	}
	
}
	
//이메일 select박스 클릭시	
function emailCheck(){
	alert(" emailCheck 함수 진입");
	var eVal = document.memberjoin.memail.options[document.memberjoin.memail.selectedIndex].value;
	alert("eVal >>> : " + eVal);				
	if (eVal == '0'){								
		document.memberjoin.memail1.readOnly = true;
		document.memberjoin.memail1.value = "";
	}
	if (eVal == '9'){
		document.memberjoin.memail1.readOnly = false;
		document.memberjoin.memail1.value = "";
		document.memberjoin.memail1.focus();
	}else{
		document.memberjoin.memail1.readOnly = true;
		document.memberjoin.memail1.value = eVal;
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
				//$("#memail0").attr("readonly",true);
				//$("#memail1").attr("readonly",true);
				//$("#idcheck").hide();
				$("#id_check").val("idcheckY");
				$("#ajaxResData").html("중복체크 완료");
				
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
	<input type="hidden" id="msnsid" name="msnsid" value="${param.msnsid}">
	<input type="hidden" id="msnstype" name="msnstype" value="${param.msnstype}">
		<table align="center"  class="table table-condensed">
				<div align="center">
					<h1 class="memberin">회원가입</h1>
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
						&nbsp;&nbsp;&nbsp;
							<c:if test="${param.emailname ne null }">
						<div class="col-xs-2">
								<input type="text" id="memail0" name="memail0" value="${param.emailname }" title="" class="form-control" readonly />
						</div>
						<div class="gol">
								@
						</div>		
						<div class="col-xs-2">
							<input type="text" id="memail1" name="memail1" value="${param.emailaddr }" title="" class="form-control" readonly />
						</div>
							</c:if>
							<c:if test="${param.emailname eq null }">
						<div class="col-xs-2">
								<input type="text" id="memail0" name="memail0" value="" size=10 onfocus="this.value=''" title="" class="form-control id" />
						</div>
						<div class="gol">
								@
						</div>
						<div class="col-xs-2">
							<input type="text" id="memail1" name="memail1" value="" size=10 title="" class="form-control id" />
						</div>
							</c:if>
						<div class="col-md-6">
							<select name="memail" onchange="emailCheck()">
								<option value="0">선택하세요</option>
								<option value="9">직접입력</option>
								<option>naver.com</option>
								<option>gmail.com</option>
							</select>
							<input type="hidden" id="id_check" name="id_check" value="N">
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
					<div class=row>
					<div class="col-xs-2">
						<input type="password"  class="form-control pw" id="mpw" name="mpw" />
					</div>
					</div>
					<div class="row">
					<div class="col-xs-2">
 						<input type="password" class="form-control pw" id="mpw_r" name="mpw_r"/>
					</div>
					<div class="col-xs-2">
						<input type="hidden" id="pw_check" name="pw_check" value ="N">
						<input type="button" value="비밀번호확인" onclick="pwCheck()" id="pw" />
					</div>
					</div>
						<p>문자,숫자,특수기호 포함 6~12자리를 입력하세요</p>
					</td>
				</tr>
				<tr>
					<td class="mem">
						<span class="required">*</span>회원이름:
					</td>
					
					<td>
					<div class="form-group row">
						<div class="col-xs-2">
						<input class="form-control" type="text" title="" id="mname" name="mname" value="${param.mname }" />
						</div>
					</div>
					</td>
				</tr>

				<tr>
					<td class="mem">
						<span class="required">*</span>핸드폰
					</td>
					<td>
						<select name="mtel1">
							<option value="010">010</option>
							<option value="017">017</option>
							<option value="016">016</option>
						</select>
						<div class="col-xs-2">
						<input type="text" title="" id="mtel2" name="mtel2" class="form-control" />
						</div>
						<div class="col-xs-2">
						<input type="text" title="" id="mtel3" name="mtel3" class="form-control" />
						</div>
					</td>
				</tr>

				<tr>
					<td class="mem">
						<span class="required">*</span>주소
					</td>
					<td>
					<div class="row">
					<div class="col-xs-2">
						<input type="text" id="maddrno" name="maddrno" title="우편번호" size=6 class="form-control" />
					</div>
						<input type="button" value="우편번호 찾기" onclick="addrCheck()" id="addrfind" />
						<br/>
					</div>
					<div class="row">	
					<div class="col-xs-7">
						<input type="text" id="maddr1" name="maddr1" title="도로명주소" size=35 class="form-control" />
						<br>
						<input type="text" id="maddr2" name="maddr2" size=35 title="상세주소" class="form-control" />
						<br />
					</div>
					 </div>
					</td>
				</tr>

				<tr>
					<td colspan=2 align="center">
						<input type="button" id="joincommit" value="등록" onclick="joinCommit()">
						<input type="button" id="backbutton" value="이전" onclick="backButton()">
					</td>
				</tr>
		</table>
		<br><br><br><br>
	</form>
	</div>
		<br><br><br>
	<jsp:include page="../../../../footer.jsp" flush="true">
		<jsp:param value="" name="" />
	</jsp:include>
</body>
</html>