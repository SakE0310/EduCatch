<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kosmo.educatch.vo.FreeVO"  %>
<%@ page import="java.util.List"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
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
		
		$("#searchForm").attr("action","freeboardlist.ec");
		$("#searchForm").attr("method","POST");
		$("#searchForm").submit();
		
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
		var sVal = document.searchForm.searchFilter.options[document.searchForm.searchFilter.selectedIndex].value;
		console.log("sVal>>>"+sVal);
		 
		$("#searchForm").attr("action","freeboardlist.ec");
		$("#searchForm").attr("method","POST");
		$("#searchForm").submit();
		
	})//end of searchData
	
	
  });//end of ready()
	
</script>
	<jsp:include page="../../../../top.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
</head>
<body>
<%	
	String pageSize ="0";
	String groupSize ="0";
	String curPage = "0";
	String totalCount = "0";
	
	Object obj = request.getAttribute("freeboardlist"); 
	if(obj!=null){
		List<FreeVO> list = (List<FreeVO>)obj;
		int nCnt =list.size();
%>
<form id="freeBoardForm" name="freeBoardForm" >
	
	<br>
	<div id="mainWrapper">
		<table border="0" style="margin-left: auto; margin-right: auto;">
			<tr><th><h4>자유게시판 목록</h4></th></tr>
		</table>
	</div>	
	<div class="container">
		<table style="margin-left: auto; margin-right: auto;" border="1" class="table">
			<colgroup>
				<col width="120px"/>
				<col width="220px"/>
				<col width="120px"/>
				<col width="300px"/>
				<col width="110px"/>
			</colgroup>
			<thead id="table_head">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>첨부파일</th>
					<th>작성일</th>
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
						<td align="center"><a href="selectfreeboardDetail.ec?fbno=<%=freevo.getFbno() %>" style="color:black;"><%=freevo.getFbsubject() %></a></td>
						<td align="center"><%=freevo.getFbname() %></td>
						<!-- td align="center"><%=freevo.getFbcontent() %></td -->
						<td align="center"><%=freevo.getFbimg() %></td>
						<td align="center"><%=freevo.getFbinsertdate() %></td>
					</tr>
					<%
					}//end of for
				}else{		
			
				%>
					<tr>
						<td colspan="5" align="center">
						등록된 학과 정보가 존재하지 않습니다 </td>
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
					<td colspan="6" align="right">
					<input type="button" id="insertboard" name="insertboard" class=" btn_light btn_box_01"
					value="[글쓰기]"/></td>
				</tr>
			</tbody>
		</table>
		</form>
		<br>
		<!-- 검색 폼  -->
	<div >
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
		<br>
		<br>
	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>