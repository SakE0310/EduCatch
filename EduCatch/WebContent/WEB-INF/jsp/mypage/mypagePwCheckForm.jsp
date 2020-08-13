<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object obj = request.getAttribute("MemberVO");
	
	if(obj != null){
		MemberVO mvo = (MemberVO)obj;
%>
<script>
		alert("성공");

		window.opener.$("#clickForm").attr("action", "EditDisplay.ec");
		window.opener.$("#clickForm").attr("target", "");
		window.opener.$("#clickForm").submit();
		window.close();
</script>
<%		
	}else if(obj == null){
%>
<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.\n다시 입력해주시기 바랍니다.");
		history.go(-1);
</script>
<%		
	}
%>
</body>
</html>