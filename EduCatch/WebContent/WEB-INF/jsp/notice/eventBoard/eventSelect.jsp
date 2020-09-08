<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.EventVO" %>  
<%@page import="com.kosmo.educatch.vo.MemberVO"%>  
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>이벤트 상세보기</title>

<!-- 테이블 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	/*미디어 쿼리*/
	/* Mobile Device (가로폭 767px 이하) */
	@media all and (max-width:767px) {
		#media_mobile_div{
			width: 300px;
			height: 500px;
			margin: auto;
		}		
		#media_mobile_img{
			width: 250px;
			height: 300px;
		}
	}
	
	/* Tablet (가로폭 768px 이상, 1023px 이하) */
	@media all and (min-width:768px) and (max-width:1023px) {
	/* 브라우저 가로폭이 768~1023px일때 적용될 css (태블릿) */
	}
	
	/* PC Desktop (가로폭 1024 이상) */
	@media all and (min-width:1024px) {
		#media_mobile_table{
			width:700px;
			height:100px;
		}
	}

	#table_head{
		border-collapse: collapse;
		background-color: #21146b;
		color: white;
	}
	
	#contentDIV{
		overflow:hidden;
		 height:auto;
		/* height:462px; */
		/* overflow:scroll; */
	}
	
	#nfont {
	 	font-family: 'Do Hyeon', sans-serif;
	  }
	  .btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #140C40;
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
	#eventSelForm{
			margin-bottom: 178px;
	}
	
</style>
<script type="text/javascript">

$(document).ready(function() {
	console.log("이벤트_상세보기 조회");
	
	//===관리자가 수정버튼을 누르면 실행========
	$("#updateData").click(function() {
		console.log("수정버튼 누름");
		
		//수정페이지로 이동
		$("#eventSelForm").attr("action","updateDisplayEvent.ec");
		$("#eventSelForm").attr("method","POST");
		$("#eventSelForm").submit();
		
	})//end of updateData
	
	
	//===관리자가 삭제버튼을 누르면 실행========
	$("#deleteData").click(function() {
		console.log("삭제버튼 누름");
		
		var result = confirm("게시글을 삭제하시겠습니까?");
		if(result){
		$("#eventSelForm").attr("action","deleteEvent.ec");
		$("#eventSelForm").attr("method","POST");
		$("#eventSelForm").submit();
		}else{
			
		}
		
	})//end of deleteData
	
	//===관리자가 목록버튼을 누르면 실행========
	$("#listData").click(function() {
		console.log("목록버튼 누름");
		
		$("#eventSelForm").attr("action","listEvent.ec");
		$("#eventSelForm").attr("method","POST");
		$("#eventSelForm").submit();
		
	})//end of listData
	
});//end of ready()
</script>
</head>
<body>
<%
	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}

	Object obj= request.getAttribute("EventVO");

	if(obj != null){
		EventVO evo =(EventVO)obj;

%>
	<div class="container">
				<form id="eventSelForm" name="eventSelForm" >
	<div>
			<table border="0" cellpadding="1" cellspacing="1" align="center">
			<tr>
				<td align="center"><h2>이벤트</h2></td>
			</tr>
			</table>
			<hr>
		</div>
				<input type="hidden" name="eno" id="eno" value="<%=evo.getEno() %>">
					<table align="center" width="700px" height="100px" class="table">
					<thead id="table_head">
			             <tr>
			                 <th><div align="center"><%=evo.getEsubject() %></div></th>
			             </tr>
			         </thead>
			         <tbody>
			         	<tr>
			         		<td>
			         			<div>
			         				<div>
			                             <span><em>작성일자 :</em><%=evo.getEinsertdate()%></span>                                                </div>
			                             <span><em>수정일자 :</em><%=evo.getEupdatedate()%></span>                                                </div>
			                         <div>
			                         <div id ="nname1" name="nname1" align="right" >
			                         	<span><em>작성자 :</em><%=evo.getEname()%></span>
			                         </div>
			         			</div>
			         		</td>
			         	</tr>
			         	<tr>
			         		<td>
			         		
			         			<div id="contentDIV" align="center"  >
			<%
										String img = evo.getEimg();
										if(img != null){
			%>
			         						<img src="/EduCatch/assets/img/event/<%=evo.getEimg()%>" alt="사진업음" /><br>
			<%								
										}//end of if(img)
			%>         				
			         			</div>
			         			<div>
			         				<%=evo.getEcontent()%>
			         		</div>
			         		</td>
			         	</tr>
			<%			
				}//end of if(obj)	
			%>
						<tr>
							<td align="center">
<%
			if(mvo != null){
				if( mvo.getMauth().equals("3")){
%>							
								<input type="button" value="수정" id="updateData" class=" btn_light btn_box_01">
								<input type="button" value="삭제" id="deleteData" class=" btn_light btn_box_01">
<%	
					}
				}
%>								
								<input type="button" value="목록" id="listData" class=" btn_light btn_box_01">
							</td>	
						</tr>
		         </tbody>
				</table>
				</form>
				</div>
	<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>