<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>Insert title here</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="/EduCatch/assets/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- function 함수 짜야함 -->

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ncontent", //textarea에서 지정한 id와 일치해야 합니다. 
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
				oEditors.getById["ncontent"].exec("PASTE_HTML", [ '${NoticeVO.ncontent}' ]);
			},
			fCreator : "createSEditor2"
		});
		//==관리자가 수정버튼 클릭시 form 전송========
		$("#updateData").click(function() {
			oEditors.getById["ncontent"].exec("UPDATE_CONTENTS_FIELD", []);
			
			$("#edit").attr("action","updateNotice.ec");
			$("#edit").attr("method","POST");
			$("#edit").submit();
		});
		
		//===관리자가 취소버튼을 누르면 실행========
		$("#listData").click(function() {
			console.log("취소버튼 누름");
			
			$("#edit").attr("action","listNotice.ec");
			$("#edit").attr("method","POST");
			$("#edit").submit();
			
		})//end of listData
	});
</script>

<style type="text/css">
</style>
<body>
	<!-- action/document/location -->
	<form id="edit">
		<table style="width: 50%" border="1">
		<input type="text" id="nno" name="nno" value="${NoticeVO.nno}" />
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="nsubject" name="nsubject" value="${NoticeVO.nsubject}"
					style="width: 98%" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea name="ncontent" id="ncontent" title="내용" 
						style="width: 100%; height: 400px; padding: 0; margin: 0;"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<img src="/EduCatch/assets/img/notice/${NoticeVO.nimg}" alt="사진업음"/><br>
					<input type="file" value="찾아보기" id="nimg" name="nimg" /><br> 
						
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="updateData" value="수정" />
				 <input type="button" id="deleteData" value="삭제" />
				 <input type="button" id="listData" value="취소" /> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>