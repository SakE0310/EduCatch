<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="com.kosmo.educatch.vo.EventVO" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 테이블 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	#eno_color{
		color: black;
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
	#table-header{
		align : center;
		margin : 0 auto;
		cellpadding : 1; 
		cellspacing : 1;
	}
	.table_head{
		border-collapse: collapse;
		background-color: #F5F5F5;
	}
	.table-data{
		align : center;
		margin : 0 auto;
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
 	#form {
		margin: auto;
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
		
		$("#endDate").datepicker({
			showOn: "button",
	        buttonImage: "images/calendar.gif",
		    buttonImageOnly: false,
			buttonText: "Select date",
			dateFormat : 'yy-mm-dd'
		});
		
		$("#searchPiker").click(function() {
			console.log("날짜 검색버튼 누름");
			
			var startVal = document.searchFormEvent.startDate.value;
			var endVal = document.searchFormEvent.endDate.value;
			
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
				  startVal = moment(startVal).format("MM/DD/YYYY");
				  endVal = moment(endVal).format("MM/DD/YYYY");
				  $("#startDate").val(startVal);
				  $("#endDate").val(endVal);
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
				$("#searchFormEvent").attr("action","searchEvent.ec");
				$("#searchFormEvent").attr("method","POST");
				$("#searchFormEvent").submit();
			}
				
		})//end of searchPiker
	//===관리자가 등록버튼을 누르면 실행========
	$("#insertData").click(function() {
		console.log("등록버튼 누름");
		
		$("#eventForm").attr("action","insertDisplayEvent.ec");
		$("#eventForm").attr("method","POST");
		$("#eventForm").submit();
		
	})//end of insertData
	
	//검색버튼을 누르면 실행
	$("#searchData").click(function() {
		console.log("검색버튼 누름");
		var sVal = document.searchFormEvent.searchFilter.options[document.searchFormEvent.searchFilter.selectedIndex].value;
		console.log("sVal>>>"+sVal);
		 
		$("#searchFormEvent").attr("action","searchEvent.ec");
		$("#searchFormEvent").attr("method","POST");
		$("#searchFormEvent").submit();
		 
		
		alert("아직안만듬");
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
	
	Object obj= request.getAttribute("eventList");
	
	if(obj != null){
		ArrayList list = (ArrayList)obj;
		int nCnt = list.size();
%>
<main>
	<div class="container box_1170">
		<div class="section-top-border">
			<div class="row">
				<div class="col-lg-10 col-md-10" id="form">
	<form id="eventForm" name="eventForm">
		<div id="div-header">
			<table id="table-header">
				<tr>
					<td align="center"><h1>이벤트 게시판 목록</h1></td>
				</tr>
			</table>
			<hr>
		</div>
		<div class="div-body">
			<table class="table">
				<colgroup>
					<col width="120px"/>
					<col width="600px"/>
					<col width="120px"/>
					<col width="120px"/>
				</colgroup>
			<thead class="table_head">
				<tr class="table-row">
					<td align="center">글번호</td>
					<td align="center">제목</td>
					<td align="center">작성자</td>
					<td align="center">등록일자</td>
				</tr>
			</thead>
			<tbody>			
<%		
		if(list !=null && nCnt>0){

			for(int i=0; i<nCnt; i++){
				EventVO evo = (EventVO)list.get(i);
				
				pagesize = evo.getPagesize();
				groupsize = evo.getGroupsize();
				curpage = evo.getCurpage();
				totalcount = evo.getTotalcount();
				
				System.out.println("pagesize >>>"+pagesize);
				System.out.println("groupsize >>>"+groupsize);
				System.out.println("curpage >>>"+curpage);
				System.out.println("totalcount >>>"+totalcount);
				System.out.println("==============================");
%>
				<tr align="center">
					<td>
					<a href="selectEvent.ec?eno=<%=evo.getEno() %>" id="eno_color"><%=evo.getEno() %></a>
					</td>
					<td><%=evo.getEsubject() %></td>
					<td><%=evo.getEname() %></td>
					<td><%=evo.getEinsertdate()%></td>
				</tr>	
<%				
				}//end of for
			
			}else if(nCnt == 0){
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
			<jsp:include page="eventPaging.jsp" flush="true">
				<jsp:param name="url" value="searchEvent.ec"/>
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
				<input type="button" value="등록" id="insertData" class=" btn_light btn_box_01">
				</td>
			</tr>
			</tbody>	
			</table>
		</div>
	</form>
	<!-- 검색 폼  -->
	<div >
		<form id="searchFormEvent" name="searchFormEvent">
		<div align = "center" id="sForm">
			<select name="searchFilter">
				<option value="제목">제목</option>
				<option value="내용">내용</option>
			</select>
				<input type="text" name="keyword" id="keyword" style ="width:200px; height:40px;">
				<input type="button" class=" btn_light btn_box_01" id="searchData" value="검색">
		</div>
		</form>
		</div>
		</div>
		</div>
		</div>
	</div>
</main>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>