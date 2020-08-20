<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
<%@ page import = "com.kosmo.educatch.vo.ConsultVO" %>  
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">

	.container-mypage {
	
	    max-width: 840px;
	    height: 500px;
	    margin-left: 710px;
	    background-color: #f5f5f0;
	}
	#sideBanner-mypage{
			position: absolute;
			left:0px;
			width:225px;
			height: 500px;
			background: #eaeae1;
			margin-left: 490px;
			padding-left: 12px;
		} 
		
	.sideBox{
		width:200px;
		height:110px;
		background-color: #ffffff;
		margin-top: 15px;
		
	}	
	#cvo_no{
		color: black;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		//======프로필 수정버튼을 누르면 실행 -> 비밀번호 확인 창
		$("#pwCheck").click(function() {
			console.log("프로필 수정버튼 누름");
			
			window.open("","pop","width=480, height=330");
			$("#clickForm").attr("action","selectPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").attr("target","pop");
			$("#clickForm").submit();
		})//end of myPageMemUpdate
		
		//=====비밀번호 변경 버튼 누르면 실행
		$("#pwEdit").click(function() {
			console.log("비밀번호 변경 버튼 누름");
			
			$("#clickForm").attr("action","editPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		})
		
/* 			$("#clickForm").attr("action",".ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); */
			
		
		$("#consultSearch").click(function() {
			console.log("학원문의 변경 버튼 누름");
			
			$("#clickForm").attr("action","consultQuestion.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		})
			
	});//end of ready()
</script>
</head>
<body>
<%
	Object obj = request.getAttribute("MemberVO");

	if(obj != null){
		MemberVO mvo = (MemberVO)obj;
%>
	<div id="sideBanner-mypage">
	<form id= "clickForm" name = "clickForm">
		<div class ="sideBox">
	<input type="text" id="mno" name ="mno" value="<%=mvo.getMno()%>"> 

			<%=mvo.getMname() %>님 	 &nbsp;&nbsp;
			<br>
			<input type ="button" id="pwCheck" value="개인정보 변경"><br>
			<input type ="button" id="pwEdit" value="비밀번호 변경"><br>
			<input type ="button" id="memOut" value="회원탈퇴"><br>
			
		<input type="hidden" id ="mid" name ="mid" value="<%=mvo.getMid()%>">
		</div>
		<div class ="sideBox">
			즐겨찾기
		</div>
		<div class ="sideBox">
			이력조회<br>
			<input type ="button" id="consultSearch" value="학원문의  조회"><br>
		</div>
	</form>	
<%		
	}
%>	
	</div>
<%
	Object obj2 = request.getAttribute("ConsultVO");
	
	if(obj2 != null){
		ArrayList list = (ArrayList)obj2;
		int nCnt = list.size();
		
%>
	<div class = "container-mypage ">
		<div align="center">
			<table align ="center" border="1">
			 	<colgroup>
					<col width="100px"/>
					<col width="140px"/>
					<col width="300px"/>
					<col width="100px"/>
				</colgroup>
				<thead id="table_head">
					<td align="center">글번호</td>
					<td align="center">학원명</td>
					<td align="center">제목</td>
					<td align="center">작성일</td>
				</thead>
				<tbody>
<%
			if(list !=null && nCnt>0){
				for(int i=0; i<nCnt; i++){
					ConsultVO cvo = (ConsultVO)list.get(i);

%>					
			<tr align="center">
				<td><%=cvo.getCbno() %></td>
				<td><%=cvo.getAname()%></td>
				<td><a href="selectConsult.ec?cbno=<%= cvo.getCbno() %>" id="cvo_no"><%=cvo.getCbsubject() %></td>
				<td><%=cvo.getCinsertdate()%></td>
			</tr>
<%			
				}//end of for
			
			//게시물이 0건 일 때
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
				</tbody>
			</table>
		</div>
	</div>
	
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>