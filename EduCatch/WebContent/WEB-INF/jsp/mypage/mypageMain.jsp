<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
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

	#full{
		 margin :auto;
		 align :center;
		 width : 1200px;
		 height: 700px;
	}
	.container-mypage {
	
	    width: 700px;
	    height: 700px;
	    margin :auto;
	   /*  margin-left: 710px; */
	    background-color: #f5f5f0;
	}
	#sideBanner-mypage{
			position: absolute;
			/* left:0px; */
			width:225px;
			height: 700px;
			/* background: #140C40; */
			 margin :auto;
			/* margin-left: 490px; */
			padding-left: 12px;
			padding-right: 12px;
		} 
		
	.sideBox{
		width:200px;
		height:180px;
		background-color: #ffffff;
		margin-top: 15px;
		border-radius: 0.5em;
	}	
	
	.btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #ffffff;
	    color: #555;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 0px solid #e5e5e5;
	    height: 40px;
	    font-size: 20px;
		}
	.btn_box_01 {
	    width: auto;
	    padding: 3px 10px;
	    
	    }
	    
	    .shadow {
		    box-shadow: -100px 100px 100px -90px #000000,
		        60px 0px 100px -90px #000000;
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
<div id ="full">
	<div id="sideBanner-mypage">
	<form id= "clickForm" name = "clickForm">
		<div align ="center">
		<br>
			<h1 style="color : ; font-size: 30px;">마이페이지</h1>
			<hr>
		</div>
		<div class ="sideBox shadow" style="font-size: 20px;">
		<input type="hidden" id="mno" name ="mno" value="<%=mvo.getMno()%>"> 

			<%=mvo.getMname() %>님 
			<br>
			<input type ="button" id="pwCheck" class ="btn_light btn_box_01" value=" 개인정보 변경"><br>
			<input type ="button" id="pwEdit" class ="btn_light btn_box_01" value=" 비밀번호 변경"><br>
			<input type ="button" id="" class ="btn_light btn_box_01" value=" 회원탈퇴"><br>
			
		<input type="hidden" id ="mid" name ="mid" value="<%=mvo.getMid()%>">
		</div>
		<div class ="sideBox shadow">
			즐겨찾기
		</div>
		<div class ="sideBox shadow">
			내 컨텐츠<br>
			<input type ="button" id="consultSearch" class ="btn_light btn_box_01" value=" 학원상담 조회"><br>
		</div>
	</form>	
<%		
	}
%>	

	</div>
<%
	Object obj3 =request.getAttribute("ReviewVO");

	if(obj3 !=null){
		ArrayList list=(ArrayList)obj3;
		
		int nCnt=list.size();

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
				ReviewVO rvo=(ReviewVO)list.get(i);

%>
				<tr align="center">
					<td><%= rvo.getRbno() %></td>
					<td><%= rvo.getAname() %></td>
					<td><a href="selectReview.ec?rbno=<%= rvo.getRbno() %>"><%= rvo.getRbsubject() %></a></td>
					<td><%= rvo.getRbinsertdate() %></td>
				</tr>
<%
			}
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
</div>	
	<br>
	<br>
	<br>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>