<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="com.kosmo.educatch.vo.SubjectVO"%>
<%@page import="com.kosmo.educatch.vo.ConvenienceVO"%>
<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<% 
	Object obj4 = session.getAttribute("user");
	MemberVO memberVO = new MemberVO();
	if(obj4!=null){
		memberVO = (MemberVO)obj4;
	}
%>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/EduCatch/assets/img/favicon-96x96.png"
	type="image/x-icon">
<link rel="icon" href="/EduCatch/assets/img/favicon-96x96.png"
	type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/timepicker@1.13.14/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/timepicker@1.13.14/jquery.timepicker.min.css">
<%-- -----------CSS------------- --%>
<style type="text/css">
/* Mobile Device (가로폭 767px 이하) */
	@media all and (max-width:767px) {
		#mapWrapper{
			width:100%;
			height:300px;
			position:relative
		}
		#map{
			width:375px;height:350px;
		}
		#rvWrapper{
			width:100%;height:300px;position:absolute;top:0;left:0;
		}
		#roadview{
			width:375px;height:350px;
		}
		.sns-share{
			width:375px;
		}
		#content{
		width:375px;
		height:auto;
		margin:0 auto;
		background:#ffffff;
		}
		#follow{
			margin-left:0px;
		}
		#logoimg{
			margin-right:200px;
		}
		#addrev{
			margin-left:0px;
		}
		#all{
		background:#f3f3f3;
}
.section {
    margin-top: 10px;
    line-height: 33px;
    margin-left: 0px;
    margin-right: 0px;
}
.padding-top10 {
    padding-top:10px;
}

#section-1 {
    height: auto;
    background-color: #ffffff;
    color: #fff;
    padding: 20px;
}
#section-2 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-3 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-4 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-5 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}

#actb{
	font-size: 12px;
}
.nav {
  background-color: rgba(51, 51, 51, 0.9);
  width: 100%;
  height: 60px;
  top: 0;
}
.nav-menu li {
    display: inline-block;
    margin-right: 0px;
    line-height: 60px;
}
.nav-menu-item {
    display: block;
    padding: 0 3px;
    color: #fff;
    text-decoration: none;          
}
.nav-menu-item:hover,
.isactive {
    background-color: #222;
    color: #fff;
}
.subth{
	display:none;
}

	}
/* PC Desktop (가로폭 1024 이상) */
	@media all and (min-width:1024px) {
		#mapWrapper{
			width:100%;
			height:300px;
			position:relative
		}
		#map{
			width:1100px;height:350px;
		}
		#rvWrapper{
			width:100%;height:300px;position:absolute;top:0;left:0;
		}
		#roadview{
			width:1100px;height:350px;
		}
		#content{
		width:1100px;
		height:auto;
		margin:0 auto;
		border-left:1px solid #d8d8d8;
		border-right:1px solid #d8d8d8;
		border-top:1px solid #d8d8d8;
		border-bottom:1px solid #d8d8d8;
		background:#ffffff;
		
		}
		#follow{
			margin-left:450px;
		}
		#addrev{
			margin-left:700px;
		}
		#all{
		border-left:1px solid #f3f3f3;
		border-right:1px solid #f3f3f3;
		background:#f3f3f3;
}
.section {
    margin-top: 60px;
    line-height: 22px;
    margin-left: 100px;
    margin-right: 100px;
}
.padding-top10 {
    padding-top:10px;
}

#section-1 {
    height: auto;
    background-color: #ffffff;
    color: #fff;
    padding: 20px;
}
#section-2 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-3 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-4 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#section-5 {
  height: auto;
  background-color: #ffffff;
  color: #fff;
  padding: 20px;
}
#actb{
}
.nav {
  background-color: rgba(51, 51, 51, 0.9);
  width: 100%;
  height: 60px;
  top: 0;
}
.nav-menu li {
    display: inline-block;
    margin-right: -6px;
    line-height: 60px;
}
.nav-menu-item {
    display: block;
    padding: 0 79px;
    color: #fff;
    text-decoration: none;          
}
.nav-menu-item:hover,
.isactive {
    background-color: #222;
    color: #fff;
}
.subth{
}
	}

