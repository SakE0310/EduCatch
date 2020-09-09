<%@page import="com.kosmo.educatch.vo.PagingVO"%>
<%@page import="com.kosmo.educatch.vo.ReviewVO"%>
<%@page import="com.kosmo.educatch.vo.AcademyVO"%>
<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="../../../../top.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>
</head>

<title>후기 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 데이터피커 -->
<link rel="stylesheet" href="/EduCatch/assets/datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/EduCatch/assets/datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/EduCatch/assets/datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>

<!-- 날짜 형식변환 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<style type="text/css">
	/*미디어 쿼리*/
	/* Mobile Device (가로폭 767px 이하) */
	@media all and (max-width:767px) {
		thead {
			display: none;
		}
		.nice-select{
		    width: 50px;
		    height: 35px;
		    padding-left: 0px;
		}
		#keyword{
			width: 90px;
			height: 32px;
		}
		.btn_light {
		  height: 30px;
		}
		.gj-textbox-md{
			width: 100px;
    		height: 40px;
    		
		}
		
		.gj-datepicker-md [role="right-icon"] {
		    position: absolute;
		    left: 5px;
		    top: 10px;
		    font-size: 24px;
		}
		#b{
			width: 300px;
		}
		#nfont{
			display: none;
		}
		#mfont{
			font-size: 30px;
		}
		#media_mobile{
			width: 330px;
    		height: 130px;
		}
		 #keyword{
			width:96px; 
		}
		.gj-textbox-md {
			width: 100px;
			font-size: 10px;
		}
		.media_mobile_td{
			display: table-column-group;
		}
		.media_mobile_td_font{
			font-size: 13px;
		}
		#pageForm_div{
	    padding: 0px;
		}
		#pageForm{
	 	padding-bottom: 300px;
	 }	
	 
