<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>학원명 검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	function sendChildValue(aname){

	opener.setChildValue(aname);


	window.close();

	}



</script>
</head>
<body>
<form id="searchForm" name="searchForm">
	<div id="mainWrapper">
  	<div  class="container">
  	<table align="center" class="table" border="1">
		<colgroup>
			<col width="200px"/>		
		</colgroup>
		<thead id="table_head">
			<tr>
				<td align="center">학원명</td>
				<td align="center">지역</td>
			</tr>
		</thead>
		<tbody>
<%
	Object obj=request.getAttribute("cacademyList");

	
	if(obj !=null){
		
		ArrayList cacademyList=(ArrayList)obj;
		int nCnt=cacademyList.size();
		
		for(int i=0; i<nCnt; i++){
			AcademyVO avo=(AcademyVO)cacademyList.get(i);
		
%>
	<input type="hidden" id="aname" name="aname" value="<%=avo.getAname() %>"/>
	<input type="hidden" id="ano" name="ano" value="<%=avo.getAno() %>"/>
		<tr align="center">
			<td>
				<a href="javascript:sendChildValue('<%= avo.getAname()%>')"><%= avo.getAname()%></a></td>	
				<td><%= avo.getAaddr1() %></td>			
			</td>
		</tr>
<% 
		}
	}
%>
		</tbody>
		</table>
		</div>
	</div>
</form>
</body>
</html>