<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<form id="freeBoardForm" name="freeBoardForm" method="post">
		<input type="hidden" name="fbno" id="fbno"/>
	</form>
	<div>
		<table border="0">
			<tr><th><h4>자유게시판 목록</h4></th></tr>
		</table>
	</div>	
	<div>
		<table border="1">
			<colgroup>
				<col width="120px"/>
				<col width="220px"/>
				<col width="120px"/>
				<col width="110px"/>
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>내용</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
			
				<c:if test="${empty freeboardlist}">
					<tr>
						<td colspan="6" align="center">
						등록된 학과 정보가 존재하지 않습니다 </td>
					</tr>	
				</c:if>
				<c:forEach items="${freeboardlist}" var="row">
					<tr>				
						<td align="center">${row.fbno}</td>
						<td align="center">${row.fbsubject}</td>
						<td align="center">${row.fbname}</td>
						<td align="center">${row.fbcontent}</td>
						<td align="center">${row.fbimg}</td>
						<!-- td align="center">
							<input type="button" value="[수정/삭제 ]"
							onclick="updatePopup('${row.fbno}')"/>
						</td> -->
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">
					처리할 버튼을 선택하세요</td>
					<td align="center">
					<input type="button" onclick="insertPopup()"
					value="[등록]"/></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>