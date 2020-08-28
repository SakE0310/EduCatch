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
		});//end of myPageMemUpdate
		
		//=====비밀번호 변경 버튼 누르면 실행
		$("#pwEdit").click(function() {
			console.log("비밀번호 변경 버튼 누름");
			
			$("#clickForm").attr("action","editPW.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		});
		
		$("#consultSearch").click(function() {
			console.log("학원문의 변경 버튼 누름");
			
			$("#clickForm").attr("action","consultQuestion.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit(); 
		});
		
		$("#freeBoard").click(function() {
			console.log("freeBoard >>> ");
		
			$("#clickForm").attr("action","myFree.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();	
		});
		
		$("#reviewBoard").click(function() {
			console.log("reviewBoard >>> ");
		
			$("#clickForm").attr("action","myReview.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();	
		});
		
		$("#memOut").click(function() {
			console.log("회원탈라라ㅏ라라 >>> ");
		
			$("#clickForm").attr("action","mypageOut.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();
		});
		
		$("#bookmark").click(function() {
			console.log("찜목록 >>> ");

			$("#clickForm").attr("action","listBookmark.ec");
			$("#clickForm").attr("method","POST");
			$("#clickForm").submit();
		});
	});
		
<%
	Object obj = request.getAttribute("memberVO");

	if(obj != null){
		MemberVO mvo = (MemberVO)obj;
		
		/* String NowPW = mvo.getMpw();
		System.out.println("NowPW>>>"+NowPW);//1234 */
		
%>
//회원탈퇴 버튼 클릭
$(document).ready(function() {
	var clickYN =0;
	$("#checkpw").click(function(){
		console.log("확인버튼 클릭");
	
		var DBpw = "<%= mvo.getMpw()%>";
		console.log(">>>"+DBpw);
		var pass = $("#mpw").val();
	
		if(pass !=""){
			if(pass == DBpw){
				alert("비밀번호 일치");
				clickYN =1;
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				$("#mpw").val('');
				clickYN=0;
			}
		}else{
			alert("비밀번호를 입력하세요");
		}
	
	});

	$("#memberOut").click(function(){
		console.log("회원탈퇴버튼 클릭");
		console.log("clickYN>>"+clickYN);
		if(clickYN==1){
			$("#pwOutForm").attr("action","memberout.ec");
			$("#pwOutForm").attr("method","POST");
			$("#pwOutForm").submit(); 
		}else{
			alert("비밀번호 확인 버튼을 눌러주세요");
		}

		});
	
	});

</script>
</head>
<body>
	<div id ="full">
	<div id="sideBanner-mypage">
	<form id= "clickForm" name = "clickForm">
		<div align ="center">
		<br>
			<h1 style="color : font-size: 30px;">마이페이지</h1>
			<hr>
		</div>
		<div class ="sideBox shadow" >
			<%=mvo.getMname() %>님 
			 <br>
	         &nbsp;&nbsp;&nbsp;<i class="fas fa-user-cog"></i><input type ="button" id="pwCheck" class ="btn_light btn_box_01" value="개인정보 변경"><br>
	         &nbsp;&nbsp;&nbsp;<i class="fas fa-key"></i><input type ="button" id="pwEdit" class ="btn_light btn_box_01" value=" 비밀번호 변경"><br>
	         &nbsp;&nbsp;&nbsp;<i class="fas fa-user-slash"></i><input type ="button" id="memOut" class ="btn_light btn_box_01" value="회원탈퇴"><br>
        
		<input type="hidden" id ="mid" name ="mid" value="<%=mvo.getMid()%>">
		</div>
		<div class ="sideBox shadow">
			즐겨찾기<br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-hand-pointer"></i><input type ="button" id="bookmark" class ="btn_light btn_box_01" value="  관심학원"><br>
		</div>
		<div class ="sideBox shadow">
			내 컨텐츠<br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-file-alt"></i><input type ="button" id="freeboard" class ="btn_light btn_box_01" value="  내가 쓴 글"><br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-edit "></i><input type ="button" id="consultSearch" class ="btn_light btn_box_01" value=" 작성한 상담"><br>
			&nbsp;&nbsp;&nbsp;<i class="fas fa-edit "></i><input type ="button" id="reviewboard" class ="btn_light btn_box_01" value=" 작성한 후기"><br>
		</div>
	</form>	
	</div>
	<div class = "container-mypage ">
		<div align="center">
			<form id="pwOutForm" name = "pwOutForm">
			<input type ="hidden" id="mno" name="mno" value="<%=mvo.getMno()%>">
			<input type ="hidden" id="mname" name="mname" value="<%=mvo.getMname()%>">
			<div id="mypage_subject">
			<br>
			<br>
				<h4 id="font_id">회원 탈퇴</h4>	
				<hr>
			<div class="container shadow" id ="container_div">
			<br>
				<table class="table">
					
					<tr>
						<td>아이디</td>
						<td>
							<div class="col-xs-7">
								<input type ="text" class="form-control" id="mid" name="mid" value="<%=mvo.getMid() %>" />
							</div>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<div class="col-xs-7">
								<input type ="password" class="form-control" id="mpw" name="mpw"/>
							</div>
							<div class="col-xs-3">
							<input type ="button" class="form-control" id="checkpw" name="checkpw" value="확인"/>
							</div>
						</td>
					</tr>
				<tr>						
				<td colspan=2 align="center">
					<input type="button" id="memberOut" name="memberOut" class=" btn_light_bb btn_box_01_bb" value="회원탈퇴" >
				</td>
			</tr>
				</table>
				</div>
				</div>
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