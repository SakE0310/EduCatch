<%@page import="com.kosmo.educatch.vo.PagingVO"%>
<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../../../top.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
</head>

<title>후기 게시판</title>
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
	
		
	/* #sideBanner{
			position: absolute;
			top:100px;
			left:0px;
			width:150px;
			height:600px;
			background: #aaa;
		} */
	.tt{	
			text-align:center;
			font-size: xx-large;
			font-weight: bold;
			
		}		
		
	#aa{	
			color:black;
		
		}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
			
			if(startVal == ""){
				  alert("시작일이 입력되지 않았습니다.\n시작일을 먼저 입력해주세요");
			}
			
			if(startVal > endVal){
				 alert("종료일이 시작일보다 이 전 일수는 없습니다.\n다시 선택하여 주시기 바랍니다.");
			}
			
			$("#searchForm").attr("action","searchList.ec");
			$("#searchForm").attr("method","POST");
			$("#searchForm").submit();
			
		})//end of searchPiker
		
		//검색버튼을 누르면 실행
		$("#searchData").click(function() {
			console.log("검색버튼 누름");
			var sVal = document.searchForm.searchFilter.options[document.searchForm.searchFilter.selectedIndex].value;
			console.log("sVal>>>"+sVal);
			 
			$("#searchForm").attr("action","searchList.ec");
			$("#searchForm").attr("method","POST");
			$("#searchForm").submit();
			 
			
			alert("아직안만듬");
		})//end of searchData
 		 
 		 
		//글쓰기 버튼 눌렀을 때 실행
		$("#insertPage").click(function() {
			console.log("insertPage >>> ");
			//글쓰기 에디터 화면으로 이동
			$("#pageForm").attr("action","insertDisplay.ec");
			$("#pageForm").attr("method","POST");
			$("#pageForm").submit();	
		})
  	});
 	 
 	 /*
 	function updatePopup(rbno){
		alert(">>>");
		$("#rbno").val(rbno);
		$("#pageForm").attr("action","selectReview.ec");
		$("#pageForm").attr("method","POST");
		$("#pageForm").submit();
		
	}
	*/
  
	
</script>
<body>
<%


	String pagesize="0";
	String groupsize="0";
	String curpage="0";
	String totalcount="0";


	Object obj=request.getAttribute("listReview");

	if(obj !=null){
		ArrayList listReview=(ArrayList)obj;
		
		int nCnt=listReview.size();
	
%>
<form id="pageForm" name="pageForm">
		<input type="hidden" id="rbno" name="rbno"/>
	</form>
	<br><br><br><br>
	<div>
		<table style="margin-left: auto; margin-right: auto;" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<th><h4 class="tt">후기 게시판</h4><br><br><br></th>
			</tr>
		</table>
		<table  style="margin-left: auto; margin-right: auto;" border="1">
			<colgroup>
				<col width="120px"/>
				<col width="110px"/>
				<col width="120px"/>
				<col width="220px"/>
			</colgroup>
			<thead>	
				<tr>
					<td colspan="6" align="right">
						<input type="button" value="[글쓰기]"
						id="insertPage"/>
					</td>
				</tr>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>학원명</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
<%

		for(int i=0; i<nCnt; i++){
			ReviewVO rvo=(ReviewVO)listReview.get(i);

			pagesize=rvo.getPagesize();
			groupsize=rvo.getGroupsize();
			curpage=rvo.getCurpage();
			totalcount=rvo.getTotalcount();
			

			System.out.println("rvo.getPno()"+rvo.getPagesize());
			System.out.println("rvo.getGroupsize()"+rvo.getGroupsize());
			System.out.println("rvo.getCurpage()"+rvo.getCurpage());
			System.out.println("rvo.getTotalcount()"+rvo.getTotalcount());
			
			if(nCnt>0){
		
%>

					<tr align="center">
						<td><%= rvo.getRbno() %></td>
						<td><%= rvo.getRbname() %></td>
						<td><%= rvo.getAname() %></td>
						<td><a href="selectReview.ec?rbno=<%= rvo.getRbno() %>"  id="aa"><%= rvo.getRbsubject() %></a></td>
						<td><%= rvo.getRbinsertdate() %></td>
						<!-- 
						<td><input type="button" value="[수정/삭제]"
						onclick="updatePopup('${row.rbno}')"/></td>
						-->
					</tr>
<%
		}
	}if(nCnt==0){
%>
					<tr>
						<td colspan="7" align="center">
						등록된 게시물이 없습니다.
						</td>
					</tr>
<%
		}
	}
%>			
			</tbody>
			<tr>
			<td colspan="18">
			<jsp:include page="memberPaging.jsp" flush="true">
				<jsp:param name="url" value="listReview.ec"/>
				<jsp:param name="str" value=""/>
				
				
					<jsp:param name="pagesize" value="<%= pagesize %>"/>
					<jsp:param name="groupsize" value="<%= groupsize %>"/>
					<jsp:param name="curpage" value="<%= curpage %>"/>
					<jsp:param name="totalcount" value="<%= totalcount %>"/>
					
			</jsp:include>
			</td>
			</tr>
		</table>
	</div>
	<div>
		<form id="searchForm" name="searchForm">
		<div align = "center" id="sForm">
		
			<select name="searchFilter">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
				<option value="제목+내용">제목+내용</option>
			</select>
			<input type="text" name="keyword" id = "keyword">
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
	<br><br><br><br><br><br>

<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>