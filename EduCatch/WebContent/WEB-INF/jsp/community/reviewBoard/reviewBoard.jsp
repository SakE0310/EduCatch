<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>
<style type="text/css">
	.tt{	
			text-align:center;
			font-size: xx-large;
			font-weight: bold;
			
		}		
		
	#aa{	
			color:black;
		
		}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

  	
 	 $(document).ready(function() {
		//글쓰기 버튼 눌렀을 때 실행
		$("#insertPage").click(function() {
			console.log("insertPage >>> ");
			//글쓰기 에디터 화면으로 이동
			$("#pageForm").attr("action","insertDisplay.ec");
			$("#pageForm").attr("method","POST");
			$("#pageForm").submit();	
		})
  	});
 	 
 	 /*
 	function updatePopup(rbno){
		alert(">>>");
		$("#rbno").val(rbno);
		$("#pageForm").attr("action","selectReview.ec");
		$("#pageForm").attr("method","POST");
		$("#pageForm").submit();
		
	}
	*/
  	//검색
	function listSearch(){
		console.log("listSearch");
		
		$("#searchForm").attr("action","listReview.ec");
		$("#searchForm").attr("method","POST");
		$("#searchForm").submit();
	}
  
	
</script>
<body>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
	<form id="pageForm" name="pageForm">
		<input type="hidden" id="rbno" name="rbno"/>
	</form>
	<br><br><br><br>
	<div>
		<table style="margin-left: auto; margin-right: auto;" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<th><h4 class="tt">후기 게시판</h4><br><br><br></th>
			</tr>
		</table>
		<table  style="margin-left: auto; margin-right: auto;" border="1">
			<colgroup>
				<col width="120px"/>
				<col width="110px"/>
				<col width="120px"/>
				<col width="220px"/>
			</colgroup>
			<thead>	
				<tr>
					<td colspan="6" align="right">
						<input type="button" value="[글쓰기]"
						id="insertPage"/>
					</td>
				</tr>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>학원명</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty listReview }">
					<tr>
						<td colspan="7" align="center">
						등록된 게시물이 없습니다.
						</td>
					</tr>
				</c:if>
			<c:forEach items="${listReview}" var="row">
					<tr align="center">
						<td>${row.rbno }</td>
						<td>${row.rbname }</td>
						<td>${row.academy_ano }</td>
						<td><a href="selectReview.ec?rbno=${row.rbno }"  id="aa">${row.rbsubject }</a></td>
						<td>${row.rbinsertdate }</td>
						<!-- 
						<td><input type="button" value="[수정/삭제]"
						onclick="updatePopup('${row.rbno}')"/></td>
						-->
					</tr>
				</c:forEach>			
			</tbody>
		</table>
	</div>
	<div>
		<form id="searchForm" name="searchForm">
			<table style="margin-left: auto; margin-right: auto;" border="1" cellpadding="1" cellspacing="1">
				<tr>
					<th>검색</th>
					<td>
						<input type="text" id="updatedate" name="updatedate"/>
					</td>
					<td>
						<input type="button" onclick="listSearch()" value="검색"/>
					</td>
			</table>
		</form>
	</div>
	<br><br><br><br><br><br>

<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>