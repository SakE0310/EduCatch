<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kosmo.educatch.vo.SearchVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		$(document).ready(function(){
 			
			$('#complete').click(function(){
 				var city = document.getElementsByName("city");
 				var arr = [].slice.call(city);
 				console.log("city >>> "+city);
 				console.log("arr >>> "+arr);
 				var urls = "searchMainAgain.ec?city="+city;
 				console.log("urls >>> "+urls);
 				opener.window.location = urls;
//				close();
 			});
		});
		</script>
<%
	String district = request.getParameter("district");
	System.out.println("areaData disrtrict >>> "+district);
%>
	</head>
	<body>
<%
	Object ob = request.getAttribute("selectArea");
		System.out.println("areaData object >>> "+ob);
	ArrayList aList = (ArrayList)ob;
		System.out.println("areaData aList >>> "+aList);
		%>
		
		<%
	for(int i=0;i<aList.size();i++){
	SearchVO param = (SearchVO)aList.get(i);
		System.out.println("areaData param >>> "+param);
%>
	<form name="cityForm" id="cityForm">
	<input type="checkbox" id="city" name="city" value="<%=param.getCity() %>"><%=param.getCity() %>
	<br>
<%		
	}
%>
	</form>
	<br>
	<br>
	<input type="button" id="complete" value="설정완료" >
	</body>
</html>