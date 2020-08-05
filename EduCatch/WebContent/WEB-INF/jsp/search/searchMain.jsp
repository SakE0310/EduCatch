<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kosmo.educatch.vo.SearchVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에듀캐치</title>
<%-- 		<jsp:include page="../../../top.jsp" flush="true"> --%>
<%-- 			<jsp:param value="" name=""/> --%>
<%-- 		</jsp:include> --%>
		<style type="text/css">
		#main{
			margin: auto;
		}
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				ajaxGetDistrict();
				
				$('select#district').on('change','select',function(){
					var setDistrict = $('#district').val();
					console.log("setDistrict >>> "+setDistrict);
					ajaxGetCity(setDistrict);
				});//setDistrict
			});//document function
			
				//지역 대분류
				function ajaxGetDistrict(){
					var urls = "getDistrict.ec" //controller 지역 대분류
					console.log("urls >>> "+urls); 
					$.ajax({
						url : urls
					}).done(function(resParam){
						console.log("resparam >>> "+resParam);
						var st = "";
						for(i in resParam.districtList){
							console.log("for i >>> "+i);
							var district = resParam.districtList[i].district; //서울 경기
							st += "<option value='"+district+"'>"+district+"</option>\n";
						}
						$('select#district').html(st);
						ajaxGetCity(resParam.districtList[0].district);
					}).fail(function(resParam){
						alert("오류");
					});
				}//ajaxDistrict
				
				//지역 소분류
				function ajaxGetCity(param){
					console.log("param(setDistrict) >>> "+param);
					urls = "getCity.ec"; //controller 지역 소분류
					datas = {"district" : param}; //param = 서울
					$.ajax({
						url : urls,
						data : datas
					}).done(function(resParam){
						console.log("resParam >>> "+resParam);
						var st = "";
						for(i in resParam.cityList){
							console.log("for i >>> "+i);
							var city = resParam.cityList[i].city; //강남 강북
							st += "<option value='"+city+"'>"+city+"</option>\n";
						}
						$('select#city').html(st);
					}).fail(function(resParam){
						alert("에러");
					});
				}//ajaxCity 
		</script>
	</head>
	<body>
		<div id="main">
			<div>
				<select id="district">
					<option value=""></option>
				</select>
				<select id="city">
					<option value=""></option>
				</select>
				<select id="cmajor">
					<option value=""></option>
				</select>
				<select id="cminor">
					<option value=""></option>
				</select>
				<input type="button" id="search" value="검색">
			</div>
		</div>
	</body>
<%-- 	<jsp:include page="../../../footer.jsp" flush="true"> --%>
<%-- 		<jsp:param value="" name=""/> --%>
<%-- 	</jsp:include> --%>
</html>