/*★*/	 .nice-select .option {
	    padding-left: 11px;
	    padding-right: 11px;
   	 }
   	 #count{
   	 display:  none;}
	}
	

	
	/* Tablet (가로폭 768px 이상, 1023px 이하) */
	@media all and (min-width:768px) and (max-width:1023px) {
	
	/* 브라우저 가로폭이 768~1023px일때 적용될 css (태블릿) */
	#media_mobile{
	 	width: 680px;
    	height: 192px;
	 }
	 
	 #keyword{
			width:200px; 
	}
	.gj-textbox-md {
			width: 130px;
			font-size: 15px;
		}
	#nfont{
			display: none;
		}
	#mfont{
			font-size: 50px;
		}
	.nice-select{
	    width: 60px;
    	height: 35px;
	    padding-left: 10px;
	}
	#pageForm{
	 	padding-bottom: 270px;
	 }	
	 
	#table_size{
	 width: 700px;
	 } 
	}
	
	/* PC Desktop (가로폭 1024 이상) */
	@media all and (min-width:1024px) {
	
		body {
		}
		#media_mobile{
			width: 700px;
		}
		
		#b{
			width: 700px;
		}
		.nice-select{
		    width: 70px;
		    height: 35px;
		    padding-left: 0px;
		}
		 #media_mobile{
	 	width: 1140px;
  /*★*/ height: 180px;
	 	margin: auto;
	 }
	 	#mfont{
	 	display: none;
	 }
	 #keyword{
			width:200px; 
	}
	.gj-textbox-md {
			width: 130px;
			font-size: 15px;
		
	}
	#pageForm_div{
	    margin-bottom: 154px;
	}
	#pageForm{
	 	padding-bottom: 216px;
	 }	
	 
	 /*★*/.nice-select .option {
    padding-right: 25px;
    }
	}	
	/* --------------------------------------------- */

	#table_head{
		border-collapse: collapse;
		background-color: #21146b;
	}
	.btn_light {
	    display: inline-block;
	    text-align: center;
	    background: #21146b;
	    color: #ffffff;
	    vertical-align: middle;
	    cursor: pointer;
	    border: 1px solid #140C40;
	    height: 30px;
	    font-size: 15px;
	     border-radius: 0.5em;
		}
	.btn_box_01 {
	    width: auto;
	    padding: 3px 10px;
	}	
	.bbs-link-btm {
	    float: right;
	    margin: 20px 0px 0;
	    text-align: left;
	   
	}
	.bbs-link {
   	 position: relative;
	}
	
	#sForm{
    width: 350px;
  	height: 100px;
  	margin: auto;
	}
	#row-magin{
		margin-bottom: 185px;
	}	
	
	 #nfont, #mfont{
	 	font-family: 'Do Hyeon', sans-serif;
	  }
		
	#mainWrapper{
		font-family: 'Gothic A1', sans-serif;
	} 	
	.table_head_font{
		font-family: 'Do Hyeon', sans-serif;
		color:white;
	}
	
	#keyword{
			height:32px;
			border: 1px solid #140C40;
			 border-radius: 0.5em;
		}
		
	/*데이트 피커*/
	.gj-textbox-md{ 
		border: 1px solid #140C40;
		height: 30px;
	}
	
	.gj-icon {
	    color: #140C40;
	    margin-left: 7px;
	}
		
	.gj-textbox-md {
   			height: 30px;
		}
	.gj-datepicker-md [role="right-icon"] {
	    left: 3px;
   		top: 3px;
  	 }
   		 
	
	 #c{
	 	height: 10px;
	 }
	  #h3_margin{
	 	margin-top: 2px;
	 }
	  #media_mobile_td_margin{
	 	padding-left: 0px;
	 	padding-top: 13px;
	 }
	 li{
	 	font-size: 16px;
	 }
	 /*---------------------------------*/
	 
	 a{
	 	color: black;
	 }
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

     
     $(document).ready(function() {
        
 		//날짜 검색  
   	  $("#startDate").datepicker({
   			showOn: "button",
   	        buttonImage: "images/calendar.gif",
   		    buttonImageOnly: false,
   			buttonText: "Select date",
   			dateFormat : 'yy-mm-dd'
   			
   		});
 		
   	$("#startDate").focus(function(event){
        var dim = $(this).offset();
        $("#ui-datepicker-div").offset({
            top     :   dim.top - 180,
            left    :   dim.left + 150
        });
    });
      
      $("#endDate").datepicker({
         showOn: "button",
         buttonImage: "images/calendar.gif",
         buttonImageOnly: false,
         buttonText: "Select date",
         dateFormat : 'yy-mm-dd'
      });
      
      $("#searchPiker").click(function() {
         console.log("날짜 검색버튼 누름");
         
         var startVal = document.searchForm.startDate.value;
         var endVal = document.searchForm.endDate.value;
         
         console.log("startVal>>>"+startVal);
         console.log("endVal>>>"+endVal);
         
         startVal = moment(startVal).format("YYYY-MM-DD");
         endVal = moment(endVal).format("YYYY-MM-DD");
         console.log("startVal_1>>>"+startVal);
         console.log("endVal_1>>>"+endVal);
         
         $("#startDate").val(startVal);
         $("#endDate").val(endVal);
         
         if(startVal == ""){
              alert("시작일이 입력되지 않았습니다.\n시작일을 먼저 입력해주세요");
         }
         
         if(startVal > endVal){
             alert("종료일이 시작일보다 이 전 일수는 없습니다.\n다시 선택하여 주시기 바랍니다.");
         }
         
         $("#searchForm").attr("action","searchList.ec");
         $("#searchForm").attr("method","POST");
         $("#searchForm").submit();
         
      })//end of searchPiker
      
      //검색버튼을 누르면 실행
      $("#searchData").click(function() {
         console.log("검색버튼 누름");
         var sVal = document.pageForm.searchFilter.options[document.pageForm.searchFilter.selectedIndex].value;
         console.log("sVal>>>"+sVal);
          
         $("#pageForm").attr("action","searchList.ec");
         $("#pageForm").attr("method","POST");
         $("#pageForm").submit();

      })//end of searchData
        
        
      //글쓰기 버튼 눌렀을 때 실행
      $("#insertPage").click(function() {
         console.log("insertPage >>> ");
         //글쓰기 에디터 화면으로 이동
         $("#pageForm").attr("action","insertDisplay.ec");
         $("#pageForm").attr("method","POST");
         $("#pageForm").submit();   
      })
     });

