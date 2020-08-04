<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var result="${result}";
	var isSuccess="${isSuccess}";
	console.log("result>>>"+result);
	
	if(result=="update"){
		alert("수정완료");
		//공지사항 상세보기
		location.href="selectNotice.ec?nno=${NoticeVO.nno }";
		
	}else if(result=="delete"){
		if(isSuccess=="true"){
			alert("삭제완료");
			//공지사항 전체목록으로 이동
			location.href="listNotice.ec";
		}else{
			alert("삭제실패");
			//공지사항 전체목록으로 이동
			location.href="listNotice.ec";
		}
	}
</script>
</body>
</html>