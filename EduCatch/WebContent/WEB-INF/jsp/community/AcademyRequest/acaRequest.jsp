<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name="" />
</jsp:include>
<style type="text/css">
#form {
	margin: auto;
}

input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	ajaxGetMajor();
	
	$('#ex_filename').on('change', function(){
		
		var filename;
		// 값이 변경되면 
		if(window.FileReader){ 
			// modern browser 
			filename = $(this)[0].files[0].name; 
		} else { 
			// old IE 
			filename = $(this).val().split('/').pop().split('\\').pop(); 
			// 파일명만 추출 
		} // 추출한 파일명 삽입
		var fileType = filename.split(".")[1];
		fileType = fileType.toLowerCase();
		if(fileType=='jpg' || fileType == 'gif' || fileType == 'png' || fileType == 'jpeg' || fileType == 'bmp'){
			
		}else{
			alert('이미지 파일만 선택할 수 있습니다.')
			return false;
		}
		$('#alogo').val(filename);
		
	});
	
	$('#sendEmail').on('click', function(){
		if($('#alogo').val() != null && $('#alogo').val() != ""){
			$('#academyInfo').attr("enctype", "multipart/form-data");
		}else{
		
		}
		$('#academyInfo').attr("action", "sendAcademyInfo.ec");
		$('#academyInfo').attr("method", "POST");
		$('#academyInfo').submit();
	});
	
	$(".form-select.major").on('change', 'select', function() {
		  var setMajor = $("#cmajor").val();
		  console.log('setmajor >>> ' + setMajor);
		  ajaxGetMinor(setMajor);
	});
});

function addrCheck(){
	new daum.Postcode({
		oncomplete: function(data){
			console.log("새우편번호 >>> : " + data.zonecode);
			console.log("주소값 >>> : " + data.address);
			console.log("빌딩값 >>> : " + data.buildingName);	
			$('#aaddrno').val(data.zonecode);
			$('#aaddr1').val(data.address);
			$('#aaddr2').val(data.buildingName);
		}
	}).open();
}

function ajaxGetMajor(){
	$.ajax({
		url : "getCmajor.ec",
	}).done(function(resultParam){
		var str="";
		for(i in resultParam.major){
			console.log(i);
			var cmajor = resultParam.major[i].cmajor;
			str += "<option value='"+cmajor+"'>"+cmajor+"</option>\n";
		}
		$('select#cmajor').html(str);
		$('select#cmajor').niceSelect('update');
		ajaxGetMinor(resultParam.major[0].cmajor);
		var a = resultParam.major;
	}).fail(function(resultParam){
		alert("초기화에 문제가 발생하였습니다.");
	});

}

function ajaxGetMinor(param){
	console.log("param >>> " + param);
	$.ajax({
		url : "getCminor.ec",
		data : {
			"major" : param
		}
		
	}).done(function(resultParam){
		console.log("getMinor >>> ");
		var str="";
		for(i in resultParam.minor){
			console.log(i);
			var cmajor = resultParam.minor[i].cminor;
			str += "<option value='"+cmajor+"'>"+cmajor+"</option>\n";
		}
		$('select#cminor').html(str);
		$('select#cminor').niceSelect('update');
	}).fail(function(resultParam){
		alert("초기화에 문제가 발생하였습니다.");
	});

}
</script>
</head>
<body>
<%
	Object obj = null;
	obj = request.getAttribute("resultStr");
	String str = (String)obj;
	if(str != null && str != "null"){
		out.println("<script>\n");
		out.println("alert('" + str + "');");
		out.println("location.href='AcaReq.ec'");
		out.println("</script>\n");
	}
%>
	<main>
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-lg-8 col-md-8" id="form">
						<h3 class="mb-30">학원정보 등록요청</h3>
						<form name="academyInfo" id="academyInfo">
							<div class="mt-10">
								<input type="email" name="email" placeholder="Email 주소"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Email 주소'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<input type="text" name="aname" placeholder="학원이름"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '학원이름'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<input type="text" name="atel" placeholder="학원 전화번호"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '학원 전화번호'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<div class="form-select major" id="default-select">
									<select id="cmajor">
										<option value="">분야구분</option>
										<option value="2">2</option>
									</select>
								</div>
							</div>
							<div class="mt-10">
								<div class="form-select minor" id="default-select">
									<select id="cminor">
										<option value=""></option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="mt-10 col">
									<input type="text" name="aaddrno" id="aaddrno" placeholder="우편번호"
										onblur="this.placeholder = '우편번호'" required
										class="single-input" readonly>
								</div>
								<div class="mt-10 col">
									<a href="javascript:addrCheck();" class="genric-btn primary">찾기</a>
								</div>
							</div>
							<div class="mt-10">
								<input type="text" name="aaddr1" id="aaddr1" placeholder="주소"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '주소'" required class="single-input"
									readonly>
							</div>
							<div class="mt-10">
								<input type="text" name="aaddr2" id="aaddr2" placeholder="상세주소"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '상세주소'" required
									class="single-input">
							</div>
							<div class="row">
								<div class="mt-10 col">
									<input type="text" name="alogo" id="alogo" placeholder="로고이미지"
										onblur="this.placeholder = '로고이미지'" required
										class="single-input upload-name" readonly>
								</div>
								<div class="mt-10 col">
									<label for="ex_filename" class="genric-btn primary">찾기</label>
									<input type="file" id="ex_filename" name="file" class="upload-hidden">
								</div>
							</div>
							<div class="form-group mt-3">
                                <button type="button" id="sendEmail" class="genric-btn success-border">Send</button>
                            </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../../../../footer.jsp" flush="true">
		<jsp:param value="" name="" />
	</jsp:include>
</body>
</html>