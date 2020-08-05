<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		/*
		//수정 버튼 눌렀을 떄
		$("#updateData").click(function(){
			
			alert("updateData >>>");
			$("#rbno").val(rbno);
			$("#ReviewForm").attr("action","selectUpdate.ec");
			$("#ReviewForm").attr("method","POST");
			$("#ReviewForm").submit();
			
		});
		*/
		
		$("#deleteData").click(function(){
			
			alert("deleteData >>>");
			$("#ReviewForm").attr("action","deleteReview.ec");
			$("#ReviewForm").attr("method","POST");
			$("#ReviewForm").submit();
			
		});
	});	
	

</script>
<body>

<%
	
%>
<p></p>
	<div>
		<form id="ReviewForm" name="ReviewForm">
		 
			<input type="hidden" id="rbno" name="rbno" value="${ReviewVO.rbno }"/>
		
			<table style="margin-left: auto; margin-right: auto;" border="1">
			<tbody>
				<tr>
					<th><span class="required">*</span>제목</th>
					<td><div>${ReviewVO.rbsubject}</div></td>
				</tr>
				<tr>
					<th><span class="required">*</span>작성자</th>
					<td><div>${ReviewVO.rbname}</div></td>
				</tr>
				<tr>
					<th><span class="required">*</span>사진</th>
					<td>
					 <div id ="rbimg" name="rbimg" align="center">
	         				<img src="/EduCatch/assets/img/reviewImg/${ReviewVO.rbimg}" alt="사진없음"/><br>
	         		</div>
					</td>
				</tr>
				<tr>
					<th><span class="required">*</span>내용</th>
					<td><div>${ReviewVO.rbcontent }</div></td>
				</tr>
				<tr>
					<th><span class="required">*</span>평점</th>
					<td><div>${ReviewVO.rbgrade}</div></td>
				</tr>
				<tr>
					<th><span class="required">*</span>날짜</th>
					<td><div>${ReviewVO.rbinsertdate}</div></td>
				</tr>	
			</tbody>
			</table>
		</form>
	</div>
	<p></p>
		<table style="margin-left: auto; margin-right: auto;" border="0">
			<tr align="center">
				<td>
					<a href="selectUpdate.ec?rbno=${ReviewVO.rbno }">
					<input type="button" id="updateData" value="수정" />
					</a>
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