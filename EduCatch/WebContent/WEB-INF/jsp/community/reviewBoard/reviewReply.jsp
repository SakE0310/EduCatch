<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String reviewboard_rbno = request.getParameter("reviewboard_rbno");
	String member_mno = request.getParameter("member_mno");
%>
<script src="/cssExample/js/jquery.js"></script>
<script src="/cssExample/js/jquery.ui.js"></script>
<script src="/cssExample/js/jquery.bxslider.js"></script>
<script src="/cssExample/js/common.js"></script>  
<script src="/cssExample/js/custom.js"></script>
<script src="/cssExample/js/jquery.printElement.min.js"></script>
<script src="/cssExample/js/main2.js"></script>  
<script src="/cssExample/js/favoriteMenu.js"></script> 
<script src="/cssExample/js/masonry.pkgd.js"></script>
<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	var reviewboard_rbno = "<%=reviewboard_rbno%>";
	var member_mno = "<%=member_mno%>";
	
	$(document).ready(function(){
		
		// 댓글전체목록 호출 함수 불러오기				
		callReplyList();
	});
	
	// 댓글전체목록 불러오는 함수
	function callReplyList(){
		console.log('callReplyList 함수 호출!');
		console.log('bm_no : ' + bm_no + ', i_no : ' + i_no);
		
		$("#replyList_ul").html("");
		
		$.ajax({
			url:"replyList.ec",
			type:"post",
			dataType:"JSON",
			data:{
				reviewboard_rbno: reviewboard_rbno,
				member_mno: member_mno
			},
			success:function(map){
				console.log('댓글전체목록조회 ajax 성공 >>> ' + map);
				var replyList = map.replyList;
				//var total = map.replyTotal;
				//$(".total").html("댓글 총 " + total + "개");
				addNewReply(replyList);
			},
			error:function(){
				alert('댓글전체목록 조회 ajax 실패');
			}
		}); // end of ajax
		
	} // end of callReplyList
</script>
<body>

		<div class="table_wrap">
			<!-- =================== 댓글 입력폼 ==================== -->						
				<table>
					<thead>
						<tr>
							<th class="alignL total"></th>
						</tr>
					</thead>
					<tbody id="replyList_ul">	
					
						<!-- 동적생성요소 댓글리스트 들어갈 자리 -->	
					
					</tbody>
				</table>
			<form id="replyInsertForm">	
				<table class="reply_insert_wrap">
					<tr class="marT5 marL5 marB5">
						<td>
							<textarea name="recontent" id="recontent" style="padding:10px; width:80%;"placeHolder="댓글을 입력해주세요."></textarea>
							<input type="button" class="blue_btn" id="replyInsert" value="등록" style="vertical-align:middle;"/>
						</td>
					</tr>
				</table>
			</form>
		</div>

</body>
</html>