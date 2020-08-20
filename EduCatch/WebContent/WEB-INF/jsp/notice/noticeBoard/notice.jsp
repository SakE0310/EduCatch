<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.NoticeVO" %>
<%@ page import="com.kosmo.educatch.vo.EventVO" %>
<%@page import="com.kosmo.educatch.vo.MemberVO"%>
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
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

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
	/* #dForm{
	 width: 350px;
  	height: 100px;
  	margin: auto;
	} */
	
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
		
	#row-magin{
		margin-bottom: 185px;
	}	
	
	 #nfont{
	 	font-family: 'Do Hyeon', sans-serif;
	  }
		
	#mainWrapper{
		font-family: 'Gothic A1', sans-serif;
	} 	
	.table_head_font{
		font-family: 'Do Hyeon', sans-serif;
	}
</style>

<script type="text/javascript">

  $(document).ready(function() {
	  
	//날짜 검색  
 	 $("#startDate").datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "Select date",
		dateFormat : 'yy-mm-dd',
		
		
	});
 	$("#startDate").focus(function(event){
        var dim = $(this).offset();
        $("#ui-datepicker-div").offset({
            top     :   dim.top - 180,
            left    :   dim.left + 150
        });
    });
	
	$("#endDate").datepicker({
		showOn: "button",
        buttonImage: "images/calendar.gif",
	    buttonImageOnly: false,
		buttonText: "Select date",
		dateFormat : 'yy-mm-dd',
		
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
		var sVal = document.noticeForm.searchFilter.options[document.noticeForm.searchFilter.selectedIndex].value;
		console.log("sVal>>>"+sVal);
		 
		$("#noticeForm").attr("action","searchNotice.ec");
		$("#noticeForm").attr("method","POST");
		$("#noticeForm").submit();
		
	})//end of searchData
	
	
  });//end of ready()
</script>
</head>
<body>
<%
	//페이징 변수 초기화
	String pno="0";
	String pagesize="0";
	String groupsize="0";
	String curpage="0";
	String totalcount="0";
	
	Object obj= request.getAttribute("noticeList");
	
	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}

	if(obj != null){
		ArrayList list = (ArrayList)obj;
		int nCnt = list.size();
%>
	<!--  <div id="sideBanner">
		사이드 바
	</div>  -->
	<div id="mainWrapper" align = "center">
		<div align = "center" style="width: 700px;" >
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center" id = "nfont"><h1>notice</h1></td>
			</tr>
			</table>
			<hr>
		</div>
	<form id="noticeForm" name="noticeForm">
		<div  class="container" style="height: 390px;">
			<table align="center" class="table">
			<colgroup>
				<col width="120px"/>
				<col width="600px"/>
				<col width="120px"/>
				<col width="120px"/>
			</colgroup>
			<thead id="table_head" >
				<td align="center" class ="table_head_font">글번호</td>
				<td align="center" class ="table_head_font">제목</td>
				<td align="center" class ="table_head_font">작성자</td>
				<td align="center" class ="table_head_font">작성일</td>
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
			<td colspan="4">
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
					<td colspan="2" align="left">
				
					<select name="searchFilter">
						<option value="제목">제목</option>
						<option value="내용">내용</option>
					</select>
					<input type="text" name="keyword" id = "keyword" style ="width:200px; height:40px;">
					<input type="button" class=" btn_light btn_box_01" id="searchData" value="검색">
					</td>
					
 <%
				if(mvo != null){
					if( mvo.getMauth().equals("3")){
%>				
					<td colspan="2" align="right">
					<input type="button" value="글쓰기" id="insertData" class=" btn_light btn_box_01"> 
					</td>
<%	
						}
					}
 %>					
			</tr>
			
			</tbody>
			</table>
		</div>
	</div>	
	</form>
	
	
	<!-- 검색 폼  -->
	<div >
		<form id="searchFormNotice" name="searchFormNotice">
		<!-- <div align = "center" id="sForm">
		
			<select name="searchFilter">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
			<input type="text" name="keyword" id = "keyword" style ="width:200px; height:40px;">
			<input type="button" class=" btn_light btn_box_01" id="searchData" value="검색">
			<hr>
		</div> -->
		<div id="mainWrapper" align = "center">
		<div align = "center" style="width: 700px;" >
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
			<td width="500">
		         <div class="row">
		         <div></div>
		            <div class="col-md-1.8">
						<input type="text" name="startDate" id="startDate">
		            </div>
		             <h3> &nbsp;&nbsp;- &nbsp;</h3>
		            <div class="col-md-1.5">
	      		 		<input type="text" name="endDate" id="endDate"> 
		            </div>
	      				&nbsp;&nbsp; <input type="button" id="searchPiker" value="검색">
		      </div>
		      
				<td>
			</tr>
			</table>
			<hr>
		</div>
		</div>
		
		
			<!-- <table style="margin: auto; " border="3" >
			<td>
				<div style="width: 500px;" align="left" >
					<div id ="row-magin">
						<div class="row" >
					         <div class="row">
					            <div class="col-md-1.8">
									<input type="text" name="startDate" id="startDate">
					            </div>
					             <h3> &nbsp;&nbsp;~ &nbsp;</h3>
					            <div class="col-md-1.5">
				      		 		<input type="text" name="endDate" id="endDate"> 
					            </div>
				      				&nbsp;&nbsp; <input type="button" id="searchPiker" value="검색">
					      </div>
					   </div>
					</div> 
				</div>
				<td>
				<td>
				aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
				</td>
				</table>	  --> 
		</form>
	</div>
  
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>