</script>
<body>
<%


   String pagesize="0";
   String groupsize="0";
   String curpage="0";
   String totalcount="0";


   Object obj=request.getAttribute("searchList");
   
	HttpSession hs = request.getSession(false);
	MemberVO mvo = null;
	if(hs != null){
		mvo = (MemberVO)hs.getAttribute("user");
	}

   if(obj !=null){
      ArrayList searchList=(ArrayList)obj;
      
      int nCnt=searchList.size();
   
%>
	<div id="mainWrapper" align = "center">
		<div  id="media_mobile" >
		<form id="searchForm" name="searchForm">
			<table border="0" cellpadding="1" cellspacing="1"  align="center" id="table_size">
			<tr>	
				<td align="center" id = "mfont">후기 게시판</h4>
				<br>
				<br>
				</td>
			</tr>
			<tr>
			 <!-- ★ --><td width="1200" align="center" id = "nfont" colspan="2"><br><h1>후기 게시판</h1>
			 <br>
				<br></td>
			
			</tr>
			<tr style="width: 1140px;">
			 <td  align="left" id="count">
			 <br>
<%
if(nCnt !=0){
		ReviewVO rvo1=(ReviewVO)searchList.get(0);
		String count =rvo1.getTotalcount(); 
%>
		      	총 <%=count %>개의 게시물이 있습니다
<%
	}else{
%>
		총 0개의 게시물이 있습니다
<% 
	}
%>
		      </td> 
				<td width="360" align="right">
		         <div class="row" id="c" style="padding-right: 0px;">
		        &nbsp;&nbsp;&nbsp;
		            <div class="col-md-1.8" align="right">
						<input type="text" name="startDate" id="startDate">
		            </div>
		             <h3 id="h3_margin"> &nbsp;&nbsp;- &nbsp;</h3>	
		            <div class="col-md-1.5" align="right">
	      		 		<input type="text" name="endDate" id="endDate"> 
		            </div>
	      				  &nbsp;&nbsp; <input type="button" id="searchPiker" value="검색"
	      				  				class=" btn_light btn_box_01">	  
		      	</div>
				</td>
			</tr>
			</table>
		</form>
	</div>

	<form id="pageForm" name="pageForm">
      <input type="hidden" id="rbno" name="rbno"/>
	  <div  class="container" style="height: 390px; ">
      	<table align="center" class="table">
         <colgroup>
	            <col width="120px"/>
	            <col width="400px"/>
	            <col width="600px"/>
	            <col width="150px"/>
	            <col width="120px"/>
         </colgroup>
         <thead id="table_head">   
            <tr>
               <td align="center" class ="table_head_font">글번호</td>
               <td align="center" class ="table_head_font">학원명</td>
               <td align="center" class ="table_head_font">제목</td>
               <td align="center" class ="table_head_font">작성자</td>
               <td align="center" class ="table_head_font">날짜</td>
            </tr>
         </thead>
         <tbody>
<%
	if(searchList !=null && nCnt>0){
	      for(int i=0; i<nCnt; i++){
	         ReviewVO rvo=(ReviewVO)searchList.get(i);
	
	         pagesize=rvo.getPagesize();
	         groupsize=rvo.getGroupsize();
	         curpage=rvo.getCurpage();
	         totalcount=rvo.getTotalcount();
	         
	
	         System.out.println("rvo.getPno()"+rvo.getPagesize());
	         System.out.println("rvo.getGroupsize()"+rvo.getGroupsize());
	         System.out.println("rvo.getCurpage()"+rvo.getCurpage());
	         System.out.println("rvo.getTotalcount()"+rvo.getTotalcount());

      
%>

               <tr align="center">
                  <td class=" media_mobile_td"><%= rvo.getRbno() %></td>
                  <td class="media_mobile_td_font"><%= rvo.getAname() %>
                  <input type="hidden" id="aname" name="aname" value="<%= rvo.getAname()%>"/></td>
                  <td class="media_mobile_td_font" align="left" style="padding-left: 40px;">
                  <a href="selectReview.ec?rbno=<%= rvo.getRbno() %>"  id="aa"><%= rvo.getRbsubject() %></a></td>
                  <td class="media_mobile_td_font"><%= rvo.getRbname() %></td>
                  <td class=" media_mobile_td"><%= rvo.getRbinsertdate() %></td>
               </tr>
<%
      }
   }else{
%>
               <tr>
                  <td colspan="7" align="center">
                  		조회된 게시물이 없습니다.
                  </td>
               </tr>
<%
      }

	  if(searchList !=null && nCnt>0){
%>         

         <tr>
         <td colspan="5">
         <jsp:include page="memberPaging.jsp" flush="true">
            <jsp:param name="url" value="searchList.ec"/>
            <jsp:param name="str" value=""/>
               <jsp:param name="pagesize" value="<%= pagesize %>"/>
               <jsp:param name="groupsize" value="<%= groupsize %>"/>
               <jsp:param name="curpage" value="<%= curpage %>"/>
               <jsp:param name="totalcount" value="<%= totalcount %>"/>      
         </jsp:include>
         </td>
         </tr>
<%		
		}//end of (list !=null && nCnt>0)
	}//end of if(obj)
		
%>
	<tr id ="media_mobile_tr">
		<td colspan="3" align="left"  id ="media_mobile_td_margin" >
         <select name="searchFilter" id ="searchFilter">
            <option value="제목">제목</option>
            <option value="내용">내용</option>
         </select>
         <input type="text" name="keyword" id = "keyword">
         <input type="button" class=" btn_light btn_box_01" id="searchData" value="검색">
		</td>

<%
		if(mvo != null){
			if( mvo.getMauth().equals("1") || mvo.getMauth().equals("3")){
%>

			<td colspan="2" align="right">
               <input type="button" value="글쓰기" id="insertPage" 
                class=" btn_light btn_box_01"/>
			</td>
<%	
						}
					}
%>
		</tr>
      	</tbody>
      	</table>
   </div>
</form>
</div>
	<jsp:include page="../../../../footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>