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
		<script type="text/javascript">
			$(document).ready(function(){
				$('.cmajor').click(function(){
					console.log(this.value);
					var st = this.value;
					console.log("st >>> "+st);
					ajaxGetCmajor(st);
				});
				$('#complete').click(function(){
					console.log("complete >>> ");
					var cked = [];
					$('.ck:checked').each(function(){
						cked.push($(this).val());
						console.log("cked >>> "+cked);
					});
					if(cked.length<2){
						var urls = "searchMainAgain.ec?cmajor="+cked;
						console.log("urls >>> "+urls);
						opener.window.location = urls;
						close();
					}else{
						alert("한개만 선택 가능합니다");
					}
				});
				function ajaxGetCmajor(param){
					console.log("param >>> "+param);
					$.ajax({
						url : "searchCateList.ec",
						data : {"cmajor" : param}
					}).done(function(resParam){
						console.log("done >>> ");
						console.log("resParam >>> "+resParam);
						var st = "";
						for(i in resParam.minorList){
							var cminor = resParam.minorList[i].cminor;
							st += "<input type='checkbox' class='ck' value='"+cminor+"'>"+cminor+"<br>";
						}
						$("#cateData").html(st);
					}).fail(function(resParam){
						alert("선택중 오류가 발생했습니다");
					});
				}
			});
		</script>
	</head>
	<body>
		<div>
			<input type="button" class="cmajor" value="언어">
			<input type="button" class="cmajor" value="체육">
		</div>
	
	<form name="cateForm" id="cateForm">
		<div id="cateData"></div>
		<div align="right">
		</div>
	</form>
		<input type="button" id="complete" value="설정완료" >
	</body>
</html>