<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
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
<title>후기 게시판 수정</title>
<style type="text/css">

</style>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script src ="/EduCatch/assets/js/service/HuskyEZCreator.js"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "rbcontent", //textarea에서 지정한 id와 일치해야 합니다. 
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
				oEditors.getById["rbcontent"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});
		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			alert("<<<>>>");
			oEditors.getById["rbcontent"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#edit").attr("action","updateReview.ec");
			$("#edit").attr("method","POST");
			$("#edit").submit();
		});
		
		$("#searchAcademy").click(function(){
			
			alert("searchAcademy >>>");
			$("#ano").val(ano);
			window.open("","pop","width=480 height=250");
			$("#edit").attr("action","academyList.ec");
			$("#edit").attr("target","pop");
			$("#edit").attr("method","POST");
			$("#edit").submit();
			
		});
	});

</script>
<body>
<%
	Object obj=request.getAttribute("ReviewVOO");
	
	ReviewVO rvo=(ReviewVO)obj;
%>
	<div class="container">
<!-- action/document/location -->
	<form id="edit">
		<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>후기게시판</h1></td>
			</tr>
			</table>
			<hr>
		</div>
		<input type="hidden" id="rbno" name="rbno" value="<%= rvo.getRbno()%>"/>
		<table style="width: 90%" border="1" align="center" class="table">
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="rbsubject" name="rbsubject" value="<%= rvo.getRbsubject() %>"
					style="width: 98%" /></td>
			</tr>
			<tr>
				<td style="width: 100px">평점</td>
				<td>
					<div>
					<%= rvo.getRbgrade() %>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 100px">학원명</td>
				<td><div>
					<%= rvo.getAname() %>
					</div>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="rbcontent" id="rbcontent" title="내용" 
						style="width: 100%; height: 400px; padding: 0; margin: 0;"><%= rvo.getRbcontent() %></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<img src="/EduCatch/assets/img/reviewImg/<%= rvo.getRbimg() %>" border=() width="100" height="100"/><br>
					<input type="file" value="찾아보기" id="rbimg" name="rbimg" /><br> 
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="save" value="수정" class=" btn_light btn_box_01" /> 
				 <input type="reset" value="취소" class=" btn_light btn_box_01" /> 
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