#mrcontainer {overflow:hidden;height:300px;position:relative;}
#btnRoadview,  #btnMap {position:absolute;top:5px;left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
#btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
#mrcontainer.view_map #mapWrapper {z-index: 10;}
#mrcontainer.view_map #btnMap {display: none;}
#mrcontainer.view_roadview #mapWrapper {z-index: 0;}
#mrcontainer.view_roadview #btnRoadview {display: none;}

#fontman{
		font-weight: bold;
}

#hhr {
    border-bottom: 5px solid #eceff8;
    border-top: 0 none;
    margin: 30px 0;
    padding: 0;
}

.table{

	color:black;
}


body {
  background: #2ecc71;
  font-size: 62.5%;
}


<%-- 버튼 CSS --%>
.btn1{
  background:#172295;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:1.2em;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 12px;
}
.btn1:hover{
  background:#fff;
  color:#172295;
}
.btn1:before,.btn1:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #172295;
  transition:400ms ease all;
}
.btn1:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn1:hover:before,.btn1:hover:after{
  width:100%;
  transition:800ms ease all;
}


<%-- 스크롤스파이 --%>
* {
  margin: 0;
  padding: 0;
}



<%-- SNS 공유하기 --%>
.sns-share {
         text-align:right; 
         padding: 15px 0;
      
      }
      .sns-share li {
         display:inline-block; 
         margin: 0 5px; 
         
      }
      
      .sns-share img {
         border-radius: 20%;
         width : 32px;
         height : 32px;
         
      }


<%-- --전체,컨텐츠-- --%>  


#linked{ 
		color: black;

}







<!-- 이곳은 카카오맵 API-->

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 700px;
	height: 350px;
}

