<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@page import="com.kosmo.educatch.vo.ConsultVO"%>
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


<title>상담 게시판</title>
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
		height: 40px;
	    width: 60px;
	    padding: 3px 10px;
	    margin-bottom: 3px;
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
			
			$("#searchForm").attr("action","searchConsult.ec");
			$("#searchForm").attr("method","POST");
			$("#searchForm").submit();
			
		})//end of searchPiker
		
		//검색버튼을 누르면 실행
		$("#searchData").click(function() {
			console.log("검색버튼 누름");
			var sVal = document.searchForm.searchFilter.options[document.searchForm.searchFilter.selectedIndex].value;
			console.log("sVal>>>"+sVal);
			 
			$("#searchForm").attr("action","searchConsult.ec");
			$("#searchForm").attr("method","POST");
			$("#searchForm").submit();
			 
			
			alert("아직안만듬");
		})//end of searchData
		
		//글쓰기 버튼 눌렀을 때 실행
		$("#insertPage").click(function() {
			console.log("insertPage >>> ");
			//글쓰기 에디터 화면으로 이동
			$("#consultForm").attr("action","cinsertDisplay.ec");
			$("#consultForm").attr("method","POST");
			$("#consultForm").submit();	
		})
	});
	 
</script>
<body>
<%

	String pno="0";
	String pagesize="0";
	String groupsize="0";
	String curpage="0";
	String totalcount="0";	

	Object obj=request.getAttribute("listConsult");
	
	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}

	if(obj !=null){
		ArrayList listConsult=(ArrayList)obj;
		
		int nCnt=listConsult.size();
	
%>
	<form id="consultForm" name="consultForm">
		<input type="hidden" id="cbno" name="cbno"/>
	</form>
	<div id="mainWrapper">
		<div>
		<table  border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>상담 게시판</h1></td>
			</tr>
		</table>
		<hr>
		</div>
		<div class="container">
		<table align="center" class="table">
			<colgroup>
				<col width="120px"/>
				<col width="120px"/>
				<col width="600px"/>
				<col width="120px"/>
				<col width="120px"/>
			</colgroup>
			<thead id="table_head">	
				<tr>
					<td align="center">글번호</td>
					<td align="center">학원명</td>
					<td align="center">제목</td>
					<td align="center">작성자</td>
					<td align="center">날짜</td>
				</tr>
			</thead>
			<tbody>
<%

if(listConsult !=null && nCnt>0){
	for(int i=0; i<nCnt; i++){
		ConsultVO cvo=(ConsultVO)listConsult.get(i);
		
		pno=cvo.getPno();
		pagesize=cvo.getPagesize();
		groupsize=cvo.getGroupsize();
		curpage=cvo.getCurpage();
		totalcount=cvo.getTotalcount();
		
		System.out.println("cvo.getPno()"+cvo.getPno());
		System.out.println("cvo.getPagesize()"+cvo.getPagesize());
		System.out.println("cvo.getGroupsize()"+cvo.getGroupsize());
		System.out.println("cvo.getCurpage()"+cvo.getCurpage());
		System.out.println("cvo.getTotalcount()"+cvo.getTotalcount());
		
	
%>
					<tr align="center">
						<td class="cc"><%= cvo.getCbno() %></td>
						<td class="cc"><%= cvo.getAname() %></td>
						<td class="cc"><a href="selectConsult.ec?cbno=<%= cvo.getCbno() %>"  id="aa"><%= cvo.getCbsubject() %></a></td>
						<td class="cc"><%= cvo.getCbname() %></td>
						<td class="cc"><%= cvo.getCinsertdate() %></td>
					</tr>
<%
				}	
		}else{
		
%>	
					<tr>
						<td colspan="7" align="center">
						등록된 게시물이 없습니다.
						</td>
					</tr>
<%
			}

		if(listConsult !=null && nCnt>0){

%>			
			</tbody>
			<tr>
			<td colspan="18">
			<jsp:include page="memberPaging.jsp" flush="true">
				<jsp:param name="url" value="listConsult.ec"/>
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
				<option value="제목+내용">제목+내용</option>
			</select>
			<input type="text" name="keyword" id = "keyword" style="height: 40px">
			<input type="button" class=" btn_light btn_box_01" id="searchData" value="검색">
		</td>
<%
		if(mvo != null){
			if( mvo.getMauth().equals("1")){
%>
		
			<td colspan="6" align="right">
				<input type="button" value="글쓰기"
				id="insertPage" class=" btn_light btn_box_01"/>
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
	<div>
		<form id="searchForm" name="searchForm">
		<div align = "center" id="sForm">
		
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