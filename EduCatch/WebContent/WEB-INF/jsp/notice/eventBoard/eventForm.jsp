<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmo.educatch.vo.EventVO" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object result = request.getAttribute("result");
	Object isSuccess = request.getAttribute("isSuccess");
	Object obj = request.getAttribute("EventVO");
	
	//result의 값이 존재할때
	if(result != null){
		String resultStr=(String)result;
		String success=(String)isSuccess;
	
		EventVO evo=(EventVO)obj;
		
		//=============수정일 때 동작======================================
		if(resultStr =="update" ){
			//컨트롤러에서 받아온 success가 true이면 동작
			if(success =="true"){
%>
				<script>
					console.log("수정성공");
					//수정한 글 상세보기로 이동
					location.href="selectEvent.ec?eno=<%=evo.getEno() %>";
				</script>
<%				
			//컨트롤러에서 받아온 success가 false이면 동작	
			}else{
%>
				<script>
					alert("수정실패");
					//수정 실패한 글 상세보기로 이동
					location.href="selectEvent.ec?eno=<%=evo.getEno() %>";
				</script>
<%					
			}//end of if-else(success)
		
		//===========삭제일 때 동작===============================
		}else if(result=="delete"){
			//컨트롤러에서 받아온 success가 true이면 동작
			if(success =="true"){
%>
				<script>
					console.log("삭제성공");
					//공지사항 전체조회로 이동
					location.href='listEvent.ec';
				</script>
<%				
			//컨트롤러에서 받아온 success가 false이면 동작	
			}else{
%>
				<script>
					alert("삭제실패");
					//공지사항 전체조회로 이동
					location.href='listEvent.ec';
				</script>
<%					
			}//end of if-else(success)
		}
	
	//result의 값이 없을 때
	}else{
		out.println("<script>\n");
		out.println("alert('실패');");
		//공지사항 전체조회로 이동
		out.println("location.href='listEvent.ec'");
		out.println("</script>\n");
	}//end of if-else(result)
%>
</body>
</html>