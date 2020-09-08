<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.FreeVO"  %>
<%@ page import="com.kosmo.educatch.vo.MemberVO"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="/EduCatch/assets/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<!-- 테이블 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #140C40;
	    color: #ffffff;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 1px solid #140C40;
	    height: 30px;
	    font-size: 15px;
	     border-radius: 0.5em;
		}
	.btn_box_01 {
	    width: auto;
	    padding: 3px 10px;
	}	
	#margin_div{
		margin-bottom:38px; 
	}

</style>
<script type="text/javascript">
	/*
	function deleteCommit(){
		console.log("deleteCommit함수 진입");
		alert("삭제하시겠습니까??");
		$("#edit").attr("action","deletefreeboard.ec");
		$("#edit").submit();
	}
	*/
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "fbcontent", //textarea에서 지정한 id와 일치해야 합니다. 
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
				oEditors.getById["fbcontent"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//저장버튼 클릭시 form 전송
		$("#updatecommit").click(function() {
			oEditors.getById["fbcontent"].exec("UPDATE_CONTENTS_FIELD", []);
			console.log("updateCommit함수 진입");
			
			if($("#img").val()!=null && $("#img").val()!=""){
				$("#edit").attr("enctype","multipart/form-data");
			}
			$("#edit").attr("action","updatefreeboard.ec");
			$("#edit").attr("method","post");
			$("#edit").submit();
		});
	});
</script>

</head>
<body>
<%
HttpSession hs = request.getSession(false);
MemberVO mvo = null;
if(hs != null){
	mvo = (MemberVO)hs.getAttribute("user");
}
%>

	<!-- action/document/location -->
	<!-- enctype="multipart/form-data" -->
	<div class="container">
	<% 
		
			Object obj = request.getAttribute("freevo"); 
			if(obj!=null){
				FreeVO freevo = (FreeVO)obj;
			%>
	<form id="edit" name="edit">
		<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>자유게시판</h1></td>
			</tr>
			</table>
			<hr>
		</div>
		<table style="margin-left: auto; margin-right: auto;" border="1" width="50%"class="table">
			<input type="hidden" id="fbno" name="fbno" value="<%= freevo.getFbno() %>"/> 
			<input type="hidden" id="mno" name="mno" value="<%= mvo.getMno() %>"/> 
			<tr>
				<td style="width: 100px">글번호</td>
				<td><input type="text" id="fbno" name="fbno"
					style="width: 98%"/ value=<%=freevo.getFbno() %>></td>
			</tr>
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="fbsubject" name="fbsubject"
					style="width: 98%" value=<%=freevo.getFbsubject() %> /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea name="fbcontent" id="fbcontent" title="내용"
						style="width: 50%; height: 400px; padding: 0; margin: 0;"><%=freevo.getFbcontent() %></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					현재 이미지:<img src = "/EduCatch/assets/img/freeImg/<%=freevo.getFbimg() %>" border=0 width="100" height="100"><br>
					<input type="hidden" name="fbimg" id="fbimg" value=<%=freevo.getFbimg() %> />
					수정할 이미지 파일:<input type="file" name="img" id="img" />
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="updatecommit" value="수정" onclick="updateCommit()"  class=" btn_light btn_box_01" /> 
				 <!-- input type="button" id="deletecommit" value="삭제" onclick="deleteCommit()" class=" btn_light btn_box_01" / --> 
				 <!-- input type="button" id="save" value="임시저장" / -->
				</td>
			</tr>
			<%
			} 
			%>
		</table>
	</form>
	</div>
	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>