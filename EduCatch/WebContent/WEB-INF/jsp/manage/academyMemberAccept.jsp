<%@page import="com.kosmo.educatch.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
	<%
		HttpSession hs = request.getSession(false);
		MemberVO mvo = null;
	    if(hs != null){
			mvo = (MemberVO)hs.getAttribute("user");
		}
	%>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>EduCatch</title>
        
	    <link rel="shortcut icon" href="/EduCatch/assets/img/favicon-96x96.png" type="image/x-icon">
		<link rel="icon" href="/EduCatch/assets/img/favicon-96x96.png" type="image/x-icon">
        <link href="/EduCatch/assets/css/manageStyles.css" rel="stylesheet" />
        <link href="/EduCatch/assets/css/media.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4-4.1.1/jq-3.3.1/dt-1.10.21/b-1.6.3/r-2.2.5/datatables.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <style type="text/css">
        	.sb-nav-link-icon{
        		height: 20px;
        		width: 20px;
        	}
        	.chkbtn{
        		padding-left:20px;
        	}
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp"><img alt="logo" src="assets/img/favicon-32x32.png"> EduCatch</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                            <a class="nav-link" href="manage.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <a class="nav-link" href="manageAca.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-tasks"></i></div>
                              	학원관리
                            </a>
                            <a class="nav-link" href="manageReserChk.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-check"></i></div>
                              	 상담예약 관리
                            </a>
                            <%
								if(mvo != null){
									if(mvo.getMauth().equals("3")){
					           			
				            %>
                            <a class="nav-link" href="manageAcaMem.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-check"></i></div>
                              	학원회원 승인
                            </a>
                            
                            <a class="nav-link" href="addAca.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-plus-square"></i></div>
                              	학원정보 등록
                            </a>
                            <%
									}
								}
                            %>
                            <a class="nav-link" href="logout.ec">
                                <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                                로그아웃
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">학원회원 승인</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">학원관리자로 등록한 회원들을 승인 할 수 있습니다. 거절시 해당 아이디는 삭제됩니다.</li>
                        </ol>
		                  <div class="col-md-12">  
		                  
		                  </div>
                  	</div>
                  	<div class="col-md-12">
                  	<div class="card mb-2">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                승인요청 목록
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="text-right container" style="margin-right:0px;">
		                    	<button class="btn btn-danger reject" style="margin-right:5px;"><i class="fas fa-eraser"></i> 거절</button>
		                    	<button class="btn btn-primary success"><i class="fas fa-edit"></i> 승인</button>
		                    </div>                             
		                    <table class="acceptTable table table-striped" id="memberAccept" >
		                      <thead align="center">
		                        <tr align="center">
		                          <th><label class="custom-control custom-checkbox ck-center"><input class="custom-control-input check chkAll chkbtn" type="checkbox"><span class="custom-control-label"></span></label></th>
		                          <th class="d-none d-xl-table-cell">아이디</th>
		                          <th>학원이름</th>
		                          <th>이름</th>
		                          <th class="d-none d-xl-table-cell">학원연락처</th>
		                          <th>이미지</th>
		                          <th class="d-none d-xl-table-cell">가입일</th>
		                          <th>mno</th>
		                        </tr>
		                      </thead>
		                    </table>
                                </div>
                            </div>
                        </div>
                        </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; EduCatch 2020</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/EduCatch/assets/js/manageScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4-4.1.1/jq-3.3.1/dt-1.10.21/b-1.6.3/r-2.2.5/datatables.min.js"></script>
       	<script type="text/javascript">
       	$(document).ready(function(){
       		ajaxGetAcademyMember();
       		
       		$('.success').on('click',function(){
       			var targetValue = $(this).parent().parent().children().find('.chk:checked').parents('tr');
       			if(targetValue.length == 0){
       				alert("항목을 선택하여 주세요.");
       				return;
       			}
       			var dataTable = $(this).parent().parent().find('.acceptTable').DataTable();
       			console.log('>>');
       			ajaxAcceptMember(targetValue, dataTable);
       		});
       		
       		$('.reject').on('click',function(){
     			var targetValue = $(this).parent().parent().children().find('.chk:checked').parents('tr');
         		if(targetValue.length == 0){
         			alert("항목을 선택하여 주세요.");
         			return;
         		}
       			if(confirm("정말 해당 정보를 거부하시겠습니까?\n(삭제가 됩니다)")){
           			var dataTable = $(this).parent().parent().find('.acceptTable').DataTable();
           			console.log('<<');
           			ajaxRejectMember(targetValue, dataTable);	
       			}else{
       				
       			}
       		});
       		
       		$('.chkAll').on('click',function(){
       			$('.chk').prop('checked', this.checked);
       		});
       		
       		$('.chk').on('change', function(){
       			$('.chkAll').prop('checked', false);
       		})
       	});
       	document.addEventListener("DOMContentLoaded", function(event) {
            // Datatables with Buttons
          var datatablesAcceptTable = $('.acceptTable').DataTable({
              scrollX: true,
              lengthChange: !1,
              searching: false,
              ordering: false,
              pageLength: 5,
              "language": {
                  "lengthMenu": "<h5 class='card-title'>회원정보</h5>",
                  "search": "검색:",
                  "zeroRecords": "요청중인 회원번호가 없습니다.",
                  "info": "총 _PAGES_페이지 중 _PAGE_페이지",
                  "infoEmpty": "",
                  "infoFiltered": "검색결과가 없습니다.",
                  "paginate":{
                    "next" : "다음",
                    "previous" : "이전"
                  }
              },
              "columns": [
                { "data": "체크","className": "text-center chkbtn", "width":"30px",},
                { "data": "아이디","className" : "text-center d-none d-xl-table-cell","width":"200px"},
                { "data": "학원이름", "className": "text-center","width":"240px"},
                { "data": "이름", "className": "text-center","width":"180px"},
                { "data": "학원연락처","className" : "text-center d-none d-xl-table-cell","width":"180px"},
                { "data": "이미지", "className": "text-center", "width":"270px"},
                { "data": "가입일", "className" : "text-center d-none d-xl-table-cell","width":"270px"},
                { "data": "mno", 'visible': false}
              ],
              "order": [[ 1, "desc" ]]
            });
          	/* datatablesAcceptTable.buttons().container().appendTo(".acceptTable.col-xl-12:eq(0)"); */
          });
       	
       	function ajaxGetAcademyMember(){
       		$.ajax({
       			url : "getAcaMem.ec",
       		}).done(function(resultParam){
       			var acceptTable = $('.acceptTable').DataTable();
       			/* acceptTable.clear().draw(); */
       			for(var index in resultParam.vo){
       				var dataParam = {
       						"체크" : '<label class="custom-control custom-checkbox ck-center"><input class="custom-control-input check chk" type="checkbox"><span class="custom-control-label"></span></label>',
       	       				"아이디" : resultParam.vo[index].mid,
       	       				"학원이름" : resultParam.vo[index].aname,
       	       				"이름" : resultParam.vo[index].mname,
       	       				"학원연락처" : resultParam.vo[index].atel,
       	       				"이미지" : resultParam.vo[index].mimg,
       	       				"가입일" : resultParam.vo[index].minsertdate,
       	       				"mno" : resultParam.vo[index].mno
       				};
       				acceptTable.row.add(dataParam).draw();
       			}
       		}).fail(function(resultParam){
       			alert("초기화에 문제가 발생하였습니다.");
       		});
       	}
       	
       	// 거절버튼 ajax
       	function ajaxRejectMember(targetValue, dataTable){
       		
       		var tdArr = new Array();
       		var tdRejectInfo = new Object();
       		$(targetValue).each(function(index){
       			tdRejectInfo.mno = dataTable.rows(targetValue).data()[index].mno;
       			tdArr.push(tdRejectInfo);
       			tdRejectInfo={};
       		})
       		
       		var rejectData = new Object;
       		rejectData.data = tdArr;
       		
       		var rejData = JSON.stringify(rejectData);
       		console.log(rejData);
       		$.ajax({
       			type : "DELETE",
       			url : "rejectAca.ec",
       			data : rejData,
       			dataType : "json"
       		}).done(function(resultParam){
       			if(resultParam.result == "success"){
       				alert('정상적으로 거절되었습니다.');	
       			}else{
       				alert('일부 데이터에 문제가 있습니다.');
       			}
       			dataTable.clear().draw();
       			ajaxGetAcademyMember();
       		}).fail(function(resultParam){
       			alert("연결에 문제가 발생하였습니다.");
       		});
       	}
       	
       	
       	//승인버튼 ajax
		function ajaxAcceptMember(targetValue, dataTable){
       		
       		var tdArr = new Array();
       		var tdAcceptInfo = new Object();
       		$(targetValue).each(function(index){
       			tdAcceptInfo.mno = dataTable.rows(targetValue).data()[index].mno;
       			tdArr.push(tdAcceptInfo);
       			tdAcceptInfo={};
       		})
       		
       		var acceptData = new Object();
       		acceptData.data = tdArr;
       		
       		var accData = JSON.stringify(acceptData);
       		console.log(accData);
       		
       		$.ajax({
       			type : "PUT",
       			url : "acceptAca.ec",
       			data : accData,
       			dataType : "json"
       		}).done(function(resultParam){
       			if(resultParam.result == "success"){
       				alert('정상적으로 승인되었습니다.');	
       			}else{
       				alert('일부 데이터에 문제가 있습니다.');
       			}
       			dataTable.clear().draw();
       			ajaxGetAcademyMember();
       		}).fail(function(resultParam){
       			alert("연결에 문제가 발생하였습니다.");
       		});
       	}
       	
       	</script>
    </body>
</html>