<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kosmo.educatch.vo.FreeVO"  %>
<%@ page import="com.kosmo.educatch.vo.MemberVO"  %>
<%@ page import="java.util.List"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
/*미디어 쿼리*/
	/* Mobile Device (가로폭 767px 이하) */
	@media all and (max-width:767px) {
		thead {
			display: none;
		}
		.nice-select{
		    width: 50px;
		    height: 35px;
		    padding-left: 0px;
		}
		#keyword{
			width: 90px;
			height: 32px;
		}
		.btn_light {
		  height: 30px;
		}
		.gj-textbox-md{
			width: 100px;
    		height: 40px;
    		
		}
		
		.gj-datepicker-md [role="right-icon"] {
		    position: absolute;
		    left: 5px;
		    top: 10px;
		    font-size: 24px;
		}
		#b{
			width: 300px;
		}
		#nfont{
			display: none;
		}
		#mfont{
			font-size: 30px;
		}
		#media_mobile{
			width: 330px;
    		height: 130px;
		}
		 #keyword{
			width:96px; 
	}
	.gj-textbox-md {
			width: 100px;
			font-size: 10px;
		}
		.media_mobile_td{
			display: table-column-group;
		}
		.media_mobile_td_font{
			font-size: 13px;
		}
		#pageForm_div{
	    padding: 0px;
		}
		#freeBoardForm{
	 	padding-bottom: 300px;
	 }	
	}
	

	
	/* Tablet (가로폭 768px 이상, 1023px 이하) */
	@media all and (min-width:768px) and (max-width:1023px) {
	
	/* 브라우저 가로폭이 768~1023px일때 적용될 css (태블릿) */
	#media_mobile{
	 	width: 400px;
   		 height: 180px;
	 }
	 
	 #keyword{
			width:200px; 
	}
	.gj-textbox-md {
			width: 130px;
			font-size: 15px;
		}
	#nfont{
			display: none;
		}
	#mfont{
			font-size: 50px;
		}
	.nice-select{
	    width: 60px;
    	height: 35px;
	    padding-left: 10px;
	}
	#freeBoardForm{
	 	padding-bottom: 400px;
	 }	
	}
	
	/* PC Desktop (가로폭 1024 이상) */
	@media all and (min-width:1024px) {
	
		body {
		}
		#media_mobile{
			width: 700px;
			height: 180px;
			margin:auto;
		}
		
		#b{
			width: 700px;
		}
		.nice-select{
		    width: 70px;
		    height: 35px;
		    padding-left: 0px;
		}
		 #media_mobile{
	 	width: 1140px;
	 	margin: auto;
	 }
	 	#mfont{
	 	display: none;
	 }
	 #keyword{
			width:200px; 
	}
	.gj-textbox-md {
			width: 130px;
			font-size: 15px;
		
	}
	#pageForm_div{
	    margin-bottom: 154px;
	}
	#freeBoardForm{
	 	padding-bottom: 290px;
	 }	
	 .nice-select .option {
    padding-right: 25px;
    }
	}	
	/* --------------------------------------------- */

	#fbno_color{
		color: black;
	}
	
	#table_head{
		border-collapse: collapse;
		background-color: #21146b;
	}
	.btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #21146b;
	    color: #ffffff;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 1px solid #140C40;
	    height: 30px;
	    font-size: 15px;
	     border-radius: 0.5em;
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
	#row-magin{
		margin-bottom: 185px;
	}	
	
	 #nfont, #mfont{
	 	font-family: 'Do Hyeon', sans-serif;
	  }
		
	#mainWrapper{
		font-family: 'Gothic A1', sans-serif;
		
	} 	
	.table_head_font{
		font-family: 'Do Hyeon', sans-serif;
		color:white;
	}
	
	#keyword{
			height:32px;
			border: 1px solid #140C40;
			 border-radius: 0.5em;
		}
		
	/*데이트 피커*/
	.gj-textbox-md{ 
		border: 1px solid #140C40;
		height: 30px;
	}
	
	.gj-icon {
	    color: #140C40;
	   margin-left: 7px;
	}
		
	.gj-textbox-md {
   			height: 30px;
		}
	.gj-datepicker-md [role="right-icon"] {
	    left: 3px;
   		top: 3px;
  	 }
   		 
	
	 #c{
	 	height: 10px;
	 }
	  #h3_margin{
	 	margin-top: 2px;
	 	font-weight: bold;
	 }
	  #media_mobile_td_margin{
	 	padding-left: 0px;
	 	padding-top: 13px;
	 }
	li{
	 	font-size: 16px;
	 }
	 /*---------------------------------*/
	 
	 a{
	 	color: black;
	 }
	 #td_width {
    width: 500px;
    height: 70px;
    }
   th {
    text-align: center; 
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
		dateFormat : 'yy-mm-dd'
		
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
		dateFormat : 'yy-mm-dd'
	});
	
	$("#searchPiker").click(function() {
		console.log("날짜 검색버튼 누름");
		
		var startVal = document.searchForm.startDate.value;
		var endVal = document.searchForm.endDate.value;
		
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
			$("#searchForm").attr("action","freeboardlist.ec");
			$("#searchForm").attr("method","POST");
			$("#searchForm").submit();
		}
		
	})//end of searchPiker
	
	//===관리자가 등록버튼을 누르면 실행========
	$("#insertboard").click(function() {
		console.log("등록버튼 누름");
		$("#freeBoardForm").attr("action","selectfreeboardI.ec");
		$("#freeBoardForm").attr("method","GET");
		$("#freeBoardForm").submit();
		
	})//end of insertData
	
	 
	//검색버튼을 누르면 실행
	$("#searchData").click(function() {
		console.log("검색버튼 누름");
		var sVal = document.freeBoardForm.searchFilter.options[document.freeBoardForm.searchFilter.selectedIndex].value;
		console.log("sVal>>>"+sVal);
		 
		$("#freeBoardForm").attr("action","freeboardlist.ec");
		$("#freeBoardForm").attr("method","POST");
		$("#freeBoardForm").submit();
		
	})//end of searchData
	
	
  });//end of ready()
	