.radius_border1 {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol1 {
	position: absolute;
	top: 10px;
	right: 10px;
	/* overflow: hidden; */
	/* width: 130px; */
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol1 span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol1 .btn10 {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol1 .btn10:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol1 .btn10:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol1 .selected_btn10 {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol1 .selected_btn10:hover {
	color: #fff;
}

.custom_zoomcontrol1 {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol1 span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol1 span img {
	width: 15px;
	/* height: 15px; */
	padding: 12px 0;
	border: none;
	z-index: 10;
}

.custom_zoomcontrol1 span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
.fc-daygrid-day :hover{
	background-color:#fff4e3;
}
 .fc-day { 
	color:#212529;  
 }
.fc-day-sun { 
	color:red;  
 }
 .fc-day-sat { 
	color:blue;  
 }
 .fc-day-other .fc-daygrid-day-number { display:none;}
 .modal-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  padding: 1rem 1rem;
  border-bottom: 1px solid #dee2e6;
  border-top-left-radius: calc(0.3rem - 1px);
  border-top-right-radius: calc(0.3rem - 1px);
}
.modal-header .close {
  padding: 1rem 1rem;
  margin: -1rem -1rem -1rem auto;
}

.modal-title {
  margin-bottom: 0;
  line-height: 1.5;
}

.modal-body {
  position: relative;
  flex: 1 1 auto;
  padding: 1rem;
}

.modal-footer {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: flex-end;
  padding: 0.75rem;
  border-top: 1px solid #dee2e6;
  border-bottom-right-radius: calc(0.3rem - 1px);
  border-bottom-left-radius: calc(0.3rem - 1px);
}
.modal-footer > * {
  margin: 0.25rem;
}

.modal-scrollbar-measure {
  position: absolute;
  top: -9999px;
  width: 50px;
  height: 50px;
  overflow: scroll;
}

@media (min-width: 576px) {
  .modal-dialog {
    max-width: 500px;
    margin: 1.75rem auto;
  }

  .modal-dialog-scrollable {
    max-height: calc(100% - 3.5rem);
  }
  .modal-dialog-scrollable .modal-content {
    max-height: calc(100vh - 3.5rem);
  }

  .modal-dialog-centered {
    min-height: calc(100% - 3.5rem);
  }
  .modal-dialog-centered::before {
    height: calc(100vh - 3.5rem);
    height: -webkit-min-content;
    height: -moz-min-content;
    height: min-content;
  }

  .modal-sm {
    max-width: 300px;
  }
}
@media (min-width: 992px) {
  .modal-lg,
.modal-xl {
    max-width: 800px;
  }
}
@media (min-width: 1200px) {
  .modal-xl {
    max-width: 1140px;
  }
}
</style>


<%-- -----------스크립트------------- --%>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.css">
<!--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fb37ba283dc18386af651f85d45ef34&libraries=services,clusterer,drawing"></script>-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b7f350ead2b7c77b31a6b3a2be10fbd"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		
		$('#addrev').click(function(){
			 $("#pageForm").attr("action","inserttDisplay.ec");
	         $("#pageForm").attr("method","POST");
	         $("#pageForm").submit();  
		});
		
		<%-- 찜하기 버튼 클릭 --%>
		$('#follow').click(function(){
			
			if($('#follow').val() == '찜추가')
			{
				var academy_ano = $('#academy_ano').val();
				var member_mno = $('#member_mno').val();
				var ano = $('#ano').val();
				
				$.ajax({
					url : "insertBookmark.ec?ano=" + ano,
					type : "post",
					data : {
						"academy_ano" : academy_ano,
						"member_mno" : member_mno,
						"ano" : ano,
						},
					dataType : "json"
				}).done(function(resultParam){
					if(resultParam.result=="success"){
						$('#follow').val('찜제거');
					}else{
						alert('정상적으로 데이터가 등록되지 않았습니다.')
					}
				}).fail(function(resultParam){
					if(resultParam.readyState == 4){
						alert(resultParam.responseText);
					}else{
						alert("추가시 DB연결에 문제가 발생하였습니다.");	
					}
				});
			}
			else
			{
				var academy_ano = $('#academy_ano').val();
				var member_mno = $('#member_mno').val();
				var ano = $('#ano').val();
				
				$.ajax({
					url : "deleteBookmark.ec?ano=" + ano,
					type : "post",
					data : {
						"academy_ano" : academy_ano,
						"member_mno" : member_mno,
						"ano" : ano,
						},
					dataType : "json"
				}).done(function(resultParam){
					if(resultParam.result=="success"){
						$('#follow').val('찜추가');
					}else{
						alert('정상적으로 데이터가 등록되지 않았습니다.')
					}
				}).fail(function(resultParam){
					if(resultParam.readyState == 4){
						alert(resultParam.responseText);
					}else{
						alert("추가시 DB연결에 문제가 발생하였습니다.");	
					}
				});
			}
			
		});
		
		
		<%-- 스크롤사이드 --%>
		var $menu = $(".nav-menu");
	      var $menu_a = $("a", $menu);
	      var id = false;
	      var sections = [];
	      var hash = function(h) {
	        if (history.pushState) {
	          history.pushState(null, null, h);
	        } else {
	          location.hash = h;
	        }
	      };

	      $menu_a.click(function(event) {
	        event.preventDefault();
	        $("html, body").animate(
	          {
	            scrollTop: $($(this).attr("href")).offset().top - $(".nav").height()
	          },
	          {
	            duration: 700,
	            complete: hash($(this).attr("href"))
	          }
	        );
	      });

	      $menu_a.each(function() {
	        sections.push($($(this).attr("href")));
	      });

	      $(window).scroll(function(event) {
	        var scrolling = $(this).scrollTop() + $(this).height() / 3;
	        var scroll_id;
	        for (var i in sections) {
	          var section = sections[i];
	          if (scrolling > section.offset().top) {
	            scroll_id = section.attr("id");
	          }
	        }
	        if (scroll_id !== id) {
	          id = scroll_id;
	          $menu_a.removeClass("isactive");
	          $("a[href='#" + id + "']", $menu).addClass("isactive");
	        }
	      });
	      ajaxGetReser();
	      <%
	      	if(memberVO.getMno() != null){
	      %>
	      ajaxGetBookmark();
	      <%
	      	}
	      %>
	      $('.reser').on('click', '[name=addCancle]',function(e) {
	  		ajaxSetValue(e);
	  	});
	    });
	
	function ajaxGetBookmark(){
		var academy_ano = $('#academy_ano').val();
		var member_mno = $('#member_mno').val();
		var ano = $('#ano').val();
		
		$.ajax({
			url : "selectBookmark.ec",
			type : "post",
			data : {
				"academy_ano" : academy_ano,
				"member_mno" : member_mno,
				"ano" : ano,
				},
		}).done(function(resultParam){
			if(resultParam.result=="success"){
				$('#follow').val('찜제거');
			}else{
				$('#follow').val('찜추가');
			}
		}).fail(function(resultParam){
			
		});
	}
	function ajaxGetReser(){
		var ano = $('#ano').val();
		var mno = $('#member_mno').val();
		$.ajax({
			url : "selReser.ec",
			type : "post",
			data : {
				"ano" : ano,
				"mno" : mno
				},
		}).done(function(resultParam){
			console.log("success");
			$('.reser > tbody').remove();
			$('.reser').append('<tbody></tbody>');
			if(resultParam.result.length > 0){
				for(i in resultParam.result){
					$('.reser > tbody').append("<tr>");
					$('.reser > tbody').append("<td>"+resultParam.result[i].ttdate+"</td>");
					$('.reser > tbody').append("<td>"+resultParam.result[i].tttime+"</td>");
					$('.reser > tbody').append("<td>"+resultParam.result[i].ttpeople+"</td>");
					$('.reser > tbody').append("<td>"+resultParam.result[i].now+"</td>");
					if(resultParam.result[i].chk>0){
						$('.reser > tbody').append("<td><input id='btn"+resultParam.result[i].ttno+"' name='addCancle' type='button' value='취소' class='btn1 addCancle'/></td>");	
					}else{
						$('.reser > tbody').append("<td><input id='btn"+resultParam.result[i].ttno+"' name='addCancle' type='button' value='신청' class='btn1 addCancle'/></td>");
					}
					$('.reser > tbody').append("</tr>");
				}
			}else{
				$('.reser > tbody').append("<tr><td colspan=5>학원에서 예약정보를 올린것이 없습니다.</td></tr>");
			}
		}).fail(function(resultParam){
			
		});
	}
	
	function ajaxSetValue(v){
		console.log(v.target);
		var url1 = null;
		var mno = $('#member_mno').val();
		var ttno = v.target.id.split("btn")[1];
		if(v.target.value =="취소"){
			url1 = "delReser.ec";
		}else{
			url1 = "inReser.ec"
		}
		console.log(url1);
		
		$.ajax({
			url : url1,
			type : "post",
			data : {
				"ttno" : ttno,
				"mno" : mno
			},
			dataType : "json"
		}).done(function(resultParam){
			if(resultParam.result != "success"){
				
			}else{
				alert("정상적으로 "+v.target.value+"되었습니다.");
			ajaxGetReser();
			}
		}).fail(function(resultParam){
			console.log(resultParam);
			if(resultParam.readyState == 4){
				alert(resultParam.responseText);
			}else{
				alert("추가시 DB연결에 문제가 발생하였습니다.");	
			}
		});
	}
	</script>
</head>
<body>
<%-- -----------부트스크랩 상단------------- --%>
<jsp:include page="../../../top.jsp" flush="true">
	<jsp:param value="" name="" />
</jsp:include>
<%-- ----------- 바디 ------------- --%>
<%
		Object obj1 = request.getAttribute("avo");
		Object obj2 = request.getAttribute("cvo");
		Object obj3 = request.getAttribute("gvo");
		Object listobj1 = request.getAttribute("subjectList"); 
		Object listobj2 = request.getAttribute("reviewlist"); 

		AcademyVO avo = (AcademyVO)obj1;
		ConvenienceVO cvo = (ConvenienceVO)obj2;
		AcademyVO gvo = (AcademyVO)obj3;
		ArrayList subjectlist = (ArrayList)listobj1;
		ArrayList reviewlist = (ArrayList)listobj2;
		
		int subjectnCnt = subjectlist.size();
		int reivewnCnt = reviewlist.size();
		
		double AXPOINT = Double.parseDouble(avo.getAxpoint());
		double AYPOINT = Double.parseDouble(avo.getAypoint());
		String address = avo.getAaddr1() + " " + avo.getAaddr2();
		
		
					
%>

<div id="all"><%-- 전체 div --%>

	<section id="content"> <%-- 컨텐츠(본문) div --%>
	
		<div class="container-fluid"> <%-- top(윗부분) div --%>
			<div id="topcon" class="row" style="margin-top:50px">
				<div class="col-md-4" align="right">
					<input type="hidden" id="ano" name="ano" value="<%=avo.getAno() %>"/>
					<input type="hidden" id="academy_ano" name="academy_ano" value="<%=avo.getAcademy_ano() %>"/>
					<input type="hidden" id="member_mno" name="member_mno" value="<%=memberVO.getMno() %>" />
					<img src="/EduCatch/assets/img/academyLogo/<%= avo.getAlogo() %>" border=0 width="200" height="200" id="logoimg"/>
				</div>
				<div class="col-md-8" style="margin-top:30px">
					<h1 style="font-weight:bold"><%=avo.getAname() %></h1> 
					<input id="follow" name="follow" type="button" value="찜추가" class="btn1" />
					<h3><img src="/EduCatch/assets/img/Icon_location.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;<%=address %> </h3>
					<h3><img src="/EduCatch/assets/img/Icon_call.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;<%=avo.getAtel() %> </h3>
					<h3><img src="/EduCatch/assets/img/Icon_star.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;학원 평가 : <%=gvo.getRbgrade() %>(점) </h3>
				</div>
			</div>
			<div style="margin-right:30px">
			<h4 align="right">업데이트 날짜 : <%= avo.getAupdatedate()%></h4>
			</div>
		</div>
		<%-- 상단 sns공유 div --%>
		<div class="sns-share" style="margin-right:30px">
                 <ul>
                   <li>
                     <a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=http://localhost:8088/EduCatch/listDetailView.ec' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Naver" ><img src="/EduCatch/assets/img/share/naver_blog.png" width="40" alt="네이버 블러그 공유하기"></a>
                   </li>
                   <li>
                     <a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" ><img src="/EduCatch/assets/img/share/facebook.png" width="40" alt="페이스북 공유하기"></a>
                   </li>
                   <li>
                      <a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url=http:' +encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes, height=400,width=600');return false;" target="_blank" alt="Share on kakaostory"><img src="/EduCatch/assets/img/share/kakao.png" width="40" alt="카카오스토리 공유하기"></a>
                   </li>
                 </ul>
        </div>
	
	
		
		<%-- 4분할 탭메뉴 div --%>		
		    <nav class="nav clearfix">
		        <ul class="nav-menu">
		            <li><a class="nav-menu-item" href="#section-1">기본정보</a></li>
		            <li><a class="nav-menu-item" href="#section-2">수업정보</a></li>
		            <li><a class="nav-menu-item" href="#section-3">학원예약</a></li>
		            <li><a class="nav-menu-item" href="#section-4">편의기능</a></li>
		            <li><a class="nav-menu-item" href="#section-5">수강후기</a></li>
		        </ul>
		    </nav>



		<br><br><br>
		<%-- ----------- 카카오맵 API ------------- --%>
		<div id="mrcontainer" class="view_map">
			<div id="mapWrapper" >
				<div id="map"></div>
				<input type="button" id="btnRoadview" onclick="toggleMap(false)" title="로드뷰 보기" value="로드뷰">
			</div>
			 <div id="rvWrapper">
				<div id="roadview"></div>
				<input type="button" id="btnMap" onclick="toggleMap(true)" title="지도 보기" value="지도">
			</div>
		</div>
		
		<script>
		
		var mrcontainer = document.getElementById('mrcontainer'), // 지도와 로드뷰를 감싸고 있는 div 입니다
	    mapWrapper = document.getElementById('mapWrapper'), // 지도를 감싸고 있는 div 입니다
	    btnRoadview = document.getElementById('btnRoadview'), // 지도 위의 로드뷰 버튼, 클릭하면 지도는 감춰지고 로드뷰가 보입니다 
	    btnMap = document.getElementById('btnMap'), // 로드뷰 위의 지도 버튼, 클릭하면 로드뷰는 감춰지고 지도가 보입니다 
	    roadviewContainer = document.getElementById('roadview'); // 로드뷰를 표시할 div 입니다
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(<%=AYPOINT %>, <%=AXPOINT%>), // 지도의 중심좌표
			        level: 3, // 지도의 확대 레벨
			        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
			    }; 
	
			// 지도를 생성한다 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new kakao.maps.MapTypeControl();
	
			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	
	
			// 지도에 확대 축소 컨트롤을 생성한다
			var zoomControl = new kakao.maps.ZoomControl();
	
			// 지도의 우측에 확대 축소 컨트롤을 추가한다
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
			// 지도 중심 좌표 변화 이벤트를 등록한다
			kakao.maps.event.addListener(map, 'center_changed', function () {
				console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
			});
	
			// 지도 확대 레벨 변화 이벤트를 등록한다
			kakao.maps.event.addListener(map, 'zoom_changed', function () {
				console.log('지도의 현재 확대레벨은 ' + map.getLevel() +'레벨 입니다.');
			});
	
			// 지도 영역 변화 이벤트를 등록한다
			kakao.maps.event.addListener(map, 'bounds_changed', function () {
				var mapBounds = map.getBounds(),
					message = '지도의 남서쪽, 북동쪽 영역좌표는 ' +
								mapBounds.toString() + '입니다.';
	
				console.log(message);	
			});
	
			// 지도 시점 변화 완료 이벤트를 등록한다
			kakao.maps.event.addListener(map, 'idle', function () {
				var message = '지도의 중심좌표는 ' + map.getCenter().toString() + ' 이고,' + 
								'확대 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
				console.log(message);
			});
	
			// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
			kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
				console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
			});	
	
			// 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
			kakao.maps.event.addListener(map, 'drag', function () {
				var message = '지도를 드래그 하고 있습니다. ' + 
								'지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.';
				console.log(message);
			});
	
	
			
			
			// 로드뷰 위치
			var rvPosition = new kakao.maps.LatLng(<%=AYPOINT %>, <%=AXPOINT %>);
	
			//로드뷰 객체를 생성한다
			var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
			var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
			var position = new kakao.maps.LatLng(<%=AYPOINT%>, <%=AXPOINT%>);
	
			// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
			roadviewClient.getNearestPanoId(position, 50, function(panoId) {
			    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
			});
	
			// 로드뷰 초기화 완료 이벤트를 등록한다
			kakao.maps.event.addListener(roadview, 'init', function() {
			    console.log('로드뷰 초기화가 완료되었습니다');
			});
	
			// 로드뷰 파노라마 ID 변화 이벤트를 등록한다
			kakao.maps.event.addListener(roadview, 'panoid_changed', function() {
			    console.log('로드뷰의 파노라마 ID가 변경되었습니다');
			});
	
			// 로드뷰 시점 변화 이벤트를 등록한다
			kakao.maps.event.addListener(roadview, 'viewpoint_changed', function() {
				console.log('로드뷰 시점이 변경되었습니다');
			});
	
			// 로드뷰 지도 좌표 변화 이벤트를 등록한다
			kakao.maps.event.addListener(roadview, 'position_changed', function() {
			    console.log('로드뷰 좌표가 변경되었습니다');
			});
			
			// 로드뷰 초기화가 완료되면 
			kakao.maps.event.addListener(roadview, 'init', function() {

			    // 로드뷰에 특정 장소를 표시할 마커를 생성하고 로드뷰 위에 표시합니다 
			    var rvMarker = new kakao.maps.Marker({
			        position: placePosition,
			        map: roadview
			    });
			});
			
			// 지도와 로드뷰를 감싸고 있는 div의 class를 변경하여 지도를 숨기거나 보이게 하는 함수입니다 
			function toggleMap(active) {
			    if (active) {

			        // 지도가 보이도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
			        mrcontainer.className = "view_map"
			    } else {

			        // 지도가 숨겨지도록 지도와 로드뷰를 감싸고 있는 div의 class를 변경합니다
			        mrcontainer.className = "view_roadview"   
			    }
			}
			
			
			
			
			// markers 배열로 두어 marker 들을 넣음
			var markers = [];
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(<%= AYPOINT %>, <%= AXPOINT %>)
			});
			
			markers.push(marker);
			
			// markers를 map에 세팅
			for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }  
			
			var content = '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '          <%= avo.getAname()%>  ' + 
	        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="/EduCatch/assets/img/academyLogo/<%= avo.getAlogo() %>" border=0 width="73" height="70" >' +
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="ellipsis"><%= avo.getAaddr1()%><%= avo.getAaddr2() %> </div>' + 
	        '                <div class="jibun ellipsis">(우)<%= avo.getAaddrno()%> </div> '+ 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
	
			function setMapType(maptype) {
				var roadmapControl = document.getElementById('btnRoadmap');
				var skyviewControl = document.getElementById('btnSkyview');
				if (maptype === 'roadmap') {
					map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
					roadmapControl.className = 'selected_btn10';
					skyviewControl.className = 'btn10';
				} else {
					map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
					skyviewControl.className = 'selected_btn10';
					roadmapControl.className = 'btn10';
				}
			}
			
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: markers[0].getPosition()       
			});
	
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(markers[0], 'click', function() {
			    overlay.setMap(map);
			});
	
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
			    overlay.setMap(null);     
			}
			     
		</script>
		
		
			<br>
			<br>
		    <hr id="hhr">
		
	<%-- 탭 본문내용1 div --%>
	<div class="section">
	    <section id="section-1">
	        <h1>학원 정보</h1><br><br>
	        <div class="container">
				  <table class="table table-condensed" id="actb">
				      <tr>
				        <td><img src="/EduCatch/assets/img/Icon_academy.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;학원명</td>
				        <td><%=avo.getAname() %></td>
				      </tr>
				      <tr>
				        <td><img src="/EduCatch/assets/img/Icon_call.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;연락처</td>
				        <td><%=avo.getAtel() %></td>
				      </tr>
				      <tr>
				        <td><img src="/EduCatch/assets/img/Icon_location.png" border=0 width="20px" height="20px" />&nbsp;&nbsp;주소</td>
				        <td><%=address %></td>
				      </tr>
				  </table>
				</div>
	        
	    </section>
	
	<%-- 탭 본문내용2 div --%>
    <section id="section-2">
    	<hr id="hhr">
    	<div class="container">
       			 <h1>수업 정보</h1>
       			 <br><br>
			  <table class="table table-condensed" id="actb">
			    <thead>
			      <tr>
			        <th>과목명</th>
			        <th>수강날짜</th>
			        <th>수강시간</th>
			        <th class=subth>수강금액</th>
			        <th class=subth>수강인원</th>
			      </tr>
			    </thead>
			    <tbody>
