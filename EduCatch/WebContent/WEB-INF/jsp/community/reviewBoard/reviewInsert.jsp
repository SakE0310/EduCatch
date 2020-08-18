<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
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
<title>후기 게시판 입력</title>
<style type="text/css">
	.starR1{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR2{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR1.on{background-position:0 0;}
	.starR2.on{background-position:-15px 0;}
</style>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script src ="/EduCatch/assets/js/service/HuskyEZCreator.js"></script>

<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

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
			$("#edit").attr("action","insertReview.ec");
			$("#edit").attr("enctype","multipart/form-data");
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
		
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  $("#rbgrade").val($('.on').size()/2);
			  console.log($('.on').size()/2);
			
			  return false;
		});
	});
	
	function setChildValue(aname){

	      document.getElementById("aname").value = aname;
	      document.getElementById("ano").value = ano;

	}



</script>
<body>
<!-- action/document/location -->
	<form id="edit">
		<table style="margin-left: auto; margin-right: auto; width: 50%" border="1">
			<tr>
				<td style="width: 100px">제목</td>
				<td><input type="text" id="rbsubject" name="rbsubject"
					style="width: 98%" /></td>
			</tr>
			<tr>
				<td style="width: 100px">평점</td>
				<td>
				 <input type="hidden" id="rbgrade" name="rbgrade" /> 
					<div class="starRev">
					  <span class="starR1 on">별1_왼쪽</span>
					  <span class="starR2">별1_오른쪽</span>
					  <span class="starR1">별2_왼쪽</span>
					  <span class="starR2">별2_오른쪽</span>
					  <span class="starR1">별3_왼쪽</span>
					  <span class="starR2">별3_오른쪽</span>
					  <span class="starR1">별4_왼쪽</span>
					  <span class="starR2">별4_오른쪽</span>
					  <span class="starR1">별5_왼쪽</span>
					  <span class="starR2">별5_오른쪽</span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 100px">학원명</td>
				<%
					Object obj = request.getAttribute("aname");
				
					String aname = (String)obj;
				%>
				<td><input type="text"  id="aname" name="aname" value="<%=aname %>"
					style="width: 90%" />
					<input type="button"  id="searchAcademy" value="검색" />
					<input type="hidden" id="ano" name="ano" /> 
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="rbcontent" id="rbcontent" title="내용"
						style="width: 100%; height: 400px; padding: 0; margin: 0;"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" value="찾아보기" id="rbimg" name="rbimg" /><br> 
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				 <input type="button" id="save" value="등록" />
				 <input type="reset" value="취소" /> 
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>