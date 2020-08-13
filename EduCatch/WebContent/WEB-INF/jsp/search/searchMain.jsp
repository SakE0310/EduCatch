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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
// 				//무한스크롤
// 				$(document).scroll(function(){
// 					console.log("scroll");
// 					var maxHeight = $(document).height();
// 					var currentScroll= $(window).scrollTop()+$(window).height();
// 					if(maxHeight<=currentScroll+100){
// 						$.ajax({
// 							url : "searchMain.ec",
// 							success : function(html,status){
// 							}
// 						});
// 					}
// 				});//scroll
				
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
					console.log("click setDistrict >>> "+setDistrict);
					console.log("click setCity >>> "+setCity);
					console.log("click setCmajor >>> "+setCmajor);
					console.log("click setCminor >>> "+setCminor);
					ajaxGetAcaList(setDistrict,setCity,setCmajor,setCminor);
				});//search button function
				
				//call 함수호출 
				function ajaxGetAcaList(setDistrict,setCity,setCmajor,setCminor){
					console.log("ajaxGetAcaList setDistrict >>> "+setDistrict);
					console.log("ajaxGetAcaList setCity >>> "+setCity);
					console.log("ajaxGetAcaList setCmajor >>> "+setCmajor);
					console.log("ajaxGetAcaList setCminor >>> "+setCminor);
					urls = "getAcaList.ec";
					datas = {
							 "district" : setDistrict
							,"city" : setCity
							,"cmajor" : setCmajor
							,"cminor" : setCminor
							};
					console.log("urls >>> "+urls);
					console.log("datas >>> "+datas);
					$.ajax({
						url : urls,
						data : datas
					}).done(function(resParam){
						console.log("done start >>> "+resParam);
						st = "";
						str = "";
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
							st += "<a href='listDetailView.ec' style='text-decoration:none'>";
							st += "<div class='media'>";
							st += "<div class='media-left'>";
							st += "<img src='assets/img/sendMail/"+alogo+"' class='media-object' style='width:120px; height:120px'>";
							st += "</div>";
							st += "<div class='media-body'>";
							st += "<p><h4 class='media-heading'>"+aname+"</h4></p>";
							st += "<p>"+aaddr1+"&nbsp;"+aaddr2+"</p>#"+cmajor+"&nbsp;#"+cminor+"";
							st += "<h5 align='right'>최근업데이트 : "+aupdatedate+"&nbsp;&nbsp;</h5></p>";
							st += "</div>";
							st += "</div>";
							st += "</a>";
							st += "</div>";
							st += "</p>";
						}
						$('.acaList').html(st);
						$('.acaList').niceSelect('update');
						console.log("done end >>> "+resParam);
					}).fail(function(resParam){
						alert("에러");
					});					
			}//ajaxGetAcaList

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
						console.log("ajaxGetCity resParam >>> "+resParam);
						var st = "";
						for(i in resParam.cityList){
							var city = resParam.cityList[i].city; //강남 강북
							st += "<option value='"+city+"'>"+city+"</option>\n";
						}
						$('select#city').html(st);
						$('select#city').niceSelect('update');
						console.log("ajaxGetCity end >>>");
					}).fail(function(resParam){
						alert("에러");
					});
				}//getCity 
				
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
						console.log()
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
		
		table{
			border-spacing : 10px;
			border-collapse : separate;
			margin : auto;
			align : center;
		}
		.genric-btn {
	   		color: #fff;
	   		background: #140C40;
	   		width: 100px;
	   		border: 1px solid transparent;
		}
		#form {
			margin: auto;
		}
		#show{
			margin : 0 auto;
			text-align : center;
			padding : 200px 200px;
		}
		</style>
	</head>
	<body>
		<main>
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-lg-10 col-md-10" id="form">
							<table class="search-table">
								<tr class="search-header">
									<td class="select-district">
										<select id="district">
											<option value=""></option>
										</select>
									</td>
									<td class="select-city">
										<select id="city">
											<option value=""></option>
										</select>
									</td>
									<td class="select-cmajor">
										<select id="cmajor">
											<option value=""></option>
										</select>
									</td>
									<td class="select-cminor">
										<select id="cminor">
											<option value=""></option>
										</select>
									</td>
									<td class="button-search">
									<input type="button" id="search" class="genric-btn primary" value="검색">
									</td>
								</tr>
							</table>
							<div class="acaList"><p id="show">검색조건을 입력하세요<p></div>
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