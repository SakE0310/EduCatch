<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.NoticeVO" %>
<%@ page import="com.kosmo.educatch.vo.EventVO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 데이터피커 -->
<link rel="stylesheet" href="/EduCatch/assets/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/EduCatch/assets/datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/EduCatch/assets/datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>

<!-- 날짜 형식변환 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- 폰트 -->
<!-- <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet"> -->
<style type="text/css">
	#nno_color{
		color: black;
	}
	
	#table_head{
		border-collapse: collapse;
		background-color: #F5F5F5;
	}
	.btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #e5e5e5;
	    color: #555;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 1px solid #e5e5e5;
	    height: 40px;
	    font-size: 15px;
		}
	.btn_box_01 {
	    width: auto;
	    padding: 3px 10px;
	}	
	.bbs-link-btm {
	    float: right;
	    margin: 20px 0px 0;
	    text-align: left;
	   
	}
	.bbs-link {
   	 position: relative;
	}
	
	#sForm{
    width: 350px;
  	height: 100px;
  	margin: auto;
	}
	#dForm{
	 width: 350px;
  	height: 100px;
  	margin: auto;
	}
	
	/* body{
	 	font-family: 'Hi Melody', cursive;
		font-weight: 400;
	} */
	
		
	/* #sideBanner{
			position: absolute;
			top:100px;
			left:0px;
			width:150px;
			height:600px;
			background: #aaa;
		}  */
		
	/*	.layerpop {
		    display: none;
		    z-index: 1000;
		    border: 2px solid #ccc;
		    background: #fff;
		    cursor: move; }
		
		.layerpop_area .title {
		    padding: 10px 10px 10px 10px;
		    border: 0px solid #aaaaaa;
		    background: #f1f1f1;
		    color: #3eb0ce;
		    font-size: 1.3em;
		    font-weight: bold;
		    line-height: 24px; }
		
		.layerpop_area .layerpop_close {
		    width: 25px;
		    height: 25px;
		    display: block;
		    position: absolute;
		    top: 10px;
		    right: 10px;
		    background:transparent url('/EduCatch/assets/img/pagingBtn/btn_close.gif') no-repeat; }
		
		.layerpop_area .content {
		    width: 96%;    
		    margin: 2%;
		    color: #828282; 
		   }
		   
		  #pop_today{
		  	color: white;
		  	background: blue;
		  } 
		/*-- POPUP common style E --*/

		*/
		
</style>
<script type="text/javascript">

	 function setCookie( name, value, expirehours ) {
		  var todayDate = new Date();
		  todayDate.setHours( todayDate.getHours() + expirehours );
		  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	 } 
	 function closeWin() {
		  if(document.getElementById("pop_today").checked){
		   setCookie( "ncookie", "done" , 24 );
		  }
		  document.getElementById('layer_pop').style.display = "none";
	 }

