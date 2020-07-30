<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kosmo.educatch.vo.SearchVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에듀캐치</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<style type="text/css">
		div{
			display:none;
			margin:0px 0px 0px 50px;
		}
		</style>
		<script type="text/javascript">
		$(function(){
			$("#seoul").click(function(){
				$("#divseoul:not(:animated)").toggle("fast");
			});
			$("#kyunggi").click(function(){
				$("#divkyunggi:not(:animated)").toggle("fast");
			});
		});
		function seoulFuc(st){
			
		}
		</script>
	</head>
	<body>
	<c:forEach items="${areaList}" var="row">
						<tr align="center">
							<td>${row.district}</td>
							<td>${row.city}</td>
						</tr>
					</c:forEach>
	<%
// 		Object ob = request.getAttribute("areaList");
// 		System.out.println("searchAreaPopup Object >>> "+ob);
// 		ArrayList aList = (ArrayList)ob;
// 		for(int i=0;i<aList.size();i++){
			
// 		}
	%>
	<a id="seoul" href="">서울</a><br>
	<a id="kyunggi" href="">경기</a>
	<!-- 서울 -->
	<div id="divseoul">
	<input type="button" id="district" name="district" value="강남" onclick="seoulFuc('A')"><br>
	<input type="button" id="district" name="district" value="가산" onclick="seoulFuc('B')"><br>
	</div>
	
	<!-- 경기 -->
	<div id="divkyunggi">
	<input type="button" id="district" name="district" value="부천" onclick="kyunggiFuc('A')"><br>
	<input type="button" id="district" name="district" value="안산" onclick="kyunggiFuc('B')"><br>
	</div>
	</body>
</html>