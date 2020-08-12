<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
	Object obj=request.getAttribute("academyList");

	
	if(obj !=null){
		
		ArrayList academyList=(ArrayList)obj;
		int nCnt=academyList.size();
		
		for(int i=0; i<nCnt; i++){
			AcademyVO avo=(AcademyVO)academyList.get(i);
		
%>
<meta charset="UTF-8">
<title>학원명 검색</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


/*
 	$(document).ready(function() {


	$("#checkAcademy").click(function(){
		
		//alert("checkAcademy >>>");
		//$("#searchForm").attr("action","insertDisplay.ec");
		//$("#searchForm").attr("method","POST");
		
		//$("#searchForm").submit();
		window.close();
		
		
	});
	
});	

*/

	function sendChildValue(aname){

	opener.setChildValue(aname);

	window.close();

	}



</script>
</head>
<body>
<form id="searchForm" name="searchForm">
	<input type="hidden" id="aname" name="aname" value="<%=avo.getAname() %>"/>
	<input type="hidden" id="ano" name="ano" value="<%=avo.getAno() %>"/>
		<tr align="center">
			<td>
				<a href="javascript:sendChildValue('<%= avo.getAname()%>')"><%= avo.getAname()%></a></td>				
			</td>
		</tr>
</form>
<% 
		}
	}
%>
	
</body>
</html>