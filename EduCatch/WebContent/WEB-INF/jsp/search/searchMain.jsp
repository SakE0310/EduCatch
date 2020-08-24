<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.AcademyVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="../../../top.jsp" flush="true">
			<jsp:param value="" name=""/>
		</jsp:include>
		
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//지역 함수
				ajaxGetDistrict();
				//카테고리 함수
				ajaxGetMajor();

				//지역 대분류 변경시 지역소 분류 자동 변경
				$('.select-district').on('change','select',function(){
					var setDistrict = $('#district').val();
					console.log("setDistrict >>> "+setDistrict);
					ajaxGetCity(setDistrict);
				});//setDistrict
			
				//카테고리 대분류 변경시 카테고리 소분류 자동 변경
				$('.select-cmajor').on('change','select',function(){
					var setCmajor = $('#cmajor').val();
					console.log("setCmajor >>> "+setCmajor);
					ajaxGetMinor(setCmajor);
				});//setDistrict
				
				
				//검색시 AcaList호출
				$('#search').click(function(){
					var setDistrict = $('#district').val(); //서울
					var setCity = $('#city').val(); //서울전체
					var setCmajor = $('#cmajor').val(); //언어
					var setCminor = $('#cminor').val(); //언어전체
					var setAname = $('#aname').val(); //언어전체
					console.log("click setDistrict >>> "+setDistrict);
					console.log("click setCity >>> "+setCity);
					console.log("click setCmajor >>> "+setCmajor);
					console.log("click setCminor >>> "+setCminor);
					console.log("click setAname >>> "+setAname);
					ajaxGetAcaList(setDistrict,setCity,setCmajor,setCminor,setAname);
				});//search button function
				
				//call 함수호출 
				function ajaxGetAcaList(setDistrict,setCity,setCmajor,setCminor,setAname){
					console.log("ajaxGetAcaList setDistrict >>> "+setDistrict);
					console.log("ajaxGetAcaList setCity >>> "+setCity);
					console.log("ajaxGetAcaList setCmajor >>> "+setCmajor);
					console.log("ajaxGetAcaList setCminor >>> "+setCminor);
					console.log("ajaxGetAcaList setAname >>> "+setAname);
					urls = "getAcaList.ec";
					datas = {
							 "district" : setDistrict
							,"city" : setCity
							,"cmajor" : setCmajor
							,"cminor" : setCminor
							,"aname" : setAname
							};
					console.log("urls >>> "+urls);
					console.log("datas >>> "+datas);
					$.ajax({
						url : urls,
						data : datas
					}).done(function(resParam){
						if(resParam.acaList==""){
							console.log("done error >>> ");
								st = "<p style='margin:0 auto; text-align:center; padding:200px 200px;'>일치하는 학원이 없습니다</p>";
							}else{
						console.log("done start >>> "+resParam);
						st = "";
						console.log("acaList >>> "+resParam.acaList);
							var listcount = resParam.acaList[0].listcount;
							st = "<h5>"+listcount+"개의 학원이 조회됬습니다</h5>";
						for(i in resParam.acaList){
							var aupdatedate = resParam.acaList[i].aupdatedate;
							var cmajor = resParam.acaList[i].cmajor;
							var cminor = resParam.acaList[i].cminor;
							var ano = resParam.acaList[i].ano;
							var aname = resParam.acaList[i].aname;
							var	alogo = resParam.acaList[i].alogo;
							var aaddr1 = resParam.acaList[i].aaddr1;
							var aaddr2 = resParam.acaList[i].aaddr2;
							var agrade = resParam.acaList[i].agrade;
							st += "<p>";
							st += "<div class='panel panel-default'>";
							st += "<a href='listDetailView.ec?ano="+ano+"' style='text-decoration:none'>";
							st += "<div class='media'>";
							st += "<div class='media-left'>";
							st += "<img src='assets/img/academyLogo/"+alogo+"' class='media-object' style='width:135px; height:135px'>";
							st += "</div>";
							st += "<div class='media-body'>";
							st += "<p><h4 class='media-heading'>"+aname+"</h4></p>";
							st += "<p><img src='assets/img/Icon_location.png' style='width:15px; height:15px'>"+aaddr1+"</p>";
							st += "<h4><img src='assets/img/Icon_star.png' style='width:15px; height:15px'>&nbsp;"+agrade+"&nbsp;&nbsp;&nbsp;#"+cmajor+"&nbsp;#"+cminor+"<h4>";
							st += "<h5 align='right'>최근업데이트 : "+aupdatedate+"&nbsp;&nbsp;</h5></p>";
							st += "</div>";
							st += "</div>";
							st += "</a>";
							st += "</div>";
							st += "</p>";
						}
						}//학원명이 없을시 if
						$('.acaList').html(st);
						$('.acaList').niceSelect('update');
						console.log("done end >>> "+resParam);
					}).fail(function(resParam){
						alert("에러");
					});					
				}//ajaxGetAcaList

				//학원명으로 검색
				$('#search-aname').click(function(){
					var setAname = $('#aname').val();
					if(setAname==""){
						alert("학원명을 입력하세요");
					}else{
					console.log("aname >>> "+setAname);
					ajaxGetAname(setAname);
					}//학원명 입력 유무
				});//search aname button function
				
				function ajaxGetAname(setAname){
					console.log("ajaxGetAname setAname >>> "+setAname);
					urls = "getAcaList.ec";
					datas = {
							"aname" : setAname
							};
					console.log("urls >>> "+urls);
					console.log("datas >>> "+datas);
					$.ajax({
							url : urls,
							data : datas
					}).done(function(resParam){
						if(resParam.acaList==""){
						console.log("done error >>> ");
							st = "<p style='margin:0 auto; text-align:center; padding:200px 200px;'>일치하는 학원이 없습니다</p>";
						}else{
						console.log("done start >>> "+resParam);
						st = "";
						console.log("acaList >>> "+resParam.acaList);
							var listcount = resParam.acaList[0].listcount;
							st = "<h5>"+listcount+"개의 학원이 조회됬습니다</h5>";
						for(i in resParam.acaList){
							var aupdatedate = resParam.acaList[i].aupdatedate;
							var cmajor = resParam.acaList[i].cmajor;
							var cminor = resParam.acaList[i].cminor;
							var ano = resParam.acaList[i].ano;
							var aname = resParam.acaList[i].aname;
							var	alogo = resParam.acaList[i].alogo;
							var aaddr1 = resParam.acaList[i].aaddr1;
							var aaddr2 = resParam.acaList[i].aaddr2;
							var agrade = resParam.acaList[i].agrade;
							st += "<p>";
							st += "<div class='panel panel-default'>";
							st += "<a href='listDetailView.ec?ano="+ano+"' style='text-decoration:none'>";
							st += "<div class='media'>";
							st += "<div class='media-left'>";
							st += "<img src='assets/img/academyLogo/"+alogo+"' class='media-object' style='width:135px; height:135px'>";
							st += "</div>";
							st += "<div class='media-body'>";
							st += "<p><h4 class='media-heading'>"+aname+"</h4></p>";
							st += "<p><img src='assets/img/Icon_location.png' style='width:15px; height:15px'>"+aaddr1+"</p>";
							st += "<h4><img src='assets/img/Icon_star.png' style='width:15px; height:15px'>&nbsp;"+agrade+"&nbsp;&nbsp;&nbsp;#"+cmajor+"&nbsp;#"+cminor+"<h4>";
							st += "<h5 align='right'>최근업데이트 : "+aupdatedate+"&nbsp;&nbsp;</h5></p>";
							st += "</div>";
							st += "</div>";
							st += "</a>";
							st += "</div>";
							st += "</p>";
						}
						}//검색한 학원이 있을때 if
						$('.acaList').html(st);
						$('.acaList').niceSelect('update');
						console.log("done end >>> "+resParam);
					}).fail(function(resParam){
						alert("에러");
					});
				}//ajaxGetAname
				
				//지역 대분류
				function ajaxGetDistrict(){
					var urls = "getDistrict.ec"; //controller 지역 대분류
					console.log("ajaxGetDistrict urls >>> "+urls); 
					$.ajax({
						url : urls
					}).done(function(resParam){
						console.log("ajaxGetDistrict resparam >>> "+resParam);
						var st = "";
						for(i in resParam.districtList){
							var district = resParam.districtList[i].district; //서울 경기
							st += "<option value='"+district+"'>"+district+"</option>\n";
						}
						$('select#district').html(st);
						$('select#district').niceSelect('update');
						console.log("ajaxGetDistrict end >>>");
						ajaxGetCity(resParam.districtList[0].district);
					}).fail(function(resParam){
						alert("오류");
					});
				}//getDistrict
				
				//지역 소분류
				function ajaxGetCity(param){
					console.log("ajaxGetCity param(setDistrict) >>> "+param);
					urls = "getCity.ec"; //controller 지역 소분류
					datas = {"district" : param}; //param = 서울
					console.log("ajaxGetCity urls >>> "+urls);
					console.log("ajaxGetCity datas >>> "+datas);
					$.ajax({
						url : urls,
						data : datas
					}).done(function(resParam){
						console.log("ajaxGetCity re,sParam >>> "+resParam);
						var st = "";
						for(i in resParam.cityList){
							var city = resParam.cityList[i].city; //강남 강북
							st += "<option value='"+city+"'>"+city+"</option>\n";
						}
						$('select#city').html(st);
						$('select#city').niceSelect('update');
						//call scroll
						callNiceSelect(resParam);
						console.log("ajaxGetCity end >>>");
					}).fail(function(resParam){
						alert("에러");
					});
				}//getCity 
				
				//scroll function
				function callNiceSelect(resParam){
					console.log("callNiceSelect >>> "+resParam.cityList[0].city);
					$('.nice-select').click(function(){
						console.log("nice-select click");
						var list = $('.list');
						console.log("list >>> "+list);
						list.css("overflow","scroll");
 					});
				};
				
				//카테 대분류
				function ajaxGetMajor(){
					urls = "getCmajor.ec"; //controller 카테고리 대분류
					console.log("ajaxGetMajor urls >>> "+urls);
					$.ajax({
						url : urls
					}).done(function(resParam){
					console.log("ajaxGetMajor resParam >>> "+resParam);
						var st = "";
						for(i in resParam.major){
							var cmajor = resParam.major[i].cmajor; //언어,체육
							st += "<option value='"+cmajor+"'>"+cmajor+"</option>\n";
						}
						$('select#cmajor').html(st);
						$('select#cmajor').niceSelect('update');
						console.log("ajaxGetMajor end >>>");
						ajaxGetMinor(resParam.major[0].cmajor);
					}).fail(function(resParam){
						alert("에러");
					});
				}//getMajor
				
				//카테 소분류
				function ajaxGetMinor(param){
					console.log("ajaxGetMinor param(setCmajor) >>> "+param);
					urls = "getCminor.ec"; // controller 카테고리 소분류
					datas = {"major" : param}; // param = 언어,체육
					console.log("ajaxGetMinor urls >>> "+urls);
					console.log("ajaxGetMinor datas >>> "+datas);
					$.ajax({
						url : urls,
						data : datas
					}).done(function(resParam){
						console.log("ajaxGetMinor resParam >>> "+resParam);
						var st = "";
						for(i in resParam.minor){
							var cminor = resParam.minor[i].cminor; //일본어,유도
							st += "<option value='"+cminor+"'>"+cminor+"</option>\n";
						}
						$('select#cminor').html(st);
						$('select#cminor').niceSelect('update');
						console.log("ajaxGetMinor end >>>");
					}).fail(function(resParam){
						alert("에러");
					});
				}//getMinor
				
			});//document function
		</script>
	
		<style type="text/css">
		@media screen and (min-width: 744px) {
			.box {
				display : grid;
				grid-template-columns : 200px 1fr 1fr 1fr 1fr 1fr 1fr;
				grid-column-gap: 10px;
			}
		}
		@media screen and (min-width: 500px) and (max-width: 940px) {
			.box {
				display : grid;
				grid-template-row : 2fr 1fr 1fr 1fr 2fr;
				grid-row-gap: 10px;
			}
			.list {
				width : 450px;
			}
		}
		.genric-btn {
	   		color: #fff;
	   		background: #140C40;
	   		width: 100px;
	   		border: 1px solid transparent;
 		}
 		.list { 
 		    height:250px; 
 		    width:145px;
		} 
		.main {
			margin : 0 auto;
		}
		#form {
			margin: auto;
		}
		#show{
			margin : 0 auto;
			text-align : center;
			padding : 200px 100px;
		}
		</style>
	</head>
	<body>
		<main class="main">
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-lg-10 col-md-10" id="form">
					<div class="box">
									<input type="text" id="aname" name="aname" size="58px" class="form-control" placeholder="학원명으로 입력해보세요">
									<input type="button" id="search-aname" class="genric-btn primary" value="검색">
							<select id="district">
								<option></option>
							</select>
							<select id="city">
								<option></option>
							</select>
							<select id="cmajor">
								<option></option>
							</select>
							<select id="cminor">
								<option></option>
							</select>
							<input type="button" id="search" class="genric-btn primary" value="검색">
					</div>
							<form id="detailViewForm" name="detailViewForm">
								<div class="acaList"><p id="show">검색조건을 입력하세요<p></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="../../../footer.jsp" flush="true">
			<jsp:param value="" name=""/>
		</jsp:include>
	</body>
</html>