<%@page import="com.kosmo.educatch.vo.FreeVO"%>
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
	Object obj=request.getAttribute("result");
	if(obj!=null){
		int nCnt=((Integer)obj).intValue();
		if(nCnt>0){
			System.out.println("삭제된 건 수"+nCnt+"건");
%>	
		<script>
			location.href="index.jsp";
		</script>
<%
		}
	}else{
		out.println("회원삭제실패");
%>
		<script>
			location.href="/mypage/mypageOut.jsp";
		</script>
<%
	}
%>
	
</body>
</html>