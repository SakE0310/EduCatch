<%@page import="com.kosmo.educatch.vo.FreeVO"%>
<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
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

<!-- 주소  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
  		 .container-mypage {
		   display: none;
		    }
		   #mypage_edit{
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
      font-size: 25px;
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
	.required{
   	color: red;
   }
   .nice-select {
    line-height: 33px;
    }
    li{
    font-size: 13px;
    }
    #mypageMain{
      text-decoration :none; 
    }
</style>
<script type="text/javascript">
$(document).ready(function() {
   
   //==사이드바=============================================
   //======프로필 수정버튼을 누르면 실행 -> 비밀번호 확인 창
   $("#pwCheck").click(function() {
      console.log("프로필 수정버튼 누름");
  	$("#clickForm").attr("action","listMyPage.ec");
	$("#clickForm").attr("method","POST");
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
      console.log("찜목록 >>>");

      $("#clickForm").attr("action","listBookmark.ec");
      $("#clickForm").attr("method","POST");
      $("#clickForm").submit();
   })
   //==========================================================
	$('#mypage_edit').hide();
   
   $("#checkPW").click(function() {
	   console.log("비밀번호 변경버튼 누름 >>>");
		var setPassword = $("#mpw").val();
		console.log("setPassword>>>"+setPassword);
	    ajaxGetMypageEdit(setPassword);
	});
   $("#checkPW").keyup(function(event) {
	   if(event.keyCode==13) {
		   $("#checkPW").click();
	   }
	});
   
		   
	 function ajaxGetMypageEdit(setPassword) {
		urls = "checkPW.ec";
		datas = {"mpw" : setPassword};
		console.log("urls>>>"+urls);
		console.log("data>>>"+datas);
		
		$.ajax({
			url : urls,
			data : datas
		}).done(function(resParam) {
			console.log(resParam);
			if(resParam == "YES"){
				console.log("비밀번호 일치");
				$('#mypage_edit').show();
				$('#mypage_pw').hide();
				
			}else{
				console.log("비밀번호 불일치");
				alert("비밀번호가 틀렸습니다.");
				$("#mpw").val('');
			}
			
		}).fail(function(resParam) {
			alert('에러');
		})
		
	}//ajaxGetMypageEdit 
	
	 var tel = document.getElementById("tel").value;
		console.log("tel>>>"+tel);
		tel = tel.split('-');
		document.getElementById("mtel1").value=tel[0];
		document.getElementById("mtel2").value=tel[1];
		document.getElementById("mtel3").value=tel[2];
		
		console.log("tel[0]>>>"+tel[0]);
		console.log("tel[1]>>>"+tel[1]);
		console.log("tel[2]>>>"+tel[2]);
		
		var tel_1 =tel[0];
		console.log("tel_1>>>"+tel_1);

		//주소
		$("#addrCheck").click(function() {
			console.log("addrCheck함수 들어옴");
			var width=500;
			var height=600;
			
			new daum.Postcode({
		        oncomplete: function(data) {
		        	console.log("다음 API");
		        	console.log("우편번호 >>> : " + data.zonecode);
					console.log("주소값 >>> : " + data.roadAddress);
					console.log("빌딩값 >>> : " + data.buildingName);
		        	
		        	document.getElementById('maddrno').value=data.zonecode;
					document.getElementById('maddr1').value=data.roadAddress;
					document.getElementById('maddr2').value=data.buildingName;
		        }
		    }).open({
		    	left: (window.screen.width / 2) - (width / 2),
				top: (window.screen.height / 2) - (height / 2), 
		    	
		    });
		})//end of addrCheck()
		 
		 $("#mypageEdit").click(function() {
		console.log("수정버튼 누름");
		
		//이름
		if(document.mypageEditForm.mname.value==''){
			alert("이름을 입력하세요");
			$("#mname").focus();
			return false;
		}else{
			var exp= /^[가-힣]{2,4}$/;
			
			if(!exp.test(document.mypageEditForm.mname.value)){
				alert("이름 오류- 한글로 입력");
				$("#mname").focus();
				return false;
			}
			$("#mte1").focus();
		}//end of if(mname)
		
			
		//핸드폰	
		var tel1 = 	$("#mtel1").val();
		var tel2 = 	$("#mtel2").val();
		var tel3 = 	$("#mtel3").val();
		
		var telT = tel1+"-"+tel2+"-"+tel3;
		console.log("telT>>>"+telT);
			
		if(telT.length == 0){
			alert("핸드폰 번호를 입력하세요");
			$("#mtel1").focus();
			return false;
		}else{
			var exp = /^\d{3}\-\d{4}\-\d{4}$/;
			if (!exp.test(telT)) {
				alert("핸드폰 번호 오류 - 000-0000-0000 형식");
				$("#mtel1").focus();
				return false;
			}
		}//end of phone	
			
		//주소
		if(document.mypageEditForm.maddrno.value.length==0){
			alert("주소를 입력하세요");
			$("#maddrno").focus();
			return false;
		}//end of addr	
		
		alert("수정");
		$("#mypageEditForm").attr("action","editMyPage.ec");
		$("#mypageEditForm").attr("method","POST");
		$("#mypageEditForm").submit();
			
	})//end of mypageEdit
      
});//end of ready()

