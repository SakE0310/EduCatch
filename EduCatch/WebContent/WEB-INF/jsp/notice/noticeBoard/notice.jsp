<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.NoticeVO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	#nno_color{
		color: black;
	}
	
	
	/* #main{
				width:960px;
				height:600px;
				background: #e4ebeb;
				margin: 0 auto;
		} */
		
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
	
	//===관리자가 등록버튼을 누르면 실행========
	$("#insertData").click(function() {
		console.log("등록버튼 누름");
		
		$("#noticeForm").attr("action","insertDisplayNotice.ec");
		$("#noticeForm").attr("method","POST");
		$("#noticeForm").submit();
		
	})//end of insertData
	
	  
  });//end of ready()
</script>
</head>
<body>
<%
	Object obj= request.getAttribute("noticeList");

	if(obj != null){
		ArrayList list = (ArrayList)obj;
		int nCnt = list.size();
%>
	<form id="noticeForm" name="noticeForm">
	<!-- <div id="sideBanner">
		사이드 바
	</div> -->
	<div id="main">
		<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h1>공지사항 게시판 목록</h1></td>
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
		//공지사항 게시물이 1건이라도 있을 떄
		if(list !=null && nCnt>0){
			for(int i=0; i<nCnt; i++){
				NoticeVO nvo = (NoticeVO)list.get(i);
%>
				
				<tr align="center">
					<td>
					<a href="selectNotice.ec?nno=<%=nvo.getNno() %>" id="nno_color"><%=nvo.getNno() %></a>
					</td>
					<td><%=nvo.getNsubject() %></td>
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
	}//end of if(obj)
		
%>
				<tr>
				<td colspan="4" align="right">
				<input type="button" value="등록" id="insertData">
				<!-- <input type="button" value="수정" id="updateData">
				<input type="button" value="삭제" id="deleteData"> -->
				</td>
			</tr>
			</tbody>	
			</table>
		</div>
	</div>	
	</form>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>