</script>
	
</head>
<body>
<%	
	String pageSize ="0";
	String groupSize ="0";
	String curPage = "0";
	String totalCount = "0";
	
	Object obj = request.getAttribute("freeboardlist"); 
	
	//HttpSession hs = request.getSession(false);
//	MemberVO mvo = null;
	//if(hs != null){
	//	mvo = (MemberVO)hs.getAttribute("user");
	//}
	
	if(obj!=null){
		List<FreeVO> list = (List<FreeVO>)obj;
		int nCnt =list.size();
		FreeVO fvo = (FreeVO)list.get(0);
		String count = fvo.getTotalcount();
%>
	<div id="mainWrapper" align = "center">
	<div  id="media_mobile" >
	<form id="searchForm" name="searchForm">
		<table border="0" cellpadding="1" cellspacing="1" align="left">
			<tr>	
				<td align="center" id = "mfont"><h4>자유게시판</h4>
				<br>
				<br>
				</td>
			</tr>
			<tr>
			 <!-- ★ --><td width="1200" align="center" id = "nfont" colspan="2"><br><h1>자유게시판</h1>
			 <br>
				<br></td>
			
			</tr>
			<tr style="width: 1140px;">
			<td  align="left" id="count">
			 <br>
		      	총 <%=count %>개의 게시물이 있습니다
		      </td>
				<td width="360" align="right">
		         <div class="row" id="c" style="padding-right: 0px;">
		            &nbsp;&nbsp;&nbsp;
		            <div class="col-md-1.8">
						<input type="text" name="startDate" id="startDate">
		            </div>
		            <h3 id="h3_margin"> &nbsp;&nbsp;- &nbsp;</h3>	
		            <div class="col-md-1.5">
	      		 		<input type="text" name="endDate" id="endDate"> 
		            </div>
	      				&nbsp;&nbsp; <input class="btn_light btn_box_01" type="button" id="searchPiker" value="검색">
		      </div>
		      </td>
			</tr>
		</table>
		</form>
	</div>	
<form id="freeBoardForm" name="freeBoardForm" >
	<div class="container" style="height: 390px;">
		<table align="center" class="table">
			<colgroup>
				<col width="100px"/>
				<col width="320px"/>
				<col width="100px"/>
				<col width="100px"/>
			</colgroup>
			<thead id="table_head">
				<tr align="center">
					<th align="center"class ="table_head_font">글번호</th>
					<th align="center" class ="table_head_font">제목</th>
					<th align="center" class ="table_head_font">작성자</th>
					<!-- th>첨부파일</th> -->
					<th align="center" class ="table_head_font">작성일</th>
				</tr>
			</thead>
			<tbody>
			
			<% if(list != null && nCnt>0){
				for(int i=0; i<list.size(); i++){
					FreeVO freevo = (FreeVO)list.get(i);
					
					pageSize = freevo.getPagesize();
					groupSize = freevo.getGroupsize();
					curPage = freevo.getCurpage();
					totalCount = freevo.getTotalcount();
					
					System.out.println("pagesize>>>"+pageSize);
					System.out.println("groupsize>>>"+groupSize);
					System.out.println("curpage>>>"+curPage);
					System.out.println("totalcount>>>"+totalCount);
					
			%>
					<tr>			
						<td align="center"><%=freevo.getFbno() %></td>					
						<td align="left" style="padding-left: 40px;"><a href="selectfreeboardDetail.ec?fbno=<%=freevo.getFbno() %>" id="fbno_color"><%=freevo.getFbsubject() %></a></td>
						<td align="center"><%=freevo.getFbname() %></td>
						<!-- td align="center"><%=freevo.getFbcontent() %></td -->
						<!-- td align="center"><%=freevo.getFbimg() %></td> -->
						<td align="center"><%=freevo.getFbinsertdate() %></td>
					</tr>
					<%
					}//end of for
				}else{		
			
				%>
					<tr>
						<td colspan="5" align="center">
						등록된 학과 정보가 존재하지 않습니다
						 </td>
					</tr>				
				<%
			}//end of if
			if(list != null && nCnt>0){
	
				%>
				
				<tr>
				<td colspan="11">
				<jsp:include page="paging.jsp" flush="true">
					<jsp:param name="url" value="freeboardlist.ec"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
				</jsp:include>
				</td>
			</tr>
			<%
				}//end of if
			}//end of obj
			%>
			<tr>
				<td colspan="2" align="left" id ="media_mobile_td_margin">
					<select name="searchFilter" id="searchFilter">
						<option value="제목">제목</option>
						<option value="내용">내용</option>
					</select>
					<input type="text" name="keyword" id = "keyword" >
					<input type="button" class=" btn_light btn_box_01" id="searchData" value="검색">
				</td>
					
					<td colspan="2" align="right">
					<input type="button" id="insertboard" name="insertboard" class=" btn_light btn_box_01"
					value="글쓰기"/>
					</td>
			</tr>
			</tbody>
		</table>
		</div>
	</form>
	</div>
		<br>
		
		<br><br><br>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>