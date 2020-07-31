<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
	
	//===관리자가 등록버튼을 누르면 실행========
	$("#insertData").click(function() {
		console.log("등록버튼 누름");
		
		$("#noticeForm").attr("action","insertNotice.ec");
		$("#noticeForm").attr("method","POST");
		$("#noticeForm").submit();
		
	})//end of insertData
	
	  
  });//end of ready()
</script>
</head>
<body>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>

	<form id="noticeForm" name="noticeForm">
		<div>
			<table border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td width=900 colspan="10" align="center"><h2>공지사항 게시판 목록</h2></td>
			</tr>
			</table>
		</div>
		<div>
			<table border="1">
			<colgroup>
				<col width="120px"/>
				<col width="400px"/>
				<col width="120px"/>
				<col width="120px"/>
			</colgroup>
			<thead>
				<td align="center">글번호</td>
				<td align="center">제목</td>
				<td align="center">작성자</td>
				<td align="center">등록일자</td>
			</thead>
			<tbody>
				<c:if test="${empty noticeList}">
				<tr>
					<td colspan ="4" align="center">
						등록된 글이 없습니다.
					</td>
				</tr>
				</c:if>
				
				<c:forEach items ="${noticeList}" var ="row">
					<td>${row.nno}</td>
					<td>${row.nsubject}</td>
					<td>${row.nname}</td>
					<td>${row.nupdatedate}</td>
				</c:forEach>
			</tbody>	
			</table>
		</div>
		<div>
			<table>
			<tr>
				<td colspan="4" align="right">
				<input type="button" value="등록" id="insertData">
				<input type="button" value="수정" id="updateData">
				<input type="button" value="삭제" id="deleteData">
				</td>
			</tr>
			</table>
		</div>
	</form>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>