/*
	function openPop() {
		
		$('.layerpop').css("position", "absolute");
        //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
        $('.layerpop').css("top","100px");
        $('.layerpop').css("right","250px");
        $('#layerbox').show();

		}
	
	//팝업창에 있는 닫기버튼을 누르면
	 function popupClose() {
	        $('#layerbox').hide();
	    }
*/	
  $(document).ready(function() {
	//  openPop();
	  
	//날짜 검색  
 	 $("#startDate").datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "Select date",
		dateFormat : 'yy-mm-dd'
		
	});
	
	$("#endDate").datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "Select date",
		dateFormat : 'yy-mm-dd'
	});
	
	$("#searchPiker").click(function() {
		console.log("날짜 검색버튼 누름");
		
		var startVal = document.searchFormNotice.startDate.value;
		var endVal = document.searchFormNotice.endDate.value;
		
		console.log("startVal>>>"+startVal);
		console.log("endVal>>>"+endVal);
		
		startVal = moment(startVal).format("YYYY-MM-DD");
		endVal = moment(endVal).format("YYYY-MM-DD");
		console.log("startVal_1>>>"+startVal);
		console.log("endVal_1>>>"+endVal);
		
		$("#startDate").val(startVal);
		$("#endDate").val(endVal);
		
		if(startVal == "Invalid date" && endVal == "Invalid date"){
			alert("시작일과 종료일이 입력되지 않았습니다.\n시작일을 먼저 입력해주세요");
			startVal = moment(startVal).format("MM/DD/YYYY");
			endVal = moment(endVal).format("MM/DD/YYYY");
			$("#startDate").val();
			  $("#endDate").val();
			return;
		}
		
		if(startVal == "Invalid date"){
			  alert("시작일이 입력되지 않았습니다.\n시작일을 먼저 입력해주세요");
			  startVal = moment(startVal).format("MM/DD/YYYY");
			  endVal = moment(endVal).format("MM/DD/YYYY");
			  $("#startDate").val(startVal);
			  $("#endDate").val(endVal);
			  return;
		}
		if(endVal == "Invalid date"){
			  alert("종료일이 입력되지 않았습니다.\n종료일을 먼저 입력해주세요");
			  $("#startDate").val("");
			  $("#endDate").val("");
			  return;
		} 
		
		if(startVal > endVal){
			alert("종료일이 시작일보다 이 전 일수는 없습니다.\n다시 선택하여 주시기 바랍니다.");
			startVal = moment(startVal).format("MM/DD/YYYY");
			endVal = moment(endVal).format("MM/DD/YYYY");
			$("#startDate").val(startVal);
			$("#endDate").val(endVal);
			return;
		}else if(startVal < endVal){
			alert("으아아아아");
			$("#searchFormNotice").attr("action","searchNotice.ec");
			$("#searchFormNotice").attr("method","POST");
			$("#searchFormNotice").submit();
		}
		
	})//end of searchPiker
	
	//===관리자가 등록버튼을 누르면 실행========
	$("#insertData").click(function() {
		console.log("등록버튼 누름");
		
		$("#noticeForm").attr("action","insertDisplayNotice.ec");
		$("#noticeForm").attr("method","POST");
		$("#noticeForm").submit();
		
	})//end of insertData
	
	 
	//검색버튼을 누르면 실행
	$("#searchData").click(function() {
		console.log("검색버튼 누름");
		var sVal = document.searchFormNotice.searchFilter.options[document.searchFormNotice.searchFilter.selectedIndex].value;
		console.log("sVal>>>"+sVal);
		 
		$("#searchFormNotice").attr("action","searchNotice.ec");
		$("#searchFormNotice").attr("method","POST");
		$("#searchFormNotice").submit();
		
	})//end of searchData
	
	
  });//end of ready()
</script>
</head>
<body onload="openPop()">
<%
	//페이징 변수 초기화
	String pno="0";
	String pagesize="0";
	String groupsize="0";
	String curpage="0";
	String totalcount="0";
	
	Object obj= request.getAttribute("noticeList");

	if(obj != null){
		ArrayList list = (ArrayList)obj;
		int nCnt = list.size();
%>
	<form id="noticeForm" name="noticeForm">
	<!--  <div id="sideBanner">
		사이드 바
	</div>  -->
	<div id="mainWrapper">
		<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>공지사항 게시판 목록</h1></td>
			</tr>
			</table>
			<hr>
		</div>
		<div  class="container" id = "">
			<table align="center" class="table">
			<colgroup>
				<col width="120px"/>
				<col width="600px"/>
				<col width="120px"/>
				<col width="120px"/>
			</colgroup>
			<thead id="table_head">
				<td align="center">글번호</td>
				<td align="center">제목</td>
				<td align="center">작성자</td>
				<td align="center">작성일</td>
			</thead>
			<tbody>
<%		
		//공지사항 게시물이 1건이라도 있을 떄
		if(list !=null && nCnt>0){
			for(int i=0; i<nCnt; i++){
				NoticeVO nvo = (NoticeVO)list.get(i);
				
				pno = nvo.getPno();
				pagesize = nvo.getPagesize();
				groupsize = nvo.getGroupsize();
				curpage = nvo.getCurpage();
				totalcount = nvo.getTotalcount();
				
				System.out.println("pagesize >>>"+pagesize);
				System.out.println("groupsize >>>"+groupsize);
				System.out.println("curpage >>>"+curpage);
				System.out.println("totalcount >>>"+totalcount);
				System.out.println("==============================");
%>
				<tr align="center">
					<td><%=nvo.getNno() %></td>
					<td>
					<a href="selectNotice.ec?nno=<%=nvo.getNno() %>" id="nno_color"><%=nvo.getNsubject() %></a></td>
					<td><%=nvo.getNname() %></td>
					<td><%=nvo.getNinsertdate()%></td>
				</tr>	
<%			
			}//end of for
		
		//공지사항 게시물이 0건 일 때
		}else{
%>
				<tr>
					<td colspan ="4" align="center">
						등록된 글이 없습니다.
					</td>
				</tr>
<%			
		}//end of if(list)
	
	if(list !=null && nCnt>0){
%>
			<tr>
			<td colspan="18">
			<jsp:include page="noticePaging.jsp" flush="true">
				<jsp:param name="url" value="listNotice.ec"/>
				<jsp:param name="str" value=""/>
				<jsp:param name="pagesize" value="<%= pagesize %>"/>
				<jsp:param name="groupsize" value="<%= groupsize %>"/>
				<jsp:param name="curpage" value="<%= curpage %>"/>
				<jsp:param name="totalcount" value="<%= totalcount %>"/>
					
			</jsp:include>
			</td>
			</tr>	

<%		
		}//end of (list !=null && nCnt>0)
	}//end of if(obj)
		
