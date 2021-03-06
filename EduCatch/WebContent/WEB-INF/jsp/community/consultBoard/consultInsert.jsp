<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<title>상담 게시판 입력</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script src ="/EduCatch/assets/js/service/HuskyEZCreator.js"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 테이블 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "cbcontent", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/EduCatch/assets/dist/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음),글씨체 포인트,정렬,색상등등
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {
				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["cbcontent"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			if(!validateForm())
				return;
			oEditors.getById["cbcontent"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#edit").attr("action","insertConsult.ec");
			//$("#edit").attr("enctype","multipart/form-data");
			$("#edit").attr("method","POST");
			$("#edit").submit();
		});
		
		//취소버튼 클릭시 form 전송
		$("#cancel").click(function() {

			$("#edit").attr("action","listConsult.ec");
			$("#edit").attr("method","POST");
			$("#edit").submit();
		});
		
		$("#searchAcademy").click(function(){
			
			$("#ano").val(ano);
			window.open("","pop","width=480 height=250");
			$("#edit").attr("action","cacademyList.ec");
			$("#edit").attr("target","pop");
			$("#edit").attr("method","POST");
			$("#edit").submit();
			
		});

	});

	function setChildValue(aname){

	      var aname1=aname.split(",");
	      console.log("aname1.index[0] >>> "+aname1[0]);
	      console.log("aname1.index[1] >>> "+aname1[1]);
	      document.getElementById("aname").value = aname1[0];
	      document.getElementById("ano").value = aname1[1];

	}
	
	function validateForm(){
		if($("#cbsubject").val().replace(/\s/g,"")==""){
			alert('제목을 입력해주세요.');
			return false;
		}
		if($("#aname").val().replace(/\s/g,"")==""){
			alert('학원명을 입력해주세요.');
			return false;
		}
		
// 		if($("#rbcontent").val().replace(/\s/g,"")==""){
// 			alert('내용을 입력해주세요.');
// 			return false;
// 		}

		return true;
	}
</script>
<body>
<%


	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
		
		System.out.println("reviewinsert.jsp   mvo >>>> "+mvo);
		System.out.println("reviewinsert.jsp   mvo.getMid >>>> "+mvo.getMid());
	}
	

%>
	<div class="container">
<!-- action/document/location -->
	<form id="edit">
		<div>
		<input type="hidden" id="cbname" name="cbname" value="<%= mvo.getMname()%>">
		<input type="hidden" id="ano" name="ano">
		<input type="hidden" id="mid" name="mid" value="<%= mvo.getMid()%>">
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>CONSULT</h1></td>
			</tr>
			</table>
			<hr>
		</div>
		<table style="width: 90%" border="1" align="center" class="table">
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="cbsubject" name="cbsubject" placeholder="제목을 입력하세요"
					style="width: 98%" /></td>
			</tr>
			<tr>
				<td style="width: 100px">학원명</td>
				<td><input type="text"  id="aname" name="aname"  placeholder="학원명을 입력하세요"
					style="width: 90%" />
					<input type="button"  id="searchAcademy" value="검색" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="cbcontent" id="cbcontent" title="내용"
						style="width: 100%; height: 400px; padding: 0; margin: 0;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="save" value="등록" />
				 <input type="button" id="cancel" value="취소" /> 
				</td>
			</tr>
		</table>
	</form>
	</div>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>