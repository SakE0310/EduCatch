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

<!-- 데이터피커 -->
<link rel="stylesheet" href="/EduCatch/assets/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/EduCatch/assets/datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/EduCatch/assets/datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>

<!-- 날짜 형식변환 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
	<form id="eventForm" name="eventForm">
		<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>이벤트 게시판 목록</h1></td>
			</tr>
			</table>
		</div>
		<div>
			<table border="1" align="center">
			<colgroup>
				<col width="120px"/>
				<col width="600px"/>
				<col width="120px"/>
				<col width="120px"/>
			</colgroup>
			<thead>
				<td align="center">글번호</td>
				<td align="center">제목</td>
				<td align="center">작성자</td>
				<td align="center">등록일자</td>
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
			
			}else{
%>
				<tr>
					<td colspan ="4" align="center">
						등록된 글이 없습니다.
					</td>
				</tr>
<%				
			}//end of if(list)
		}//end of if(obj)
%>
				<tr>
				<td colspan="4" align="right">
				<input type="button" value="등록" id="insertData">
				</td>
			</tr>
			</tbody>	
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
	<br>
	<br>
	<br>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>