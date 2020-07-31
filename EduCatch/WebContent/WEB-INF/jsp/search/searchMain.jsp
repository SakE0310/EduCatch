<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에듀캐치</title>
		<script type="text/javascript">
			function areaPopup(){
				$("#search").val("");
				window.open("","pop","width=600, height=500");
<<<<<<< HEAD
				$("#popupForm").attr("action","searchPopup.ec");
=======
				$("#popupForm").attr("action","areaPopup.ec");
>>>>>>> branch 'master' of https://github.com/SakE0310/EduCatch
				$("#popupForm").attr("method","POST");
				$("#popupForm").attr("target","pop");
				$("#popupForm").submit();
			}//areaPopup
			function catePopup(){
				$("#search").val("cate");
				window.open("","pop","width=600, height=500");
				$("#popupForm").attr("action","searchPopup.ec");
				$("#popupForm").attr("method","POST");
				$("#popupForm").attr("target","pop");
				$("#popupForm").submit();
			}//catePopup
		</script>
	</head>
	<body>
	
	<form id="popupForm" name="popupForm">
			<input type="hidden" id="search" name="search">
	</form>
	
	<jsp:include page="../../../top.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	검색
	<div id="container">
		<div id="areaBox">
			<input type="button" name="area" value="지역선택" onclick="areaPopup()">
		</div>
		<div id="categoryBox">
			<input type="button" name="category" value="카테고리선택" onclick="catePopup()">
		</div>
	</div>
	<jsp:include page="../../../footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	</body>
</html>