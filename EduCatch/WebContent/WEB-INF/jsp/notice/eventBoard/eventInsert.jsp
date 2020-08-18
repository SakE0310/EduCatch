<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8"">
<title>공지사항 등록페이지</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="/EduCatch/assets/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>

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
			elPlaceHolder : "econtent", //textarea에서 지정한 id와 일치해야 합니다. 
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
				oEditors.getById["econtent"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//==관리자가 등록버튼 클릭시 form 전송========
		$("#save").click(function() {
			oEditors.getById["econtent"].exec("UPDATE_CONTENTS_FIELD", []);
			
			if($('#eimg').val() != null && $('#eimg').val() != ""){
				$("#edit").attr("enctype","multipart/form-data");
			}
			
			$("#edit").attr("action","insertEvent.ec");
			$("#edit").attr("method","POST");
			$("#edit").submit();
		});
		
		//===관리자가 취소버튼을 누르면 실행========
		$("#listData").click(function() {
			console.log("취소버튼 누름");
			
			//이벤트 전체목록조회 페이지로 이동
			$("#edit").attr("action","listEvent.ec");
			$("#edit").attr("method","POST");
			$("#edit").submit();
			
		})//end of listData
	});
</script>

<style type="text/css">
</style>
<body>
	<!-- action/document/location -->
	<div class="container">
	<form id="edit">
		<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h2>event</h2></td>
			</tr>
			</table>
			<hr>
		</div>
		<table style="width: 90%" border="1" align="center" class="table">
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="esubject" name="esubject"
					style="width: 98%" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea name="econtent" id="econtent" title="내용"
						style="width: 100%; height: 415px; padding: 0; margin: 0;"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" value="찾아보기" id="eimg" name="eimg" /><br> 
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="save" value="등록" />
				 <input type="button" id="listData" value="취소" /> 
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