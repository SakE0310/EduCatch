<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		//수정 버튼 눌렀을 떄
		$("#updateData").click(function(){
			
			alert("updateData >>>");
			$("#rbno").val(rbno);
			$("#ReviewForm").attr("action","selectUpdate.ec");
			$("#ReviewForm").attr("method","POST");
			$("#ReviewForm").submit();
			
		});
	});	
	

</script>
</head>
<body>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<p></p>
	<div>
		<form id="ReviewForm" name="ReviewForm">
		 
			<input type="hidden" id="rbno" name="rbno" value="${ReviewVO.rbno }"/>
		
			<table style="margin-left: auto; margin-right: auto;" border="1">
			<tbody>
				<tr>
					<th><span class="required">*</span>제목</th>
					<td><input type="text" id="rbsubject"
					name="rbsubject" value="${ReviewVO.rbsubject}"/></td>
				</tr>
				<tr>
					<th><span class="required">*</span>작성자</th>
					<td><input type="text" id="rbname"
					name="rbname" value="${ReviewVO.rbname}"/></td>
				</tr>
				<tr>
					<th><span class="required">*</span>사진</th>
					<td><input type="text" id="rbimg"
					name="rbimg" value="${ReviewVO.rbimg}"/></td>
				</tr>
				<tr>
					<th><span class="required">*</span>내용</th>
					<td><input type="text" id="rbcontent"
					name="rbcontent" value="${ReviewVO.rbcontent}"/></td>
				</tr>
				<tr>
					<th><span class="required">*</span>평점</th>
					<td><input type="text" id="rbgrade"
					name="rbgrade" value="${ReviewVO.rbgrade}"/></td>
				</tr>
				<tr>
					<th><span class="required">*</span>날짜</th>
					<td><input type="text" id="rbinsertdate"
					name="rbinsertdate" value="${ReviewVO.rbinsertdate}"/></td>
				</tr>	
			</tbody>
			</table>
		</form>
	</div>
	<p></p>
		<table style="margin-left: auto; margin-right: auto;" border="0">
			<tr align="center">
				<td>
					<input type="button" id="updateData" value="수정" />
				</td>
				<td>
					<input type="button" id="deleteData" value="삭제" />
				</td>
			</tr>
		</table>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>