</script>
</head>
<body>
<%
   Object obj = request.getAttribute("MemberVO");

      HttpSession hs = request.getSession(false);
      MemberVO mvo = null;
      if(hs != null){
         mvo = (MemberVO)hs.getAttribute("user");
      }   

   if(obj != null){
%>
<div id ="full">
   <div id="sideBanner-mypage">
   <form id= "clickForm" name = "clickForm">
      <div align ="center">
      <br>
         <h1 style="color : ; font-size: 30px;"><a href="listMyPage.ec" id="mypageMain">마이페이지</a></h1>
         <hr>
      </div>
      <div class ="sideBox shadow">
         <%=mvo.getMname() %>님 
         <br>
         &nbsp;&nbsp;&nbsp;<i class="fas fa-user-cog"></i><input type ="button" id="pwCheck" class ="btn_light btn_box_01" value="개인정보 변경"><br>
         &nbsp;&nbsp;&nbsp;<i class="fas fa-key"></i><input type ="button" id="pwEdit" class ="btn_light btn_box_01" value=" 비밀번호 변경"><br>
         &nbsp;&nbsp;&nbsp;<i class="fas fa-user-slash"></i><input type ="button" id="memOut" class ="btn_light btn_box_01" value="회원탈퇴"><br>
      </div>
      <div class ="sideBox shadow">
         즐겨찾기<br>
         &nbsp;&nbsp;&nbsp;<i class="fas fa-hand-pointer"></i><input type ="button" id="bookmark" class ="btn_light btn_box_01" value=" 관심학원"><br>
      </div>
      <div class ="sideBox shadow">
         내 컨텐츠<br>
         &nbsp;&nbsp;&nbsp;<i class="fas fa-file-alt "></i><input type ="button" id="freeBoard" class ="btn_light btn_box_01" value="  내가 쓴 글"><br>
         &nbsp;&nbsp;&nbsp;<i class="fas fa-edit"></i><input type ="button" id="consultSearch" class ="btn_light btn_box_01" value=" 작성한 상담"><br>
         &nbsp;&nbsp;&nbsp;<i class="fas fa-edit "></i><input type ="button" id="reviewBoard" class ="btn_light btn_box_01" value=" 작성한 후기"><br>
      </div>

   </div>
    </form> 
   <div class = "container-mypage " id = "mypage_pw">
      <div align="center">
      <div id="mypage_subject">
      <br>
      <br>
         <h4 id ="font_id">개인정보 변경 </h4>
         <hr>
      </div>
      <div class="container shadow"  id ="container_div">
      <br>
         <table align ="center" class="table">
			<tr>
				<td>아이디</td>
				<td>
					<div class="col-xs-7">
						<input type ="text" class="form-control" id="mid" name="mid" value="<%=mvo.getMid() %>" readOnly/>
					</div>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<div class="col-xs-7">
						<input type ="password" class="form-control" id="mpw" name="mpw"/>
					</div>
				</td>
			</tr>
			<tr>						
			<td colspan=2 align="center">
			<input type="button" value="확인" id ="checkPW" class=" btn_light_bb btn_box_01_bb">
			</td>
			</tr>
            </table>
         </div>
      </div>
   </div>
  
    

   <div class = "container-mypage" id="mypage_edit">
		<div align="center">
		<div id="mypage_subject">
		<br>
		<br>
			<h4 id="font_id">개인정보 변경 </h4>
			<hr>
		</div>
		<div class="container shadow" id ="container_div">
		<br>
		<form id="mypageEditForm" name="mypageEditForm">
		<input type="hidden" id="mno" name="mno" value="<%=mvo.getMno()%>">
			<table  class="table">
				<tr>
				<td>
					<div class="col-xs-7" align="left">
						<label>아이디</label>
						<input  class="form-control" type="text" id="mid" name="mid" value="<%=mvo.getMid() %>" readOnly/>
						<br>
					</div>
					</td>
					
				</tr>
				<tr>
					<td>
					<div class="col-xs-7" align="left">
						<label><span class="required">*</span>이름</label>
						<input class="form-control" type="text" id="mname" name="mname" value="<%=mvo.getMname() %>"/></br>
					</div>
					</td>
				</tr>
				<tr>
<%
			String mtel1 = mvo.getMtel();
			System.out.println("mtel1>>>"+mtel1);
			String[] phone = mtel1.split("-");
			String ret1 = phone[0];
			String ret2 = phone[1];
			String ret3 = phone[2];
			
			System.out.println("ret1>>>"+ret1);
			System.out.println("ret2>>>"+ret2);
			System.out.println("ret3>>>"+ret3);
%>				
				<td style="padding-left: 20px">
				&nbsp;<label><span class="required">*</span>&nbsp;핸드폰</label><br>
				<input type ="hidden" id="tel" value="<%=mvo.getMtel()%>">
					&nbsp;&nbsp;<select id="mtel1" name="mtel1">
						<option value="010"<%if(ret1.equals("010")){%>selected="selected"<%} %> >010</option>
						<option value="017"<%if(ret1.equals("017")){%>selected="selected"<%} %>>017</option>
						<option value="016"<%if(ret1.equals("016")){%>selected="selected"<%} %>>016</option>
					</select> 
					<div class="col-xs-3" >
						 <input class="form-control" type="text" id="mtel2" name="mtel2"/>
					</div> 
					<div class="col-xs-3" >
						 <input class="form-control" type="text" id="mtel3" name="mtel3"/>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					 <div class="col-xs-11">
				<label><span class="required">*</span>주소</label><br>
					<div class="col-xs-6" style="padding-left : 0px;">
					<input  class="form-control"  type="text" id="maddrno" name="maddrno" size=6 value="<%= mvo.getMaddrno()%>"/>
					</div>
					 <input type="button" value="우편번호 찾기" id="addrCheck" class=" btn_light_bb btn_box_01_bb"/>&nbsp;&nbsp;(도로명주소)<br>
					 <br>
					 <input  class="form-control" type="text" id="maddr1" name="maddr1" size=35 value="<%=mvo.getMaddr1() %>" /><br>							 
					 <input class="form-control" type="text" id="maddr2" name="maddr2" size=35 value="<%=mvo.getMaddr2() %>" /><br>
					</div>
				</td>
			</tr>
			</div>
			<tr>						
				<td colspan=2 align="center">
					<input type="button" id="mypageEdit" class=" btn_light_bb btn_box_01_bb" value="수정" >
				</td>
			</tr>
<%		
	}
%>	
			</table>
		</form>
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