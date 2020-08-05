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
			$('.district').click(function(){
				console.log(this.value);
				var st = this.value;
				console.log("st >>> "+st);
				ajaxGetCity(st);
			});
			$('#complete').click(function(){
	 			console.log("complete >>> ");
				var cked = [];
				$('.ck:checked').each(function(){
					cked.push($(this).val());
					console.log("cked >>> "+cked);
					});
					if(cked.length<2){
						var urls = "searchMainAgain.ec?city="+cked;
	 					console.log("urls >>> "+urls);
 						opener.window.location = urls;
		 				close();
					}else{
						alert("한개만 선택 가능합니다");
					}
			});
			//ajaxGetCity(st) 안에 district의 value값이 들어있다
			//그것을 ajaxGetCity(param)함수의 param으로 가져왔다
			function ajaxGetCity(param){
				console.log("param >>> "+param);
				$.ajax({
					//컨트롤러의 json파일을 가져온다
					url : "searchAreaList.ec", 
					//searchAreaList함수에 getparameter가 받는값은 param(district)
					data : {"district" : param}
				//실행이 성공
				}).done(function(resParam){
					console.log("done >>> ");
					console.log("resParam >>> "+resParam);
					var st ="";
					//i를 resParam(object)의 cityList(list)를 값만큼 돌린다
					for(i in resParam.cityList){
						//city변수에 object의 cityList의 city값들을 담는다
						var city = resParam.cityList[i].city;
						st += "<input type='checkbox' class='ck' value='"+city+"'>"+city+"<br>";
					}	
						//st += "<input type='button' id='complete' value='설정완료'>";
					$('#areaData').html(st);
				}).fail(function(resParam){
					alert("선택중 오류가 발생했습니다");
				});
			}
		});
	</script>	  
</head>
	<body>
		<div>
			<input type="button" class="district" value="서울">
			<input type="button" class="district" value="경기">
		</div>
		
	<form name="cityForm" id="cityForm">
		<div id="areaData"></div>
		<div align="right">
			<input type="button" id="complete" value="설정완료" >
		</div>
	</form>
	</body>
</html>