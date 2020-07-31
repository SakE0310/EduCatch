<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script src ="/EduCatch/assets/js/service/HuskyEZCreator.js"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "context", //textarea에서 지정한 id와 일치해야 합니다. 
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
				oEditors.getById["context"].exec("PASTE_HTML", [ "" ]);
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
	
</head>
<body>
<!-- action/document/location -->
	<form id="edit" action="#" method="post" enctype="multipart/form-data">
		<table style="width: 50%" border="1">
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="title" name="title"
					style="width: 98%" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea name="context" id="context" title="내용"
						style="width: 100%; height: 400px; padding: 0; margin: 0;"></textarea>
				</td>
			</tr>
			<tr>
			<li><button type="button"><span style="margin-top:4px; margin-bottom:3px; margin-left:5px; font-size:7pt;">가나다라마바사<span style=" font-size:7pt;">(7pt)</span></span></button></li>
																
			<!-- 
				<td>첨부파일</td>
				<td>
					<input type="file" value="찾아보기" id="filename1" name="filename1" /><br> 
					<input type="file" value="찾아보기" id="filename2" name="filename2" /><br> 
					<input type="file" value="찾아보기" id="filename3" name="filename3" />
				</td>
				 -->
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="save" value="저장" />
				 <input type="reset" value="취소" /> 
				 <input type="button" value="임시저장" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>