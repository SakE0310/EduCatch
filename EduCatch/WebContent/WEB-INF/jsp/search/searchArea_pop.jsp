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
		</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.district').click(function(){
				console.log(this.value);
				var st = this;
				console.log("st >>> "+st);
				callAjax(st);
			});
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
</head>
<body>
	<input type="button" class="district" id="seoul" value="서울">
	<input type="button" class="district" id="kyunggi" value="경기">

	<div id="areaData"></div>
</html>