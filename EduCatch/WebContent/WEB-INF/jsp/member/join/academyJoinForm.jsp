<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원관리자가입 폼</title>
<style type="text/css">
	.required{
		color:red;
	}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">

function joinCommit(){
	console.log("joinCommit함수 진입");
	alert("학원관리자가입을 완료하시겠습니까?");
	if($("#mimg").val()!=null && $("#mimg").val() !=""){
		alert("정상적인 이미지 첨부가 되지않을 시 관리자 가입이 거부될 수 있습니다");
		$("#amemberjoin").attr("enctype","multipart/form-data");
		$("#amemberjoin").attr("action","amemberinsert.ec");
		$("#amemberjoin").attr("method","post");
		$("#amemberjoin").submit();
	}else{
		alert("*학원관리자를 등록 할 경우 해당 이미지파일(명함,재직증명서,사업자등록증)을 올려주셔야합니다.");
	}
}

</script>
</head>
<body>
<form name="amemberjoin" id="amemberjoin">
		<table border=1>
			<tr>
				<td class="mem"><span class="required">*</span>회원번호:</td>
				<td>
					<input type="text" id="mno" name="mno" /></br>
				</td>
			</tr>
			<tr>
				<td class="mem"><span class="required">*</span>회원아이디:</td>
				<td>
					<input type="text" id="memail0" name="memail0" value="이메일"size=10 onfocus="this.value=";"/> @
					<input type="text" id="memail1" name="memail1" value="" size=10  /> 
					<select name="lemail" onchange="emailCheck()">
						<option value="0">선택하세요</option>
						<option value="9">직접입력</option>
						<option>naver.com</option>
						<option>gmail.com</option>
					</select>
					<input type="button" value="아이디 중복확인" onclick="idCheck()"/></br>
				</td>
			</tr>
			<tr>
				<td class="mem"><span class="required">*</span>회원비밀번호:</td>
				<td>
					<input type="text" id="mpw" name="mpw"/></br>
					<input type="text" id="mpw_r" name="mpw_r"/>
					<input type="button" value="비밀번호확인" onclick="pwCheck()"/></br>
				</td>
			</tr>
			<tr>
				<td class="mem"><span class="required">*</span>회원이름:</td>
				<td>
					<input type="text" id="mname" name="mname"/></br>
				</td>
			</tr>
			
			<tr>
				<td class="mem"><span class="required">*</span>핸드폰</td>
				<td>
					<select name="mtel1">
						<option value="010">010</option>
						<option value="017">017</option>
						<option value="016">016</option>
					</select>
					<input type="text" id="mtel2" name="mtel2"/>
					<input type="text" id="mtel3" name="mtel3"/>
				</td>
			</tr>
			
			<tr>
				<td class="mem"><span class="required">*</span>주소</td>
				<td>
					 <input type="text" id="maddrno" name="maddrno" size=6/>
					 <input type="button" value="우편번호 찾기" onclick="addrCheck()"/>(도로명주소)<br/>
					 <input type="text" id="maddr1" name="maddr1" size=35 /><br>							 
					 <input type="text" id="maddr2" name="maddr2" size=35 /><br/>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" value="찾아보기" id="mimg" name="mimg" /><br> 
				</td>
			</tr>
			<tr>						
				<td colspan=2 align="center">
					<input type="button" id="joincommit" value="등록" onclick="joinCommit()">
					<input type="reset" value="다시">
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>