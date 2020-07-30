<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<jsp:include page="../../../top.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	<body>
	<input type="button" name="area" value="지역찾기">
	<input type="button" name="category" value="카테고리찾기">
	</body>
</html>