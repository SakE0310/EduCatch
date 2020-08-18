<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<style type="text/css">
.required {
	color: red;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
function joinCommit(){
	console.log("joinCommit함수 진입");
	alert("회원가입을 완료하시겠습니까?");
	$("#memberjoin").attr("action","memberinsert.ec");
	$("#memberjoin").submit();
}

</script>
<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name="" />
</jsp:include>
</head>
<body>
	<form name="memberjoin" id="memberjoin" method="get">
		<table border=1 align="center">
			<div class="join-wrap">
				<div class="mem" align="center">
					<h3 align="left">기본정보 입력</h3>
					<p align="right">
						<span class="required">*</span>표시는 필수 입력항목입니다.
					</p>
				</div>
				<tr>
					<td class="mem">
						<span class="required">*</span>회원아이디:
					</td>
					<td>
						<c:if test="${param.emailname ne null }">
							<input type="text" id="memail0" name="memail0" value="${param.emailname }" size=10 onfocus="this.value=''" readonly="readonly" />
						@
						<input type="text" id="memail1" name="memail1" value="${param.emailaddr }" size=10 readonly="readonly" />
						</c:if>
						<c:if test="${param.emailname eq null }">
							<input type="text" id="memail0" name="memail0" value="" size=10 onfocus="this.value=''" />
						@
						<input type="text" id="memail1" name="memail1" value="" size=10 />
						</c:if>
						<select name="lemail" onchange="emailCheck()">
							<option value="0">선택하세요</option>
							<option value="9">직접입력</option>
							<option>naver.com</option>
							<option>gmail.com</option>
						</select>
						<input type="button" value="아이디 중복확인" onclick="idCheck()" />
						</br>
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
						<select name="mtel1">
							<option value="010">010</option>
							<option value="017">017</option>
							<option value="016">016</option>
						</select>
						<input type="text" id="mtel2" name="mtel2" />
						<input type="text" id="mtel3" name="mtel3" />
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
			</div>
		</table>
	</form>
	<jsp:include page="../../../../footer.jsp" flush="true">
		<jsp:param value="" name="" />
	</jsp:include>
</body>
</html>