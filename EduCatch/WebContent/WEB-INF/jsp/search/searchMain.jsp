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
		
			//무한스크롤 현재페이지 변수 선언 함수
			$(document).ready(function(){
				var start = {
				        param : {
				            scrollPage : 1,
				        },
					}
				//초기 지역 함수 
				ajaxGetDistrict();
				//초기 카테고리 함수
				ajaxGetMajor();
				
				//지역 대분류 변경시 지역소 분류 자동 변경
				$('.select-district').on('change','select',function(){
					console.log("change district");
					var setDistrict = $('#district').val();
					console.log("setDistrict >>> "+setDistrict);
					ajaxGetCity(setDistrict);
				});//setDistrict
				
 				//카테고리 대분류 변경시 카테고리 소분류 자동 변경
				$('.select-cmajor').on('change','select',function(){
					console.log("change cmajor");
					var setCmajor = $('#cmajor').val();
					console.log("setCmajor >>> "+setCmajor);
					ajaxGetMinor(setCmajor);
				});//setDistrict
				
				//검색시 AcaList호출
				$('#search').click(function(){
					//학원 리스트 출력에는 2개의 ajax가 있다
					//학원명 검색과 지역/카테고리 검색이다
					//새로고침없이 둘다 사용하게 되면 ajax가 쌓이므로 
					//무한스크롤 ajax실행시 scrollPage를 초기화 시켜주기 위한 함수이다
					$(window).off("scroll");
					var setDistrict = $('#district').val(); //서울
					var setCity = $('#city').val(); //서울전체
					var setCmajor = $('#cmajor').val(); //언어
					var setCminor = $('#cminor').val(); //언어전체
					var setAname = $('#aname').val(); //언어전체
					var setDesc = "필터 설정";
					console.log("click setDistrict >>> "+setDistrict);
					console.log("click setCity >>> "+setCity);
					console.log("click setCmajor >>> "+setCmajor);
					console.log("click setCminor >>> "+setCminor);
					console.log("click setAname >>> "+setAname);
					//스크롤 카운트 초기화
					start.param.scrollPage = 1;
					scrollPage = start.param.scrollPage;
					console.log("start.param.scrollPage >>> "+scrollPage);
					ajaxGetAcaList(setDistrict,setCity,setCmajor,setCminor,setAname,setDesc,scrollPage);
				});//search button function
				
				//call 함수호출 
				function ajaxGetAcaList(setDistrict,setCity,setCmajor,setCminor,setAname,setDesc,scrollPage){
					console.log("ajaxGetAcaList setDistrict >>> "+setDistrict);
					console.log("ajaxGetAcaList setCity >>> "+setCity);
					console.log("ajaxGetAcaList setCmajor >>> "+setCmajor);
					console.log("ajaxGetAcaList setCminor >>> "+setCminor);
					console.log("ajaxGetAcaList setAname >>> "+setAname);
					console.log("ajaxGetAcaList setDesc >>> "+setDesc);
					urls = "getAcaList.ec";
					datas = {
							 "district" : setDistrict
							,"city" : setCity
							,"cmajor" : setCmajor
							,"cminor" : setCminor
							,"aname" : setAname
							,"setDesc" : setDesc
							,"scrollPage" : scrollPage
							};
					console.log("urls >>> "+urls);
					console.log("datas >>> "+datas);
					$.ajax({
						url : urls,
						data : datas
					}).done(function(resParam){
						if(resParam.acaList==""){
							console.log("done error >>> ");
								st = "<p style='margin:0 auto; text-align:center; padding:200px 100px;'>일치하는 학원이 없습니다</p>";
							}else{
						console.log("done start >>> "+resParam);
						st = "";
						console.log("acaList >>> "+resParam.acaList);
						console.log("setDesc >>> "+setDesc);
							var listcount = resParam.acaList[0].listcount;
							st = "<p>";
							st+= "<div class='sidebar'><h5>"+listcount+"개의 학원이 조회되었습니다</h5>";
							st+= "<span class='select-desc'><select id='desc' style='height:25px;'>";
							//필터설정 select box의 option을 변경할때마다 ajax를 다시 실행하게 됨으로 
							//option값이 계속 초기화가 된다 그래서 if문을 이용해서 선택한 option값을 상단에 띄우고
							//나머지 option값을 일일히 세팅했다
							if(setDesc=="평점 높은순"){
							st+= "<option id='filter'>"+setDesc+"</option>";	
							st+= "<option id='filter'>기본순</option>";
							st+= "<option id='heightReview' value='리뷰 많은순'>리뷰 많은순</option>";
							}else if(setDesc=="리뷰 많은순"){
							st+= "<option id='filter'>"+setDesc+"</option>";	
							st+= "<option id='filter'>기본순</option>";
							st+= "<option id='heightGrade' value='평점 높은순'>평점 높은순</option>";
							}else{
							st+= "<option id='filter'>기본순</option>";
							st+= "<option id='heightGrade' value='평점 높은순'>평점 높은순</option>";
							st+= "<option id='heightReview' value='리뷰 많은순'>리뷰 많은순</option>";
							}
							st+= "</select></span>";
							st+= "</div>";
							st+= "</p>";
						for(i in resParam.acaList){
							var cmajor = resParam.acaList[i].cmajor;
							var cminor = resParam.acaList[i].cminor;
							var ano = resParam.acaList[i].ano;
							var aname = resParam.acaList[i].aname;
							var	alogo = resParam.acaList[i].alogo;
							var aaddr1 = resParam.acaList[i].aaddr1;
							var aaddr2 = resParam.acaList[i].aaddr2;
							var agrade = resParam.acaList[i].agrade;
							var rvcount = resParam.acaList[i].rvcount;
							st += "<div class='panel panel-default'>";
							st += "<a href='listDetailView.ec?ano="+ano+"' style='text-decoration:none'>";
							st += "<div class='media'>";
							st += "<div class='media-left'>";
							st += "<img src='assets/img/academyLogo/"+alogo+"' class='media-object' style='width:125px; height:125px'>";
							st += "</div>";
							st += "<div class='media-body'>";
							st += "<br><div class='title'><h4 class='media-heading'>"+aname+"</h4>&nbsp;&nbsp;&nbsp;<h5>#"+cmajor+"&nbsp;#"+cminor+"</h5></div>";
							st += "<div><h5><img src='assets/img/Icon_location.png' style='width:15px; height:15px'>"+aaddr1+"</h5></div>";
							st += "<div class='title'>&nbsp;<h4>평점 "+agrade+"</h4>";
							st += "&nbsp;<h5>(평가  "+rvcount+"개)</h5></div>";
							st += "</div>";
							st += "</div>";
							st += "</a>";
							st += "</div>";
						}
						
						//무한스크롤
						$(window).on("scroll", function() {
							console.log("acaList scroll");
							//document의 높이
							var scrollHeight = $(document).height();
							//window의 높이 + window의 현재 scroll위치
							var scrollPosition = $(window).height() + $(window).scrollTop();		
							var setAname = $("#aname").val();
							console.log("aname >>> "+setAname);
							//스크롤이 페이지 최하단에 닿았을 시
							if (scrollPosition > scrollHeight - 1) {
								//변수 scrollPage를 ++해준다
								start.param.scrollPage++;
								var scrollPage = start.param.scrollPage;
								console.log(scrollPage);
								//scrollPag를 스크롤ajax함수로 보내준다
								ajaxScroll(setDistrict,setCity,setCmajor,setCminor,setAname,setDesc,scrollPage);
							}
						});//무한스크롤
					}//학원명이 있을시 if
						$('.acaList').html(st);
						$('.acaList').niceSelect('update');
						console.log("done end >>> "+resParam);
						//지역,카테고리,학원명,필터설정,현재스크롤값
						selectDesc(setDistrict,setCity,setCmajor,setCminor,setAname,setDesc,scrollPage);
					}).fail(function(resParam){
						alert("에러");
					});					
				}//ajaxGetAcaList
				
				//무한스크롤 ajax
				//스크롤이 페이지의 최하단에 닿을시 위에 선언한 함수에서 ajaxScroll()을 call하게 된다
				function ajaxScroll(setDistrict,setCity,setCmajor,setCminor,setAname,setDesc,scrollPage){
					console.log("scroll setAname >>> "+setAname);
					console.log("scroll setDesc >>> "+setDesc);
					console.log("scroll scrollPage >>> "+scrollPage);
					urls = "getAcaList.ec";
					datas = {
							 "district" : setDistrict
							,"city" : setCity
							,"cmajor" : setCmajor
							,"cminor" : setCminor
							,"aname" : setAname
							,"setDesc" : setDesc
							,"scrollPage" : scrollPage
					};
					$.ajax({
						 data : datas
					    ,url : urls
					}).done(function(resParam){
						console.log("done start >>> "+resParam);
						var st = "";
						console.log("acaList >>> "+resParam.acaList);
						for(i in resParam.acaList){
							var cmajor = resParam.acaList[i].cmajor;
							var cminor = resParam.acaList[i].cminor;
							var ano = resParam.acaList[i].ano;
							var aname = resParam.acaList[i].aname;
							var	alogo = resParam.acaList[i].alogo;
							var aaddr1 = resParam.acaList[i].aaddr1;
							var aaddr2 = resParam.acaList[i].aaddr2;
							var agrade = resParam.acaList[i].agrade;
							var rvcount = resParam.acaList[i].rvcount;
							st += "<div class='panel panel-default'>";
							st += "<a href='listDetailView.ec?ano="+ano+"' style='text-decoration:none'>";
							st += "<div class='media'>";
							st += "<div class='media-left'>";
							st += "<img src='assets/img/academyLogo/"+alogo+"' class='media-object' style='width:125px; height:125px'>";
							st += "</div>";
							st += "<div class='media-body'>";
							st += "<br><div class='title'><h4 class='media-heading'>"+aname+"</h4>&nbsp;&nbsp;&nbsp;<h5>#"+cmajor+"&nbsp;#"+cminor+"</h5></div>";
							st += "<div><h5><img src='assets/img/Icon_location.png' style='width:15px; height:15px'>"+aaddr1+"</h5></div>";
							st += "<div class='title'>&nbsp;<h4>평점 "+agrade+"</h4>";
							st += "&nbsp;<h5>(평가  "+rvcount+"개)</h5></div>";
							st += "</div>";
							st += "</div>";
							st += "</a>";
							st += "</div>";
							}
						//데이터를 더하기 위해 append를 사용했다
						$('.acaList').append(st);
						$('.acaList').niceSelect('update');
					}).fail(function(resParam){
						alert("scroll error");
					});
				}
				//필터 설정
				function selectDesc(setDistrict,setCity,setCmajor,setCminor,setAname,setDesc,setScrollPage){
					console.log("selectDesc setDistrict >>> "+setDistrict);
					console.log("selectDesc setCity >>> "+setCity);
					console.log("selectDesc setCmajor >>> "+setCmajor);
					console.log("selectDesc setCminor >>> "+setCminor);
					console.log("selectDesc setAname >>> "+setAname);
					$('.select-desc').on('change','select',function(selectDesc){
						console.log("select-desc selectDesc >>> "+selectDesc.setDistrict);
						//선택된 option값을 setDesc에 넣어서 함수로 보낸다
						var setDesc = $('#desc').val();
						console.log("setDesc >>> "+setDesc);
						ajaxGetAcaList(setDistrict,setCity,setCmajor,setCminor,setAname,setDesc,setScrollPage);
					});
				}//selectDesc
				
				//학원명으로 엔터키 검색
				$('#aname').keypress(function(key){
					if(key.which == 13 && setAname!=""){
						$(window).off("scroll");
						var setAname = $('#aname').val();
						var setDesc = "필터 설정";
						console.log("aname >>> "+setAname);
						//스크롤 카운트 초기화
						start.param.scrollPage = 1;
						scrollPage = start.param.scrollPage;
						console.log("start.param.scrollPage >>> "+scrollPage);
						ajaxGetAname(setAname,setDesc,scrollPage);
					}
				});//search enter
				
				//학원명으로 검색
				$('#search-aname').click(function(){
					$(window).off("scroll");
					var setAname = $('#aname').val();
					var setDesc = "필터 설정";
					if(setAname==""){
						alert("학원명을 입력하세요");
					}else{
					console.log("aname >>> "+setAname);
					//스크롤 카운트 초기화
					start.param.scrollPage = 1;
					scrollPage = start.param.scrollPage;
					console.log("start.param.scrollPage >>> "+scrollPage);
					ajaxGetAname(setAname,setDesc,scrollPage);
					}//학원명 입력 유무
				});//search aname button function
				
				//학원명 리스트출력 ajax
				function ajaxGetAname(setAname,setDesc,scrollPage){
					console.log("ajaxGetAname setAname >>> "+setAname);
					console.log("ajaxGetAname setDesc >>> "+setDesc);
					console.log("ajaxGetAname scrollPage >>> "+scrollPage);
					urls = "getAcaList.ec";
					datas = {
							"aname" : setAname
						   ,"setDesc" : setDesc
						   ,"scrollPage" : scrollPage
							};
					console.log("urls >>> "+urls);
					console.log("datas >>> "+datas);
					$.ajax({
							url : urls,
							data : datas
					}).done(function(resParam){
						if(resParam.acaList==""){
						console.log("done error >>> ");
							st = "<p style='margin:0 auto; text-align:center; padding:200px 100px;'>일치하는 학원이 없습니다</p>";
						}else{
						console.log("done start >>> "+resParam);
						var st = "";
						console.log("acaList >>> "+resParam.acaList);
							var listcount = resParam.acaList[0].listcount;
							st = "<p>";
							st+= "<div class='sidebar'><h5>"+listcount+"개의 학원이 조회되었습니다</h5>";
							st+= "<span class='select-desc'><select id='desc' style='height:25px;'>";
							if(setDesc=="평점 높은순"){
							st+= "<option id='filter'>"+setDesc+"</option>";	
							st+= "<option id='filter'>기본순</option>";
							st+= "<option id='heightReview' value='리뷰 많은순'>리뷰 많은순</option>";
							}else if(setDesc=="리뷰 많은순"){
							st+= "<option id='filter'>"+setDesc+"</option>";	
							st+= "<option id='filter'>기본순</option>";
							st+= "<option id='heightGrade' value='평점 높은순'>평점 높은순</option>";
							}else{
							st+= "<option id='filter'>기본순</option>";
							st+= "<option id='heightGrade' value='평점 높은순'>평점 높은순</option>";
							st+= "<option id='heightReview' value='리뷰 많은순'>리뷰 많은순</option>";
							}
							st+= "</select></span>";
							st+= "</div>";
							st+= "</p>";
						for(i in resParam.acaList){
							var cmajor = resParam.acaList[i].cmajor;
							var cminor = resParam.acaList[i].cminor;
							var ano = resParam.acaList[i].ano;
							var aname = resParam.acaList[i].aname;
							var	alogo = resParam.acaList[i].alogo;
							var aaddr1 = resParam.acaList[i].aaddr1;
							var aaddr2 = resParam.acaList[i].aaddr2;
							var agrade = resParam.acaList[i].agrade;
							var rvcount = resParam.acaList[i].rvcount;
							st += "<div class='panel panel-default'>";
							st += "<a href='listDetailView.ec?ano="+ano+"' style='text-decoration:none'>";
							st += "<div class='media'>";
							st += "<div class='media-left'>";
							st += "<img src='assets/img/academyLogo/"+alogo+"' class='media-object' style='width:125px; height:125px'>";
							st += "</div>";
							st += "<div class='media-body'>";
							st += "<br><div class='title'><h4 class='media-heading'>"+aname+"</h4>&nbsp;&nbsp;&nbsp;<h5>#"+cmajor+"&nbsp;#"+cminor+"</h5></div>";
							st += "<div><h5><img src='assets/img/Icon_location.png' style='width:15px; height:15px'>"+aaddr1+"</h5></div>";
							st += "<div class='title'>&nbsp;<h4>평점 "+agrade+"</h4>";
							st += "&nbsp;<h5>(평가  "+rvcount+"개)</h5></div>";
							st += "</div>";
							st += "</div>";
							st += "</a>";
							st += "</div>";
							}
						//무한스크롤
						$(window).on("scroll", function() {
							var scrollHeight = $(document).height();
							var scrollPosition = $(window).height() + $(window).scrollTop();		
							var setAname = $("#aname").val();
							console.log("aname >>> "+setAname);
							if (scrollPosition > scrollHeight - 1) {
								start.param.scrollPage++;
								var scrollPage = start.param.scrollPage;
								console.log(scrollPage);
								ajaxGetScroll(setAname,setDesc,scrollPage);
							}
						});//무한스크롤
						}//검색한 학원이 있을때
						$('.acaList').html(st);
						$('.acaList').niceSelect('update');
						console.log("done end >>> "+resParam);
						selectDescName(setAname);
					}).fail(function(resParam){
						alert("에러");
					});
				}//ajaxGetAname
				
				//무한스크롤 ajaxAname
				function ajaxGetScroll(setAname,setDesc,scrollPage){
					console.log("scroll setAname >>> "+setAname);
					console.log("scroll setDesc >>> "+setDesc);
					console.log("scroll scrollPage >>> "+scrollPage);
					urls = "getAcaList.ec";
					datas = {
							 "aname" : setAname
							,"setDesc" : setDesc
							,"scrollPage" : scrollPage
					};
					$.ajax({
						 data : datas
					    ,url : urls
					}).done(function(resParam){
						console.log("done start >>> "+resParam);
						var st = "";
						console.log("acaList >>> "+resParam.acaList);
						for(i in resParam.acaList){
							var cmajor = resParam.acaList[i].cmajor;
							var cminor = resParam.acaList[i].cminor;
							var ano = resParam.acaList[i].ano;
							var aname = resParam.acaList[i].aname;
							var	alogo = resParam.acaList[i].alogo;
							var aaddr1 = resParam.acaList[i].aaddr1;
							var aaddr2 = resParam.acaList[i].aaddr2;
							var agrade = resParam.acaList[i].agrade;
							var rvcount = resParam.acaList[i].rvcount;
							st += "<div class='panel panel-default'>";
							st += "<a href='listDetailView.ec?ano="+ano+"' style='text-decoration:none'>";
							st += "<div class='media'>";
							st += "<div class='media-left'>";
							st += "<img src='assets/img/academyLogo/"+alogo+"' class='media-object' style='width:125px; height:125px'>";
							st += "</div>";
							st += "<div class='media-body'>";
							st += "<br><div class='title'><h4 class='media-heading'>"+aname+"</h4>&nbsp;&nbsp;&nbsp;<h5>#"+cmajor+"&nbsp;#"+cminor+"</h5></div>";
							st += "<div><h5><img src='assets/img/Icon_location.png' style='width:15px; height:15px'>"+aaddr1+"</h5></div>";
							st += "<div class='title'>&nbsp;<h4>평점 "+agrade+"</h4>";
							st += "&nbsp;<h5>(평가  "+rvcount+"개)</h5></div>";
							st += "</div>";
							st += "</div>";
							st += "</a>";
							st += "</div>";
							}
						$('.acaList').append(st);
						$('.acaList').niceSelect('update');
					}).fail(function(resParam){
						alert("scroll error");
					});
				}
				
				//리스트 정렬 이름으로
				function selectDescName(setAname){
					console.log("selectDesc setAname >>> "+setAname);
					$('.select-desc').on('change','select',function(selectDesc){
						console.log("select-desc");
						console.log("select-desc selectDesc >>> "+selectDesc.setAname);
						var setDesc = $('#desc').val();
						console.log("setDesc >>> "+setDesc);
						ajaxGetAname(setAname,setDesc);
					});
				}//selectDesc
				
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
							var district = resParam.districtList[i];
							console.log("option value >>>"+district);
							st += "<option value='"+district+"'>"+district+"</option>\n";
						}
						$('select#district').html(st);
						$('select#district').niceSelect('update');
						console.log("ajaxGetDistrict end >>>");
						//ajaxGetCity함수에 district의 값을 보내서 
						//같은 row의 city값을 세팅해주기 위함
						ajaxGetCity(resParam.districtList[0]);
					}).fail(function(resParam){
						alert("오류");
					});
				}//getDistrict
				
				//지역 소분류
				//ajaxGetCity함수에 값 district를 갖고와서 controller로 보낸다
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
						//call select box scroll
						//select box값이 많아서 scroll을 넣었다
						callNiceSelect(resParam);
						console.log("ajaxGetCity end >>>");
					}).fail(function(resParam){
						alert("에러");
					});
				}//getCity 
				
				//select box scorll
				function callNiceSelect(resParam){
					console.log("callNiceSelect >>> "+resParam.cityList[0].city);
					//select box가 bootstram으로 되어있다
					//select box인 nice-select 클릭시 
					//option 값인 list를 변수 선언하여 list에 css를 추가했다
					$('.nice-select').click(function(){
						console.log("nice-select click");
						var list = $('.list');
						console.log("list >>> "+list);
						list.css("overflow","auto");
						//select box option size media query별로 설정
						var mql1 = window.matchMedia("screen and (min-width: 767px) and (max-width: 1023px)");
						var mql2 = window.matchMedia("screen and (min-width: 321px) and (max-width: 480px)");
						
						if(mql1.matches){
							list.css("width","600px");		
						}else if(mql2.matches){
							list.css("width","350px");
						}else{
							list.css("width","");
						}
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
						callNiceSelectMinor(resParam);
					}).fail(function(resParam){
						alert("에러");
					});
				}//getMinor
				
				//scroll function
				function callNiceSelectMinor(resParam){
					console.log("callNiceSelect >>> "+resParam.minor[0].cminor);
					$('.nice-select').click(function(){
						console.log("nice-select click");
						var list = $('.list');
						console.log("list >>> "+list);
						list.css("overflow","auto");
						
						var mql1 = window.matchMedia("screen and (min-width: 767px) and (max-width: 1023px)");
						var mql2 = window.matchMedia("screen and (min-width: 321px) and (max-width: 480px)");
						
						if(mql1.matches){
							list.css("width","600px");		
						}else if(mql2.matches){
							list.css("width","350px");
						}else{
							list.css("width","");
						}
					});
				};
				
			});//document function
		</script>
	
		<style type="text/css">
		
		/* 모니터 */
		@media screen and (min-width: 1024px) {
			.box {
				margin : auto;
				display : grid;
				grid-template-columns : 185px 1fr 1fr 1fr 1fr 1fr 1fr;
				grid-column-gap: 5px;
			}
			.nice-select {
				width:135px;
			}
			.genric-btn {
		   		color: #fff;
		   		background: #140C40;
		   		width: 90px;
		   		border: 1px solid transparent;
 			}
 			/* 무한스크롤 footer고정 */
			.footer-bottom-area {
				width: 100%;
			    height: auto;
			    bottom: 0;
			    left: 0;
		    	position: fixed;
			}
			.acaList {
				padding-bottom: 40px;
			}
		}
		/* 테블릿 */
		@media screen and (max-width: 1023px) {
			.box {
				display : grid;
				grid-template-rows : repeat(7, 1fr);
				grid-row-gap: 10px;
			}
			.nice-select {
				width:570px;
			}
		}
		/* 모바일 가로모드 */
		@media screen and (max-width: 767px) {
			.box {
				display : grid;
				grid-template-rows : repeat(7, 1fr);
				grid-row-gap: 10px;
			}
			.nice-select {
				width:510px;
			}
		}
		/* 모바일 세로모드 */
		@media screen and (max-width: 480px) {
			.box {
				display : grid;
				grid-template-rows : repeat(7, 1fr);
				grid-row-gap: 10px;
			}
			.nice-select {
				width:350px;
			}
			.genric-btn {
		   		color: #fff;
		   		background: #140C40;
		   		width: 350px;
		   		border: 1px solid transparent;
			}
			#aname{
				width:350px;		
			}
		}
		/* 모바일 최소 */
		@media screen and (max-width: 320px) {
			.box {
				display : grid;
				grid-template-rows : repeat(7, 1fr);
				grid-row-gap: 10px;
			}
			.nice-select {
				width:300px;
			}
			.genric-btn {
		   		color: #fff;
		   		background: #140C40;
		   		width: 300px;
		   		border: 1px solid transparent;
			}
			#aname{
				width:300px;		
			}
		}
		/* 한줄에 2개의 태그  */
		.title h4, .title h5 {
			display:inline;
			
		}
		.sidebar {
			display : grid;
			grid-template-columns : 10fr 1fr;
		}
 		.list { 
 		    height:300px; 
 		    width:140px;
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
						<input type="text" id="aname" name="aname" size="58px" style="height:42px" class="form-control" placeholder="학원명으로 입력해보세요">
						<input type="button" id="search-aname" class="genric-btn primary" value="검색">
					<div class="select-district">
						<select id="district">
							<option></option>
						</select>
					</div>
					<div class="select-city">
						<select id="city">
							<option></option>
						</select>
					</div>
					<div class="select-cmajor">
						<select id="cmajor">
							<option></option>
						</select>
					</div>
					<div class="select-cminor">
						<select id="cminor">
							<option></option>
						</select>
					</div>
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