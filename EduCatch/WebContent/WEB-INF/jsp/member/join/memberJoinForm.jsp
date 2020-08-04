<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script type="text/javascript">
function joinCommit(){
	console.log("joinCommit함수 진입");
	alert("회원가입을 완료하시겠습니까?");
	$("#memberjoin").attr("action","memberinsert.ec");
	$("#memberjoin").submit();
}

</script>
</head>
<body>
<form name="memberjoin" id="memberjoin">
		<table border=1>
			<tr>
				<td class="mem">회원번호:</td>
				<td>
					<input type="text" id="mno" name="mno" disabled/></br>
				</td>
			</tr>
			<tr>
				<td class="mem">회원아이디:</td>
				<td>
					<input type="text" id="mid" name="mid">
					<input type="button" value="아이디 중복확인" onclick="idCheck()"/></br>
				</td>
			</tr>
			<tr>
				<td class="mem">회원비밀번호:</td>
				<td>
					<input type="text" id="mpw" name="mpw"/></br>
					<input type="text" id="mpw_r" name="mpw_r"/>
					<input type="button" value="비밀번호확인" onclick="pwCheck()"/></br>
				</td>
			</tr>
			<tr>
				<td class="mem">회원이름:</td>
				<td>
					<input type="text" id="mname" name="mname"/></br>
				</td>
			</tr>
			
			<tr>
				<td class="mem">핸드폰</td>
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
				<td class="mem">주소</td>
				<td>
					 <input type="text" id="maddrno" name="maddrno" size=6/>
					 <input type="button" value="우편번호 찾기" onclick="addrCheck()"/>(도로명주소)<br/>
					 <input type="text" id="maddr1" name="maddr1" size=35 /><br>							 
					 <input type="text" id="maddr2" name="maddr2" size=35 /><br/>
				</td>
			</tr>
			
			<tr>						
				<td colspan=2 align="center">
					<input type="button" value="등록" onclick="joinCommit()">
					<input type="reset" value="다시">
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>