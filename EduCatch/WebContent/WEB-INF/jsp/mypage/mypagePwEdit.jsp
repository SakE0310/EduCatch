<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosmo.educatch.vo.MemberVO" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 아이콘 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	/* Mobile Device (가로폭 767px 이하) */
	@media all and (max-width:767px) {
		#full{
	       width : 350px;
	       height: 700px;
  		 }
  		 #sideBanner-mypage {
		   display: none;
		    }
		 #sideBanner-mypage{
	         width:350px;
	         height: 700px;
     		 } 
      .sideBox{
         width: 300px;
	    height: 180px;
	    background-color: #ffffff;
	    margin-top: 15px;
	    font-size: 20px;
	    margin-left: 10px;
  	 }   
  	  #mypage_subject{
  	 	text-align: center;
  	 	width: 350px;
  	 }
  	  #font_id{
      font-size: 30px;
  	 }
	}
	/* Tablet (가로폭 768px 이상, 1023px 이하) */
	@media all and (min-width:768px) and (max-width:1023px) {
	/* 브라우저 가로폭이 768~1023px일때 적용될 css (태블릿) */
		 #full{
	       width : 750px;
	       height: 700px;
  		 }
  		.container-mypage {
		    width: 500px;
		    height: 700px;
		    margin: auto;
		    margin-left: 230px;
		    }
  		 .table_insertdate{
  		 display: none;
  		 }
  		 
  		  #container_div{
	   	 width: 500px; 
	   	 height: 570px; 
	   }
	   #sideBanner-mypage{
         width:225px;
         height: 700px;
      } 
      .sideBox{
      width:200px;
      height:180px;
      background-color: #ffffff;
      margin-top: 15px;
      font-size: 20px;
   }   
    #mypage_subject{
  	 	text-align: left;
  	 	width: 500px;
  	 }
  	  #font_id{
      font-size: 25px;
  	 }
	}
	/* PC Desktop (가로폭 1024 이상) */
	@media all and (min-width:1024px) {
		 #full{
	       width : 1200px;
	       height: 700px;
  		 }
 		.container-mypage {
	       width: 700px;
	       height: 700px;
	       margin :auto;
	 	  }
		   
  		 #container_div{
	   	 width: 800px; 
	   	 height: 570px; 
	   }
	   #sideBanner-mypage{
         width:225px;
         height: 700px;
      } 
      .sideBox{
      width:200px;
      height:180px;
      background-color: #ffffff;
      margin-top: 15px;
      font-size: 20px;
  	 }   
  	 #mypage_subject{
  	 	text-align: left;
  	 	width: 800px;
  	 }
  	 #font_id{
      font-size: 25px;
  	 }
	}
/*-----------------------------------------------*/
   #full{
       margin :auto;
       align :center;
   }
  
   #sideBanner-mypage{
         position: absolute;
         /* width:225px;
         height: 700px; */
         margin :auto;
         padding-left: 12px;
         padding-right: 12px;
      } 
   
   .btn_light {
       display: inline-block;
       text-align: center;
       background: #ffffff;
       color: #555;
       vertical-align: middle;
       cursor: pointer;
       border: 0px solid #e5e5e5;
       height: 40px;
       font-size: 20px;
      }
   .btn_box_01 {
       width: auto;
       padding: 3px 10px;
       
       }
       
       .shadow {
          box-shadow: -100px 100px 100px -90px #000000,
              60px 0px 100px -90px #000000;
         border-radius: 0.5em;     
      }

   #a{
         color:black;
      }
   
   i{
      color : #140C40;
   }
   #font_id{
      font-family: 'Do Hyeon', sans-serif;
   }
   #container_div{
   	 overflow:auto;
   }
   .required{
   	color: red;
   }
   .btn_light_bb {
	    display: inline-block;
	    text-align: center;
	    background: #140C40;
	    color: #ffffff;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 1px solid #140C40;
	    height: 30px;
	    font-size: 15px;
	     border-radius: 0.5em;
		}
	.btn_box_01_bb {
	    width: auto;
	    padding: 3px 10px;
	}	
