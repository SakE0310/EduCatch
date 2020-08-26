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
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <style type="text/css">
        	.sb-nav-link-icon{
        		height: 20px;
        		width: 20px;
        	}
        </style>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
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
                        <h1 class="mt-4">대시보드</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">여러 통계를 확인할 수 있습니다.</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
	           <%
	           	if(mvo != null){
	           		if(mvo.getMauth().equals("3")){
	           			
               %>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        가입유형
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
               <%
                        }
	           		} 
	           %>
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
        <script type="text/javascript">
        	$(document).ready(function(){
        		<%
	        		if(mvo != null){
		           		if(mvo.getMauth().equals("3")){
        		%>
        			console.log('33');
        		<%
		           		}
		           	}
        		%>
        	});
        </script>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/EduCatch/assets/js/manageScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>