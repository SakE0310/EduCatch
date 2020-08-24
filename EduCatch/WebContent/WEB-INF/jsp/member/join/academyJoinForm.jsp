<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원관리자가입 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript"
		        src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
	.required{
		color:red;
	}
	.imgmes{
		color:red;
	}
	.acain{
		margin-top:54px;
		margin-bottom:40px;
		
	}
	
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">

function joinCommit(){
	console.log("joinCommit함수 진입");
	
	//이름
	if(document.amemberjoin.mname.value.length<=1){
		alert("이름을 입력해주세요");
		document.getElementById("mname").focus();
		return false;
	}
	
	//아이디(이메일)
	if(document.amemberjoin.memail0.value==""){
		alert("아이디를 입력해주세요");
		document.getElementById("memail0").focus();
		return false;
	}

	//비밀번호
	if(document.amemberjoin.mpw.value==""){
		alert("비밀번호를 입력하세요");
		document.getElementById("mpw").focus();
		return false;
	}
	
	if(document.amemberjoin.mpw_r.value==""){
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
	if(document.amemberjoin.mtel2.value.length==0 || document.amemberjoin.mtel3.value.length==0){
		alert("핸드폰 번호를 입력하세요");
		document.getElementById("mtel2").focus();
		return false;
	}
	//주소
	if(document.amemberjoin.maddrno.value.length==0){
		alert("우편번호를 입력하세요");
		document.getElementById("maddrno").focus();
		return false;
	}
	
	//이미지 파일
	if($("#mimg").val()!=null && $("#mimg").val() !=""){
		alert("정상적인 이미지 첨부가 되지않을 시 관리자 가입이 거부될 수 있습니다");
		alert("학원관리자가입을 완료하시겠습니까?");
		$("#amemberjoin").attr("enctype","multipart/form-data");
		$("#amemberjoin").attr("action","amemberinsert.ec");
		$("#amemberjoin").attr("method","post");
		$("#amemberjoin").submit();
	}else{
		alert("*학원관리자를 등록 할 경우 해당 이미지파일(명함,재직증명서,사업자등록증)을 올려주셔야합니다.");
	}
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
				document.amemberjoin.maddrno.value = data.zonecode;							
				document.amemberjoin.maddr1.value = data.address;
				document.amemberjoin.maddr2.value = data.buildingName;
			}	
		}).open({
			left: (window.screen.width / 2) - (width / 2),
			top: (window.screen.height / 2) - (height / 2),
		});						
	});
}

function pwCheck(){
	//비밀번호 확인
	var mpw = document.getElementById("mpw");
	var mpw_r = document.getElementById("mpw_r");
	//if(document.memberjoin.mpw.value != document.memberjoin.mpw_r.value){
	if(mpw != mpw_r){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		document.getElementById("mpw").focus();
		mpw.value = "";
		mpw_r.value="";
		mpw.focus();
		return false;
	}else{
		alert("비밀번호가 일치합니다.");
		return true;
	}
	
}
	
//이메일 select박스 클릭시	
function emailCheck(){
	alert(" emailCheck 함수 진입");
	var eVal = document.amemberjoin.memail.options[document.amemberjoin.memail.selectedIndex].value;
	alert("eVal >>> : " + eVal);				
	if (eVal == '0'){								
		document.amemberjoin.memail1.readOnly = true;
		document.amemberjoin.memail1.value = "";
	}
	if (eVal == '9'){
		document.amemberjoin.memail1.readOnly = false;
		document.amemberjoin.memail1.value = "";
		document.amemberjoin.memail1.focus();
	}else{
		document.amemberjoin.memail1.readOnly = true;
		document.amemberjoin.memail1.value = eVal;
	}				
}

//아이디(이메일) 중복 체크
function idCheck(){
		
	var idVal =document.amemberjoin.memail0.value +"@"+ document.amemberjoin.memail1.value;
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
				$("#memail0").attr("readonly",true);
				$("#memail1").attr("readonly",true);
				$("#idcheck").hide();
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
	<jsp:param value="" name=""/>
	</jsp:include>
</head>
<body>
<div class="container">
<form name="amemberjoin" id="amemberjoin">
		<table align="center" class="table table-condensed">
			<h1 align="center" class="acain">학원 관리자 등록</h1>
			<tr>
				<td class="mem"><span class="required">*</span>회원아이디:</td>
				<td>
				<div class="row">
					<div class="col-xs-2">
					<input type="text" id="memail0" name="memail0" value="이메일"size=10 onfocus="this.value=''" class="form-control" /> 
					</div>
					@
					<div class="col-xs-2">
					<input type="text" id="memail1" name="memail1" value="" size=10 class="form-control" /> 
					</div>
					<div class="col-xs-4">
					<select name="memail" onchange="emailCheck()">
						<option value="0">선택하세요</option>
						<option value="9">직접입력</option>
						<option>naver.com</option>
						<option>gmail.com</option>
					</select>
					<div>&nbsp;&nbsp;<input type="button" value="아이디 중복확인" onclick="idCheck()"/></br></div>
				</div>
				</div>
				</td>
			</tr>
			<tr>
				<td class="mem">
						<span class="required">*</span>회원비밀번호:
					</td>
					<td>
					<div class=row>
					<div class="col-xs-2">
						<input type="text"  class="form-control" id="mpw" name="mpw" />
					</div>
					</div>
					<div class="row">
					<div class="col-xs-2">
 						<input type="text" class="form-control" id="mpw_r" name="mpw_r"/>
					</div>
					<div class="col-xs-2">
						<input type="button" value="비밀번호확인" onclick="pwCheck()" />
					</div>
					</div>
						<p>4자 이상 12자 이내의 영문/숫자 조합</p>
					</td>
			</tr>
			<tr>
				<td class="mem">
						<span class="required">*</span>회원이름:
					</td>
					
					<td>
					<div class="form-group row">
						<div class="col-xs-2">
						<input class="form-control" type="text" id="mname" name="mname" value="${param.mname }" />
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
						<input type="text" id="mtel2" name="mtel2" class="form-control" />
						</div>
						<div class="col-xs-2">
						<input type="text" id="mtel3" name="mtel3" class="form-control" />
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
						<input type="text" id="maddrno" name="maddrno" size=6 class="form-control" />
					</div>
						<input type="button" value="우편번호 찾기" onclick="addrCheck()" />
						(도로명주소)<br/>
					</div>
					<div class="row">	
					<div class="col-xs-7">
						<input type="text" id="maddr1" name="maddr1" size=35 class="form-control" />
						<br>
						<input type="text" id="maddr2" name="maddr2" size=35 class="form-control" />
						<br />
					</div>
					 </div>
					</td>
			</tr>
			<tr>
				<td class="mem"><span class="required">*</span>첨부파일</td>
				<td>
					<input type="file" value="찾아보기" id="mimg" name="mimg" /><br> 
					<p class="imgmes">정상적인 이미지 첨부가 되지않을 시 관리자 가입이 거부될 수 있습니다</p>
				</td>
			</tr>
			<tr>						
				<td colspan=2 align="center">
					<input type="button" id="joincommit" value="등록" onclick="joinCommit()">
					<input type="reset" value="다시">
				</td>
			</tr>	
		</table>
		<br><br><br><br>
	</form>
	</div>
		<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>