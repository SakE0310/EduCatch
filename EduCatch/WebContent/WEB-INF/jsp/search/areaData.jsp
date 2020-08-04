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
			$('#button').click(function(){
				var st = $('#cityForm');
				console.log("st >>> "+st);
				callAjax(st);
			});
 			
			$('#complete').click(function(){
 				var city = document.getElementById("city").value;
 				console.log("city >>> "+city);
 				var urls = "searchMainAgain.ec?city="+city;
 				console.log("urls >>> "+urls);
 				opener.window.location = urls;
 				close();
 			});
			
// 			$('#complete').click(function(){
// 				$('#cityForm').attr("action","searchMainAgain.ec");
// 				$('#cityForm').attr("method","post");
// 				$('#cityForm').submit();
// 			});
		});
		
		function callAjax(st){
			urls = "searchAreaList.ec";
			datas = {district : $(st).val()};
			console.log(urls);
			console.log(datas);
			$.ajax({
				type : "post",
				url : urls,
				data : datas,
				success : whenSuccess,
				error : whenError
			});
			function whenSuccess(resData){
				$('#areaData').html(resData);
			}
			function whenError(){
				alert("error");
			}
		}
		
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
	<input type="button" id="complete" value="설정완료" onclick="completeFuc()">
	</body>
</html>