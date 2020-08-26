<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:include page="../../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
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
	#contnent{
		width : 600px;
		height: 600px;
	}
	
	#table_head{
		border-collapse: collapse;
		background-color: #F5F5F5;
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
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#deleteData").click(function(){
			
			alert("정말로 삭제하시겠습니까?");
			$("#ReviewForm").attr("action","deleteReview.ec");
			$("#ReviewForm").attr("method","POST");
			$("#ReviewForm").submit();
			
		});
	
		$("#listData").click(function(){
			
			$("#ReviewForm").attr("action","listReview.ec");
			$("#ReviewForm").attr("method","POST");
			$("#ReviewForm").submit();
			
		});
	});	
	

</script>
<body>
<%

	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}

	String reviewboard_rbno = "";
	

	Object obj=request.getAttribute("ReviewVO");
	
	if(obj !=null){
		
			ReviewVO rvo=(ReviewVO)obj;
			
			if(mvo !=null){
%>
<p></p>
	<div class="container" style="width: auto; height: auto;">
		<form id="ReviewForm" name="ReviewForm">
		 	<input type="hidden" id="ano" name="ano" value="<%= rvo.getAno()%>"/> 
		 	<input type="hidden" id="aname" name="aname" value="<%= rvo.getAname()%>"/> 
		 	<input type="hidden" id="academy_ano" name="academy_ano" value="<%= rvo.getAcademy_ano()%>"/> 
		 	
			<input type="hidden" id="rbno" name="rbno" value="<%= rvo.getRbno()%>"/>
		
			<table align="center" width="700" height="100" class="table">
			<thead id="table_head">
				<tr>
					<th><div align="center"><%= rvo.getRbsubject() %></div></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>
							<div>
								<span>
								작성자 :<%= rvo.getRbname() %>&nbsp;&nbsp;&nbsp;
								작성일자 :<%= rvo.getRbinsertdate() %>&nbsp;&nbsp;&nbsp;
								★평점 :<%= rvo.getRbgrade() %>점&nbsp;&nbsp;&nbsp;						
								</span>
							</div>
						</div>
					</td>
				</tr>
				<tr>
         			<td>
         				<div>
         				<%= rvo.getRbcontent() %>
<%
							String img = rvo.getRbimg();
							if(img != null){
%>
								<div align="center">
         						<img src="/EduCatch/assets/img/reviewImg/<%= rvo.getRbimg() %>" border=() width="300" height="300"/>
         						</div>
<%								
							}//end of if(img)
%>
         				</div>
         			</td>
         		</tr>
			</tbody>
			</table>
		</form>
	</div>
	<p></p>
		<jsp:include page="reviewReply.jsp">
			<jsp:param name="reviewboard_rbno" value="<%=reviewboard_rbno %>"/>
		</jsp:include>
<%
	if( rvo.getRbname().equals(mvo.getMname()) || mvo.getMauth().equals("3")){
%>
	<table style="margin-left: auto; margin-right: auto;" border="0">
			<tr align="center">
				<td>
					<a href="selectUpdate.ec?rbno=<%= rvo.getRbno()%>">
					<input type="button" id="updateData" value="수정" class=" btn_light btn_box_01"/>&nbsp;	
					</a>
				</td>
				<td>
					<input type="button" id="deleteData" value="삭제" class=" btn_light btn_box_01"/>&nbsp;	
				</td>
				<td align="center">
					<input type="button" id="listData" value="목록"   class=" btn_light btn_box_01"/>
				</td>
			</tr>
		</table>
<%
	}else{
%>
		<table style="margin-left: auto; margin-right: auto;" border="0">
			<tr align="center">
				<td>
					<input type="button" id="listData" value="목록"   class=" btn_light btn_box_01" style="margin: auto;"/>
				</td>
			</tr>
		</table>
<%
			}	
		}else if(mvo == null){
%>
		<script>
			alert("로그인 후 이용해주세요");
			location.href="listReview.ec";
		</script>
<%
		}
	}
%>
<jsp:include page="../../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>