%>
				<tr>
				<td colspan="4" align="right">
				<input type="button" value="글쓰기" id="insertData" class=" btn_light btn_box_01"> 
				</td>
			</tr>
			</tbody>
			</table>
		</div>
	</div>	
	</form>
	<!-- 검색 폼  -->
	<div >
		<form id="searchFormNotice" name="searchFormNotice">
		<div align = "center" id="sForm">
		
			<select name="searchFilter">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input type="text" name="keyword" id = "keyword" style ="width:200px; height:40px;">
			<input type="button" class=" btn_light btn_box_01" id="searchData" value="검색">
			<hr>
		</div>
		<div align = "center" id="dForm">	
			<div style="width: 200px">
			<input type="text" name="startDate" id="startDate"> - <input type="text" name="endDate" id="endDate"> 
			<input type="button" id="searchPiker" value="검색">
			</div>
			
		</div>
		</form>
	</div>
	
	
<%
	Object obj2= request.getAttribute("eventVO");
	System.out.println("obj2>>>"+obj2);
	
	if(obj2 != null){
		EventVO evo =(EventVO)obj2;
		System.out.println("evo>>>"+evo);
		System.out.println("evo.getEimg>>>"+evo.getEimg());
		if(evo != null ){
			System.out.println("null아님>>>");
		
%>	
<!-- 팝업1 -->
   <!--  <div style="height:1000px;"> 

    <div id="layerbox" class="layerpop"
        style="width: 700px; height: 500px;">
        <article class="layerpop_area">
        <div class="title">이벤트 팝업</div>
        <a href="javascript:popupClose();" class="layerpop_close"
            id="layerbox_close"></a> <br>
        <div class="content" align="center">
        <img src="/EduCatch/assets/img/event/<%=evo.getEimg()%>" alt="사진업음" style="width: 600px; height :400px"/><br>							
        </div>
        </article>
    </div> -->

<!--  팝업2 -->
	<div class="layer_popup" style="position:absolute; width:500px;left:50%;  top:90px; z-index:1;" id="layer_pop">
	<table width="500" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td> <img src="/EduCatch/assets/img/event/<%=evo.getEimg()%>" alt="사진업음" width="500" height="500" border="0"/></td>
		</tr>
	<tr>
		 <td align="center" height="30" bgcolor="#F5F5F5">
		 <table width="95%" border="0" cellpadding="0" cellspacing="0">
		 <tr>
			  <td align="left" class="pop"><input type="checkbox" name="pop_today" id="pop_today" />오늘 하루 이 창 열지 않음</td>
			  <td align="right" class="pop"><a href="javascript:closeWin();">닫기</a></td>
		 </tr>
	 	</table>
	 	</td>
	</tr>
	</table>
<script language="Javascript" type="text/javascript">

 cookiedata = document.cookie;
 if (cookiedata.indexOf("ncookie=done") < 0){
  document.getElementById('layer_pop').style.display = "inline";
 } else {
  document.getElementById('layer_pop').style.display = "none";
 }

<%
		}//end of if(evo)
		if(evo == null && evo.equals("")){
			System.out.println("null>>>");
%>			
			 document.getElementById('layer_pop').style.display = "none";
<%
		}
			
	}//end of if
	
%>	
</script>
</div>

<br>
<br>
<br>
<br>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>


