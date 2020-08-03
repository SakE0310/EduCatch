<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style type="text/css">
	#contnent{
		width : 600px;
		height: 600px;
	}
</style>
</head>
<body>
	<div>
	<form>
		<table align="center" width="700" height="100" border="1">
		 <thead>
             <tr>
                 <th><div class="tb-center">${NoticeVO.nsubject }</div></th>
             </tr>
         </thead>
         <tbody>
         	<tr>
         		<td class="line">
         			<div class="cont-sub-des">
         				<div>
                             <span><em>작성일 :</em>${NoticeVO.nupdatedate}</span>                                                </div>
                         <div>
                         <div align="right" >
                         	<span><em>작성자 :</em>${NoticeVO.nname}</span>
                         </div>
         			</div>
         		</td>
         	</tr>
         	<tr>
         		<td>
         			<div id ="contnent" name="contnent" align="center">
         				${NoticeVO.ncontent }
         			</div>
         		</td>
         	</tr>
			<tr>
			<td align="center">
				<input type="button" value="수정" id="updateData">
				<input type="button" value="삭제" id="deleteData">
				<input type="button" value="목록" id="    ">
				
			</td>	
			</tr>
         </tbody>
		</table>
		</form>
	</div>
</body>
</html>