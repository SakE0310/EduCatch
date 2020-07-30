<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
	<form id="noticeForm" name="noticeForm">
		<div>
		<table border="2" align="center">
		<thead>
			<tr>
				<td colspan="10" align="center"><h2>공지사항 게시판 목록</h2></td>
			</tr>
			<tr>
				<td align="center">글번호</td>
				<td align="center" size="20">제목</td>
				<td align="center">작성자</td>
				<td align="center">등록일자</td>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center">ex)0001</td>
				<td align="center">공지사항</td>
				<td align="center">관리자</td>
				<td align="center">2020-07-30</td>
			</tr>
			<tr>
				<td>
				</td>
			</tr>
		</tbody>
		</table>
		</div>
	</form>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>