</style>
<script type="text/javascript">
	$(document).ready(function() {
		//==사이드바=============================================
		//======프로필 수정버튼을 누르면 실행 -> 비밀번호 확인 창
		$("#pwCheck").click(function() {
			console.log("프로필 수정버튼 누름");
			
			window.open("","pop","width=480, height=330");
			$("#clickForm").attr("action","selectPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").attr("target","pop");
			$("#clickForm").submit();
		})//end of myPageMemUpdate
		
		//=====비밀번호 변경 버튼 누르면 실행
		$("#pwEdit").click(function() {
			console.log("비밀번호 변경 버튼 누름");
			
			$("#clickForm").attr("action","editPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		})
		
		$("#consultSearch").click(function() {
			console.log("학원문의 변경 버튼 누름");
			
			$("#clickForm").attr("action","consultQuestion.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		})
		

		$("#freeBoard").click(function() {
			console.log("freeBoard >>> ");

			$("#clickForm").attr("action","myFree.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();	
		})

		$("#reviewBoard").click(function() {
			console.log("reviewBoard >>> ");

			$("#clickForm").attr("action","myReview.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();	
		})
		
		$("#memOut").click(function() {
			console.log("회원탈라라ㅏ라라 >>> ");

			$("#clickForm").attr("action","mypageOut.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();
		})
		
		//=====비밀번호 변경 버튼 누르면 실행
		$("#pwEdit").click(function() {
			console.log("비밀번호 변경 버튼 누름");
			
			$("#clickForm").attr("action","editPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		})//end of pwEdit
		
		$("#bookmark").click(function() {
			console.log("찜목록 >>> ");

			$("#clickForm").attr("action","listBookmark.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();
		})
		
<%
	Object obj = request.getAttribute("MemberVO");

	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}	
	if(obj != null){
		
		/* String NowPW = mvo.getMpw();
		System.out.println("NowPW>>>"+NowPW);//1234 */
		
%>
		//==== 비밀번호 변경 : 비밀번호 변경 버튼 누르면 실행
		$("#updatePW").click(function() {
			console.log("비밀번호 변경버튼 누름");
			
			var DBpw = "<%= mvo.getMpw()%>";
			var NowPW = $("#mpw").val();
			var NewPW = $("#mpw_new").val();
			var NewPWRe = $("#mpw_new_R").val();
			
			//현재 비밀번호 체크
			if(NowPW !='' ){
				if(NowPW == DBpw ){
					console.log("현재비밀번호 일치");
					
					if(NewPW != '' || NewPWRe !='' ){
						
						//새비밀번호 : 비밀번호 확인
						if(NewPW == NewPWRe ){
							 var length= document.pwEditForm.mpw_new.value.length;
							 if(length <6 || length >12){
								alert("비밀번호 오류- 6자 이상 12자 이하");
								$("#mpw_new").val('');
								$("#mpw_new_R").val('');
								return false; 
							}//end of if((length <6 || length >12))
							console.log("새비밀번호 : 비밀번호  일치 \n 수정가능");
							alert("비밀번호 수정 성공");
							$("#pwEditForm").attr("action","updatePW.ec");
							$("#pwEditForm").attr("method","POST");
							$("#pwEditForm").submit(); 
							
						}else{
							alert("비밀번호가 일치하지 않습니다.");
							$("#mpw_new").val('');
							$("#mpw_new_R").val('');
						}//end of if(NewPW == NewPWRe)
					}else{
						alert("새 비밀번호를 입력하세요");
					}//end of (NewPW != '' || NewPWRe !='' )
					
				}else{
					alert("현재비밀번호가 일치하지 않습니다.");
					$("#mpw").val('');
				}//end of if-else(NowPW == DBpw )
			}else{
				alert("현재 비밀번호를 입력하세요");
			}//end of if-else(NowPW !='' )
				
			
			
		})//end of updatePW
	
			
			
			
	});//end of ready()
</script>
</head>
<body>
	<div id ="full">
	<div id="sideBanner-mypage">
	<form id= "clickForm" name = "clickForm">
		<div align ="center">
		<br>
			<h1 style="color :  font-size: 30px;">마이페이지</h1>
			<hr>
		</div>
		<div class ="sideBox shadow">
<%-- 		<input type="hidden" id="mno" name ="mno" value="<%=mvo.getMno()%>">  --%>

			<%=mvo.getMname() %>님 
			<br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-user-cog "></i><input type ="button" id="pwCheck" class ="btn_light btn_box_01" value="개인정보 변경"><br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-key"></i><input type ="button" id="pwEdit" class ="btn_light btn_box_01" value="  비밀번호 변경"><br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-user-slash"></i><input type ="button" id="memOut" class ="btn_light btn_box_01" value=" 회원탈퇴"><br>
			
		<input type="hidden" id ="mid" name ="mid" value="<%=mvo.getMid()%>">
		</div>
		<div class ="sideBox shadow">
			즐겨찾기<br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-hand-pointer"></i><input type ="button" id="bookmark" class ="btn_light btn_box_01" value="  관심학원"><br>
		</div>
		<div class ="sideBox shadow">
			내 컨텐츠<br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-file-alt"></i><input type ="button" id="freeBoard" class ="btn_light btn_box_01" value="  내가 쓴 글"><br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-edit "></i><input type ="button" id="consultSearch" class ="btn_light btn_box_01" value="  작성한 상담"><br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-edit "></i><input type ="button" id="reviewBoard" class ="btn_light btn_box_01" value="  작성한 후기"><br>
		</div>
	</form>	
	</div>
	<div class = "container-mypage ">
		<div align="center">
			<form id="pwEditForm" name = "pwEditForm">
			<input type ="hidden" id="mno" name="mno" value="<%=mvo.getMno()%>">
			<input type ="hidden" id="mname" name="mname" value="<%=mvo.getMname()%>">
			<div id="mypage_subject">
			<br>	
			<br>	
				<h4 id="font_id">비밀번호 설정</h4>
				<hr>
			</div>
				<div class="container shadow"  id ="container_div">
				<br>
				<table class="table">
					<tr>
						<td>기존 비밀번호</td>
						<td>
							<div class="col-xs-9">
								<input class="form-control" type ="password" id="mpw" name="mpw"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>새로운 비밀번호</td>
						<td>
							<div class="col-xs-9">
								<input class="form-control" type ="password" id="mpw_new" name="mpw_new"/>
								<span id ="passCheck">*6자 이상 12자 이하</span>
							</div>
						</td>	
					</tr>
					<tr>
						<td>새로운 비밀번호 확인</td>
						<td>
							<div class="col-xs-9">
								<input class="form-control" type ="password" id="mpw_new_R" name="mpw_new_R"/>
							</div>
						</td>
					</tr>
				</div>
				<tr>						
				<td colspan=2 align="center">
					<input type="button" id="updatePW" class=" btn_light_bb btn_box_01_bb"  value="수정사항 저장" >
				</td>
			</tr>
				</table>
			</form>
<%		
	}
%>	
		</div>
	</div>
	</div>
	</div>
	<br>
	<br>
	<br>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>