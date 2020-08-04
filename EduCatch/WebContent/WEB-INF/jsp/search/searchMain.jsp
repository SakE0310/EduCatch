<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kosmo.educatch.vo.SearchVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에듀캐치</title>
		<script type="text/javascript">
			function areaPopup(){
				$("#search").val("");
				window.open("","pop","width=600, height=500");
				$("#popupForm").attr("action","searchPopup.ec");
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
	<div align="center">
		<h1>지역/카테고리선택</h1>
	</div>
	<div id="container" align="center">
	<h2>
		<input type="button" name="area" value="지역선택" onclick="areaPopup()">
		<input type="button" name="category" value="카테고리선택" onclick="catePopup()">
	</h2>
	</div>
<%
	Object ob = request.getAttribute("cityForm");
	if(ob!=null){
		System.out.println("main.jsp object >>> "+ob);
	String city = (String)ob;
		System.out.println("main.jsp city>>> "+city);
%>
	<div>
		<h4 align="center">
			<input type="button" id="city" name="city" value="#<%=city%>">
		</h4>
	</div>
	<div>
		<h2 align="center">
		<input type="button" id="selectAll" name="selectAll" value="검색시작">
		</h2>
	</div>
<%
	}
%>
	<jsp:include page="../../../footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	</body>
</html>