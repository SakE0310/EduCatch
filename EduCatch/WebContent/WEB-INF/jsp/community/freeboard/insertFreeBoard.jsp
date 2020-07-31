<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="../assets/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<!-- function 함수 짜야함 -->

<script type="text/javascript">
	function insertCommit(){
		console.log("insertCommit함수 진입");
		$("#edit").attr("action","insertfreeboard.ec");
		$("#edit").submit();
	}
	
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "fbcontent", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/EduCatch/WebContent/assets/dist/SmartEditor2Skin.html",
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
				oEditors.getById["fbcontext"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#edit").submit();
		});
	});
</script>

<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
	<!-- action/document/location -->
	<!-- enctype="multipart/form-data" -->
	<form id="edit" name="edit" action="#" method="post">
		<table style="width: 50%" border="1">
			<tr>
				<td style="width: 100px">글번호</td>
				<td><input type="text" id="fbno" name="fbno"
					style="width: 98%"/></td>
			</tr>
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="fbsubject" name="fbsubject"
					style="width: 98%" /></td>
			</tr>
			<tr>
				<td style="width: 100px">작성자</td>
				<td><input type="text" id="fbname" name="fbname"
					style="width: 98%" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea name="fbcontent" id="fbcontent" title="내용"
						style="width: 50%; height: 400px; padding: 0; margin: 0;"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" value="찾아보기" id="fbimg" name="fbimg" /><br> 
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="insertcommit" value="등록완료" onclick="insertCommit()" />
				 <input type="button" id="save" value="임시저장" />
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>