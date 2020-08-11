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
<meta charset="UTF-8">
</head>
<style type="text/css">
	.tt{	
			text-align:center;
			font-size: xx-large;
			font-weight: bold;
			
		}		
		
	#aa{	
			color:black;
		
		}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	 $(document).ready(function() {
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

	if(obj !=null){
		ArrayList listConsult=(ArrayList)obj;
		
		int nCnt=listConsult.size();
	
%>
	<form id="consultForm" name="consultForm">
		<input type="hidden" id="cbno" name="cbno"/>
	</form>
		<br><br><br><br>
	<div>
		<table style="margin-left: auto; margin-right: auto;" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<th><h4 class="tt">상담 게시판</h4><br><br><br></th>
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
		
		if(nCnt>0){
	
%>
					<tr align="center">
						<td><%= cvo.getCbno() %></td>
						<td><%= cvo.getCbname() %></td>
						<td><%= cvo.getAcademy_ano() %></td>
						<td><a href="selectConsult.ec?cbno=<%= cvo.getCbno() %>"  id="aa"><%= cvo.getCbsubject() %></a></td>
						<td><%= cvo.getCinsertdate() %></td>
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
				<jsp:param name="url" value="listConsult.ec"/>
				<jsp:param name="str" value=""/>
				
				
					<jsp:param name="pagesize" value='<%= pagesize %>'/>
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
			<table style="margin-left: auto; margin-right: auto;" border="1" cellpadding="1" cellspacing="1">
				<tr>
					<th>검색</th>
					<td>
						<input type="text" id="updatedate" name="updatedate"/>
					</td>
					<td>
						<input type="button" onclick="listSearch()" value="검색"/>
					</td>
			</table>
		</form>
	</div>
	<br><br><br><br><br><br>
	<jsp:include page="../../../../footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>