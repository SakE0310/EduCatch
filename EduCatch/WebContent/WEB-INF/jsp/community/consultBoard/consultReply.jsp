<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

	String cbno = request.getParameter("cbno");
	String consultboard_cbno = request.getParameter("cbno");
	String member_mno = request.getParameter("member_mno");
	String reno = request.getParameter("reno");
	String recontent = request.getParameter("recontent");
%>

<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

	var consultboard_cbno = "<%=consultboard_cbno%>";
	var member_mno = "<%=member_mno%>";
	var reno = "<%=reno%>";
	var recontent = "<%=recontent%>";
	
	$(document).ready(function(){
		
		// 댓글전체목록 호출 함수 불러오기				
		callReplyList();
		// ====== 등록버튼 클릭 이벤트 ============
		$("#replyInsert").click(function(){
			console.log("댓글등록버튼 클릭!");
			
			var recontent = $("#recontent").val();
			
			$.ajax({
				url:"replyInsert.ec",
				type:"post",
				dataType:"html",
				data:{
					//member_mno: member_mno,
					consultboard_cbno: consultboard_cbno,
					recontent: recontent
				},
				success:function(insertResult){
					console.log("댓글등록 ajax 성공 >>> insertResult : " + insertResult);
					// 입력데이터 초기화 함수 호출
					dataReset();
					// 댓글전체목록 호출
					callReplyList();
				},
				error:function(request, status, error){
	            	alert('댓글 등록에 실패했습니다.');
	            	alert('code='+request.status+" message=" + request.responseText + " error=" + error);
				}
			}); // end of ajax
			
		}); // end of 등록버튼 클릭
	});
	
	
	// ====== 댓글수정 버튼 클릭 후 수정폼 출력 이벤트 ======
	$(document).on("click","#updateForm_btn",function(){
		console.log('댓글수정버튼 클릭! 수정폼 출력 함수!');
		
		// 수정취소 버튼 클릭 ???
		$("#updateReset_btn").click();
		
		// 기존 댓글내용 데이터 가져오기(bm_recontext_p)
		var recontent = $(this).parents("tr").children().children().eq(1).html();
		console.log("bm_recontext : " + recontent);
		// 수정버튼, 삭제버튼 숨기기
		$(this).parents("tr").find("input[type='button']").hide();
		// 댓글정보 데이터 가져오기(info_p)
		$(this).parents("tr").children().children().eq(0).html();
		
		// 댓글내용 출력되던 bm_recontext_p 영역
		var bm_recontext_p = $(this).parents("tr").children().children().eq(1);
		// 댓글내용영역 입력데이터 초기화
		bm_recontext_p.html("");
		
		// 댓글수정폼 데이터 뿌려서 출력
		var data = "<textarea name='bm_recontextUp' id='bm_recontextUp'>" + recontent + "</textarea>";
		data += "<input type='button' id='update_btn' value='등록'>";
		data += "<input type='button' id='updateReset_btn' value='취소'>";
		bm_recontext_p.html(data);
		
	});	// end of 수정버튼 수정폼 출력 이벤트
	
	
	// ====== 수정취소 버튼 클릭 이벤트
	$(document).on("click","#updateReset_btn",function(){
		console.log('수정취소버튼 클릭이벤트 호출!');
		
		var recontent =  $(this).parents("tr").find("textarea").html();
		$(this).parents("tr").find("input[type='button']").show();
		var bm_recontext_p = $(this).parents("tr").children().eq(1);
		bm_recontext_p.html(recontent);
	}); // end of 수정취소버튼 클릭 - 수정폼출력
	
	
	// ====== 댓글수정완료버튼 클릭 이벤트 ==============
	$(document).on("click","#update_btn",function(){
		console.log('댓글수정완료버튼 클릭!');
		
		var reno = $(this).parents("tr").attr("reno");
		var recontent = $("#bm_recontextUp").val();

		$.ajax({
			url:"replyUpdate.ec",
			type:"post",
			dataType:"html",
			data: {
				reno: reno,
				recontent: recontent
			},
				success:function(updateResult){
				console.log("댓글수정 ajax 성공 >>> updateResult : " + updateResult);
				
				// 댓글전체목록 호출
				callReplyList();
			},
			error:function(request, status, error){
            	alert('댓글 수정에 실패했습니다.');
            	alert('code='+request.status+" message=" + request.responseText + " error=" + error);
			}
		}); // end of ajax
	}); // end of 수정완료버튼 클릭 이벤트
	
	
	// ======== 댓글삭제버튼 클릭 이벤트 =====================
	$(document).on("click","#delete_btn",function(){
		console.log('댓글삭제버튼 클릭!');
		
		var reno = $(this).parents("tr").attr("reno");
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				url : "replyDelete.ec",
				type: "post",
				dataType: "html",
				data: {
					reno: reno
				},
				success:function(deleteResult){
					console.log("댓글삭제 ajax 성공 >>> deleteResult : " + deleteResult);
					
					// 댓글전체목록 호출
					callReplyList();
				},
				error:function(request, status, error){
	            	alert('댓글 삭제에 실패했습니다.');
	            	alert('code='+request.status+" message=" + request.responseText + " error=" + error);
				}
			}); // end of ajax
		} // end of confirm if
	}); // end of 댓글삭제버튼 클릭 이벤트	
	
	// 댓글전체목록 불러오는 함수
	function callReplyList(){
		console.log('callReplyList 함수 호출!');
		
		$("#replyList_ul").html("");
		
		$.ajax({
			url:"creplyList.ec",
			type:"post",
			dataType:"JSON",
			data:{
				consultboard_cbno: consultboard_cbno,
				//member_mno: member_mno
				reno: reno
			},
			success:function(map){
				console.log('댓글전체목록조회 ajax 성공 >>> ' + map);
				var creplyList = map.creplyList;
				//var total = map.replyTotal;
				//$(".total").html("댓글 총 " + total + "개");
				addNewReply(creplyList);
			},
			error:function(){
				alert('댓글전체목록 조회 ajax 실패');
			}
		}); // end of ajax
		
	} // end of callReplyList
	
	// 새 댓글을 화면에 추가해서 출력하는 함수
	function addNewReply(creplyList){
		console.log('addNewReply 함수 호출! >>> 조회된 댓글 갯수 creplyList.length : ' + creplyList.length);
		
		
		for(var i=0; i<creplyList.length; i++){
			var reno = creplyList[i].reno;
			var member_mno = creplyList[i].member_mno;
			var rewriter = creplyList[i].rewriter;
			var reinsertdate = creplyList[i].reinsertdate;
			var recontent = creplyList[i].recontent;
			
			console.log('creplyList['+i+'] >>>\nreno : ' + reno + ', rewriter : ' + rewriter + ', reinsertdate : ' + reinsertdate + ', recontent : ' + recontent );
			
			//var replyWriterBool = replyWriterI_no == i_no;
			//var replyMasterBool = i_no.indexOf("M") == 0;
			//console.log('replyWriterBool : ' + replyWriterBool + ', replyMasterBool : ' + replyMasterBool);

			// 새 댓글 추가할 li태그 객체
			var newRe_li = $("<tr>");
			newRe_li.attr("reno",reno);
			newRe_li.attr("member_mno",member_mno);
			
			var newRe_td = $("<td>");
			newRe_td.addClass("first");
			newRe_td.addClass("last");
			
			// 작성정보가 출력될 <p>태그
			var info_p = $("<p>");
			info_p.addClass("marT5 marL5 marB5");
			
			// 댓글번호
			var num_span = $("<span>");
			num_span.addClass("bold");
			num_span.html(reno);
			
			// 작성자명
			var i_nameKr_span = $("<span>");
			i_nameKr_span.addClass("bold");
			i_nameKr_span.addClass("marL5");
			i_nameKr_span.html(rewriter);
			
			// 작성일
			var bm_reinsertdate_span = $("<span>");
			bm_reinsertdate_span.addClass("marL10");
			bm_reinsertdate_span.html(reinsertdate);
			
			
			//if(replyWriterBool || replyMasterBool){		
				// 수정폼 출력버튼
				var updateForm_btn_input = $("<input>");
				updateForm_btn_input.attr({"type":"button","id":"updateForm_btn","value":"수정"});
				updateForm_btn_input.addClass("reply_btn");

				// 삭제버튼
				var delete_btn_input = $("<input>");
				delete_btn_input.attr({"type":"button","id":"delete_btn","value":"삭제"});
				delete_btn_input.addClass("reply_btn");
			//}	
			
			// 내용
			var bm_recontext_p = $("<p>");
			bm_recontext_p.addClass("marT5 marL5 marB5");
			bm_recontext_p.html(recontent);
			
			// 조립하기
			info_p.append(num_span).append(i_nameKr_span).append(bm_reinsertdate_span).append(updateForm_btn_input).append(delete_btn_input)
			newRe_td.append(info_p).append(bm_recontext_p)
			newRe_li.append(newRe_td);
			$("#replyList_ul").append(newRe_li);
			
		} // end of for
	} // end of addNewReply 함수
	
	
	// ===== 댓글 등록시 입력한 데이터 초기화 함수 ====
	function dataReset(){
		$("#recontent").val("");
	}
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
							<input type="hidden" id="reno" name="reno"/>
						</td>
					</tr>
				</table>
			</form>
		</div>

</body>
</html>