<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object result = request.getAttribute("result");
	System.out.println("result>>"+result);

	//result의 값이 존재할때
	if(result !=null){
		String resultStr= (String)result;
		System.out.println("resultStr>>"+resultStr);
		
		if(resultStr.indexOf("실패") > -1){
			out.println("<script>\n");
			out.println("history.go(-1);");
			out.println("</script>\n");
			
		}else{
			out.println("<script>\n");
			out.println("alert('등록성공');");
			out.println("location.href='listNotice.ec'");
			out.println("</script>\n");
		}
	
	//result의 값이 존재하지 않을때
	}else{
			out.println("<script>\n");
			out.println("history.go(-1);");
			out.println("</script>\n");
	}
%>
<!-- <script type="text/javascript">
	if(result.indexOf("문제") > -1){
		history.go(-1);
	}else{
		alert("등록성공");
		location.href="listNotice.ec";
	}
	
</script> -->

</body>
</html>