<%
	for(int i=0; i<subjectnCnt; i++){
		SubjectVO svo = (SubjectVO)subjectlist.get(i);
		
		if(subjectnCnt>0){
%>
			    <tr>
			        <td><%=svo.getSname() %></td>
			        <td><%=svo.getSday() %></td>
			        <td><%=svo.getStime() %></td>
			        <td class=subth><%=svo.getSprice() %></td>
			        <td class=subth><%=svo.getSpeople() %></td>
			    </tr>
<%
		}
	}
%>
			      
			    </tbody>
			  </table>
			</div>
    </section>
    <%-- 본문내용예약 --%>
    <section id="section-3">
    <hr id="hhr">
        <h1>학원예약</h1><br><br>
        <div class="container">
				  <table class="table table-condensed reser" id="actb">
				      <thead>
				      	<tr>
				      		<th>날짜</th>
				      		<th>시간</th>
				      		<th>모집인원</th>
				      		<th>현재인원</th>
				      		<th>신청/취소</th>
				      	</tr>
				      </thead>
				      <tbody>
					      <tr>
					        <td>학원명</td>
					        <td><%=avo.getAname() %></td>
					        <td>연락처</td>
					        <td><%=avo.getAtel() %></td>
					        
					      </tr>
				      </tbody>
				  </table>
				</div>
        
    </section>
	
	<%-- 탭 본문내용3 div --%>
    <section id="section-4">
    <hr id="hhr">
        <h1>편의기능</h1>
			<br><br>
			<%
				String acparking = cvo.getAcbus();
				String acstore = cvo.getAcstore();
				String acbus = cvo.getAcbus();
				String acelevator = cvo.getAcelevator();
				String acstudyroom = cvo.getAcstudyroom();
				String aclounge = cvo.getAclounge();
				String aclocker = cvo.getAclocker();
				//주차장
				if(acparking.equals("Y")){
					%>
					<img title="주차장" src="/EduCatch/assets/img/convenience/parking.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
					
				}
				//편의점
				if(acstore.equals("Y")){
					%>
					<img title="편의점" src="/EduCatch/assets/img/convenience/convenience.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//셔틀버스
				if(acbus.equals("Y")){
					%>
					<img title="셔틀버스" src="/EduCatch/assets/img/convenience/bus.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//엘레베이터
				if(acelevator.equals("Y")){
					%>
					<img title="엘레베이터" src="/EduCatch/assets/img/convenience/elevator.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//자습실
				if(acstudyroom.equals("Y")){
					%>
					<img title="자습실" src="/EduCatch/assets/img/convenience/studyroom.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//휴게실
				if(aclounge.equals("Y")){
					%>
					<img title="휴게실" src="/EduCatch/assets/img/convenience/lounge.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
				//사물함
				if(aclocker.equals("Y")){
					%>
					<img title="사물함" src="/EduCatch/assets/img/convenience/locker.png" border=0 width="150" height="150" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
			%>
    </section>
    
    
    <%-- 탭 본문내용4 div --%>
    <section id="section-5">
    <hr id="hhr">
    	<div class="container">
       			 <h1>수강후기</h1>
       			 	<input id="addrev" name="addrev" type="button" value="후기작성" class="btn1" />
       			 <br><br>
			  <table class="table table-condensed" id="actb">
			    <thead>
			      <tr>
			        <th>작성자</th>
			        <th>제목</th>
			        <th>별점</th>
			        <th>후기내용</th>
			      </tr>
			    </thead>
			    <tbody>
<%
	for(int i=0; i<reivewnCnt; i++){
		ReviewVO rvo = (ReviewVO)reviewlist.get(i);
		
		if(reivewnCnt>0){
%>
			    <tr>
			        <td><%=rvo.getRbname() %></td>
			        <td><%=rvo.getRbsubject() %></td>
			        <td><%=rvo.getRbgrade() %></td>
			        <td><a href="selectReview.ec?rbno=<%= rvo.getRbno() %>"><h3>후기내용보기</h3></a></td>
			    </tr>
<%
		}
	}
%>
			    </tbody>
			  </table>
			</div>
    </section>
</div>
	</section>
</div>

<form id="pageForm" name="pageForm">
      <input type="hidden" id="rbno" name="rbno"/>
      <input type="hidden" id="aname" name="aname" value="<%=avo.getAname() %>"/>
      <input type="hidden" id="ano" name="ano" value="<%= avo.getAno()%>"/>
</form>
<div class="modal" id="applyRes" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">상담예약하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <div class="input-group mb-3">
          	<input type="hidden" name="ttno" class="ttno" />
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">날짜</span>
			  </div>
			  <input type="text" class="form-control date"aria-describedby="basic-addon1" readonly>
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">시간</span>
			  </div>
			  <input type="text" class="form-control timepicker" id="timepicker1" aria-describedby="basic-addon1" readonly>
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">인원</span>
			  </div>
			  <input type="text" class="form-control count"aria-describedby="basic-addon1" readonly>
			</div>
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon1">현재인원</span>
			  </div>
			  <input type="text" class="form-control countNow"aria-describedby="basic-addon1" readonly>
			</div>
			<hr />
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" id="btnCancel" type="button" data-dismiss="modal">확인</button>
        </div>
      </div>
		</div>
	</div>
<%-- -----------부트스크랩 하단------------- --%>
	<jsp:include page="../../../footer.jsp" flush="true">
		<jsp:param value="" name="" />
	</jsp:include>
</body>
</html>