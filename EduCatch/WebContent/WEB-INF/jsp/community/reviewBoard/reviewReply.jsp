<%@page import="com.kosmo.educatch.vo.ReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.catalina.valves.rewrite.RewriteRule"%>
<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<%
	

		HttpSession hs = request.getSession(false);
		System.out.println("hs >>> "+hs);
		
		MemberVO mvo = null;
		if(hs != null){
			mvo = (MemberVO)hs.getAttribute("user");
			
			System.out.println("mno >>>>>>>>>>> "+mvo.getMname());
			
		}	
		
		   String rbno = request.getParameter("rbno");
		   String reviewboard_rbno = request.getParameter("rbno");
		   String member_mno = request.getParameter("member_mno");
		   String reno = request.getParameter("reno");
		   String recontent = request.getParameter("recontent");
		   String rbwt = request.getParameter("rbwt");
		   
// 			Object ob = request.getAttribute("replyList");
			
// 			ReplyVO rpvo = (ReplyVO)ob;
// 					System.out.println("getRewiter >>> "+rpvo.getRewriter());
	   
%>
<style type="text/css">
/*미디어 쿼리*/
	/* Mobile Device (가로폭 767px 이하) */
	@media all and (max-width:767px) {
		#recontent{
			width:20%;
		
		}
		
		.hrColor{
			border: solid 0.5px #737373;
			width:33%;
		}
	}
	/* PC Desktop (가로폭 1024 이상) */
	@media all and (min-width:1024px) {
		#recontent{
			width:90%;
		
		}

	}

.btn_box_02 {
/*     width: auto; */
    margin-bottom: 50px;
}
.btn_light {

	margin-right: 5px;
    display: inline-block;
    *display: inline;
    *zoom: 1;
    text-align: center;
    background: #e5e5e5;
    color: #555;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid #e5e5e5;

    margin-top: 0px;
    margin-bottom: 0px;
    /* transition: all 0.3s ease-in-out; */
}


.table_wrap{
   border-collapse: collapse;
   background-color: #F5F5F5;
}

#list{
   margin-left: 10px;
}



#replyList_ul{
      margin-left: 20px;
      /*background-color: #21146b;*/
}

textarea {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;

    width: 100%;
}

.marT5 marL5 marB5{
	margin: 0px;
	width: 900px;
	height: 70px;
}

.hrColor{
	border: solid 0.2px #737373;
}

.brGap{
	margin-right: 10px;
}

.marL10{
	font-size: 10px;
}

p{
	color: black;
}
/* .first .last{ */
/* 	background-color: #21146b; */
/* } */
</style>
<script type="text/javascript"
      src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

   var reviewboard_rbno = "<%=reviewboard_rbno%>";
