<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kosmo.educatch.vo.FreeVO"  %>
<%@ page import="com.kosmo.educatch.vo.MemberVO"  %>
<!DOCTYPE html>
<html>
<head>
<%
HttpSession hs = request.getSession(false);
MemberVO mvo = null;
if(hs != null){
	mvo = (MemberVO)hs.getAttribute("user");
}
%>
<meta charset="UTF-8">
<title>상세정보조회</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
<%
String freeboard_fbno = "";

Object obj = request.getAttribute("freevo"); 

if(obj!=null){
	FreeVO freevo = (FreeVO)obj;
	
	freeboard_fbno = freevo.getFbno();
	if(mvo!=null){
		if(mvo.getMno().equals(freevo.getMember_mno())){
%>
function updateClick(){
	console.log("updateClick함수 진입");
	alert("수정");
	$("#edit").attr("action","selectfreeboardUD.ec");
	$("#edit").attr("method","POST");
	$("#edit").submit();
}
function deleteClick(){
	console.log("deleteClick함수 진입");
	alert("삭제");
	$("#edit").attr("action","selectfreeboardUD.ec");
	$("#edit").attr("method","POST");
	$("#edit").submit();
}
<%
		}
	}
%>
function listClick(){
	console.log("listClick함수 진입");
	alert("목록");
	$("#edit").attr("action","freeboardlist.ec");
	$("#edit").attr("method","POST");
	$("#edit").submit();
}
</script>
<style type="text/css">
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
</head>
<body>
	<jsp:include page="../../../../top.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
	<!-- action/document/location -->
	<!-- enctype="multipart/form-data" -->
	<div class="container">
	<form id="edit" name="edit">
		<table style="margin-left: auto; margin-right: auto;" class="table" >
			
		
			<input type="hidden" id="fbno" name="fbno" value="<%= freevo.getFbno() %>"/> 
		 	<input type="hidden" id="fbname" name="fbname" value="<%= freevo.getFbname() %>"/> 
		 	<input type="hidden" id="fbinsertdate" name="fbinsertdate" value="<%= freevo.getFbinsertdate() %>"/> 
		 	<input type="hidden" id="member_mno" name="member_mno" value="<%= freevo.getMember_mno() %>"/> 
		 	
			<thead id="table_head">
				<tr>
					<th><div align="center"><%= freevo.getFbsubject() %></div></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>
							<span>
							글번호: <%=freevo.getFbno() %>&nbsp;&nbsp;&nbsp;
							작성자:<%= freevo.getFbname() %>&nbsp;&nbsp;&nbsp;
							작성일자:<%=freevo.getFbinsertdate() %>&nbsp;&nbsp;&nbsp;
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<span>
							<%=freevo.getFbcontent() %>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
						<%
						String img = freevo.getFbimg();
						if(img!=null){
						%>
							<div id ="fbimg" name="fbimg" align="center">
	         				<img src="/EduCatch/assets/img/freeImg/<%= freevo.getFbimg() %>" border=() width="300" height="300"/><br>
	         				</div>
						<%
						}
						%>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
		<!-- ========== 댓글 =========================================== -->
			<jsp:include page="reply.jsp">
				<jsp:param name="freeboard_fbno" value="<%=freeboard_fbno  %>"/>
			</jsp:include>
		<table style="margin-left: auto; margin-right: 400px;" border="0">
			<tr align="center">
				<td colspan="3" align="right">
				<%
					if(mvo !=null){
						if(mvo.getMno().equals(freevo.getMember_mno())){
				%>
				 <input type="button" id="updateclick" value="수정" onclick="updateClick()" class=" btn_light btn_box_01" />
				 <input type="button" id="deleteclick" value="삭제" onclick="deleteClick()" class=" btn_light btn_box_01" />
				<%
						}
					}
				%>
				 <input type="button" id="listclick" value="목록" onclick="listClick()" class=" btn_light btn_box_01" />
				</td>
			</tr>
			<%
			} 
			%>
		</table>
	</form>
	<jsp:include page="../../../../footer.jsp" flush="true">
	<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>