<%--    var reviewName = "<%=%>"; --%>
   var member_mno = "<%=mvo.getMno()%>";
   var member_mno2 = "<%=mvo.getMno()%>";
   var reno = "<%=reno%>";
   var recontent = "<%=recontent%>";
   var sessionID = "<%=mvo.getMname()%>";
   var rewriter = "<%=mvo.getMname()%>";
   var mauth = "<%= mvo.getMauth()%>";
   
   console.log("!@!@!@ sessionID >>> "+sessionID);

   
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
               rewriter: rewriter,
               member_mno: member_mno,
               reviewboard_rbno: reviewboard_rbno,
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
      data += "<input type='button' id='update_btn' value='등록' class='btn_light btn_box_02'>";
      //data += "<input type='button' id='updateReset_btn' value='취소' class='btn_light btn_box_02'>";
      bm_recontext_p.html(data);
      
   });   // end of 수정버튼 수정폼 출력 이벤트
   
   
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
            recontent: recontent,
            member_mno: member_mno
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
               reno: reno,
               member_mno: member_mno
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
         url:"replyList.ec",
         type:"post",
         dataType:"JSON",
         data:{
            reviewboard_rbno: reviewboard_rbno,
            reno: reno
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
   
   // 새 댓글을 화면에 추가해서 출력하는 함수
   function addNewReply(replyList){
      console.log('addNewReply 함수 호출! >>> 조회된 댓글 갯수 replyList.length : ' + replyList.length);
      
      
      for(var i=0; i<replyList.length; i++){
         var reno = replyList[i].reno;
         var member_mno = replyList[i].member_mno;
         var rewriter = replyList[i].rewriter;
         var reinsertdate = replyList[i].reinsertdate;
         var recontent = replyList[i].recontent;
         var rewriter = replyList[i].rewriter;
         
         console.log('replyList['+i+'] >>>\nreno : ' + reno + ', rewriter : ' + rewriter + ', reinsertdate : ' + reinsertdate + ', recontent : ' + recontent );
         
         var replyWriterBool = member_mno == member_mno;
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
         
         // 내용
         var bm_recontext_p = $("<p>");
         bm_recontext_p.addClass("marT5 marL5 marB5");
         bm_recontext_p.html(recontent);

		 var hr = $("<hr>");
		 hr.addClass("hrColor");



         if(replyWriterBool){      
            // 수정폼 출력버튼
            var updateForm_btn_input = $("<input>");
            updateForm_btn_input.attr({"type":"button","id":"updateForm_btn","value":"수정", "class" : "btn_light btn_box_02"});
            updateForm_btn_input.addClass("reply_btn");

            // 삭제버튼
            var delete_btn_input = $("<input>");
            delete_btn_input.attr({"type":"button","id":"delete_btn","value":"삭제", "class":"btn_light btn_box_02"});
            delete_btn_input.addClass("reply_btn");
         }
         console.log(rewriter);
         console.log(sessionID);

         if(member_mno == member_mno2 || mauth == 3){
     		// 조립하기
        	info_p.append(i_nameKr_span).append(bm_reinsertdate_span).append(updateForm_btn_input).append(delete_btn_input)
            newRe_td.append(info_p).append(bm_recontext_p).append(hr)
            
            newRe_li.append(newRe_td);
            $("#replyList_ul").append(newRe_li);
         }else{
//         	조립하기
         	info_p.append(i_nameKr_span).append(bm_reinsertdate_span)
            newRe_td.append(info_p).append(bm_recontext_p).append(hr)
            newRe_li.append(newRe_td);
            $("#replyList_ul").append(newRe_li);
         }
     	
     		
//       console.log("!@!@!@ rbwt >>> "+rbwt);
//       console.log("!@!@!@ rewriter >>> "+rewriter);
//       console.log("!@!@!@ getMname >>> "+mvo.getMname());

   

      } // end of for
   } // end of addNewReply 함수
   
   
   // ===== 댓글 등록시 입력한 데이터 초기화 함수 ====
   function dataReset(){
      $("#recontent").val("");
   }
   
 //댓글 바이트 수 제한
   function fnChkByte(obj,maxByte){
      var str = obj.value;
      var str_len = str.length;
      
      var rbyte=0;
      var rlen=0;
      var one_char="";
      var str2="";
      
      for(var i=0; i<str_len; i++){
         one_char=str.charAt(i);
         if(escape(one_char).length>4){
            rbyte+=2;
         }else{
            rbyte++;
         }
         if(rbyte<=maxByte){
            rlen=i+1;
         }
      }
      if(rbyte>maxByte){
         alert("한글"+(maxByte/2)+"자/영문"+maxByte+"자를 초과 입력할 수 없습니다.");
         str2=str.substr(0,rlen);
         obj.value=str2;
         fbChkByte(obj,maxByte);
      }else{
         document.getElementById("byteInfo").innerText=rbyte;
      }
   }
   

</script>
<body>

      <div class="container">
         <div class="table_wrap" style="border: solid 0.5px #737373;">
         <!-- =================== 댓글 입력폼 ==================== -->                  
            <table style="width: 1140px;">
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
            <table class="reply_insert_wrap" align="center" width="1100" height="100">
               <tr class="marT5 marL5 marB5">
                 <td>
                     <textarea name="recontent" id="recontent" style="padding:10px; min-width: 260px; border: 0;"  onKeyUp="javascript:fnChkByte(this,'200')"
                     placeHolder="댓글을 입력해주세요."></textarea><span id="byteInfo">0</span>(200Byte)
                     <input type="button" class="btn_light btn_box_02" id="replyInsert" value="등록" style="vertical-align:middle; margin-bottom: 50px; margin-right:0px;"/>
                     <input type="hidden" id="reno" name="reno"/>
                  </td>
               </tr>
            </table>
            </div> 
         </form>
         </div>
      </div>

</body>
</html>