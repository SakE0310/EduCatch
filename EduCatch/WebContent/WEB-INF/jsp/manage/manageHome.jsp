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
        	.mb-4, .my-4 {
			    margin-bottom: 0.5rem !important;
			}
			.list{
				margin-bottom: 0.5rem !important;
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
                        <%
						if(mvo != null){
							if(mvo.getMauth().equals("3")){
			           			
		            %>
					<div class="col-md-12 list">
					<select name="district" id="district">
						<option value="서울" selected>서울</option>
						<option value="경기도">경기도</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종특별자치시">세종특별자치시</option>
						<option value="제주특별자치도">제주특별자치도</option>
					</select>
					<select name="city" id="city">
					</select>
					<select name="academy" id="academy">
					</select>
					</div>
					<div></div>
					<% 
							}
						}
					%>
					<input type="hidden" id="acano" value="<%=mvo.getAcademy_ano() %>">
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        월별 평점
                                    </div>
                                    <div class="card-body"><canvas id="graChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                       	상담현황
                                    </div>
                                    <div class="card-body"><canvas id="conChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
	           <%
	           	if(mvo != null){
	           		if(mvo.getMauth().equals("3")){
	           			
               %>
               <hr />
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
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        학원 등록상태
                                    </div>
                                    <div class="card-body"><canvas id="acaStatus" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        게시글 개수
                                    </div>
                                    <div class="card-body"><canvas id="postCnt" width="100%" height="40"></canvas></div>
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
        var ctx;
        var acaStatChart;
        var postCntChart;
        var conChart;
        var graChart;
        document.addEventListener("DOMContentLoaded", function(event) {
        	<%
	    		if(mvo != null){
	           		if(mvo.getMauth().equals("3")){
			%>
			
			$('#district').on('change',function(){
	        	ajaxGetCity($('#district').val());
	        })
	        $('#city').on('change',function(){
	        	ajaxGetAcaList();
	        })
	        $('#academy').on('change',function(){
	        	$('#acano').val($('#academy').val());
	        	ajaxGetMonCnt();
	        })
	        
	        ajaxGetCity($('#district').val());
			function ajaxGetCity(param){
				console.log("ajaxGetCity param(setDistrict) >>> "+param);
				urls = "getCity.ec"; //controller 지역 소분류
				datas = {"district" : param}; //param = 서울
				$.ajax({
					url : urls,
					data : datas
				}).done(function(resParam){
					console.log("ajaxGetCity resParam >>> "+resParam);
					var st = "";
					for(i in resParam.cityList){
						var city = resParam.cityList[i].city; //강남 강북
						st += "<option value='"+city+"'>"+city+"</option>\n";
					}
					$('#city').html(st);
					console.log("ajaxGetCity end >>>");
					ajaxGetAcaList();
				}).fail(function(resParam){
					alert("에러");
				});
			}
			
			function ajaxGetAcaList(){
				var district = $('#district').val();
				var city = $('#city').val();
				$.ajax({
					url : "getAcaListManage.ec",
					data : {"district" : district,
       						"city" : city},
     			dataType : "json"
				}).done(function(result){
					var st ="";
					console.log("success");
					for(i in result.acaList){
						var name = result.acaList[i].aname;
						var ano  = result.acaList[i].ano;
						if(i==0){
							$('#acano').val(ano);
						}
						st += "<option value='"+ano+"'>" +name+"</option>\n"
					}
					$('#academy').html(st);
					ajaxGetMonCnt();
				}).fail(function(result){
					console.log("fail");
				})
			}	
			
			
				ctx = new Chart(document.getElementById("myPieChart"), {
		          type: 'pie',
		          data: {
		            labels: ["Blue", "Red", "Yellow", "Green"],
		            datasets: [{
		              data: [12.21, 15.58, 11.25, 8.32],
		              backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
		            }],
		          },
		          options: {
		        	  tooltips: {
		      	        callbacks: {
		      	          label: function(tooltipItem, data) {
		      	        	  
	      	        	  var dataset = data.datasets[tooltipItem.datasetIndex];
		      	          var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
		      	            return previousValue + currentValue;
		      	          });
		      	          var currentValue = dataset.data[tooltipItem.index];
		      	          var percentage = Math.round(currentValue * 100) / 100;
		      	          return data.labels[tooltipItem.index] + " : " + percentage + "명";
		      	          }
		      	        }
		      	      }
		          }
		        });
				
				acaStatChart = new Chart(document.getElementById("acaStatus"), {
				  type: 'bar',
				  data: {
				    labels: ["전체등록", "활성학원"],
				    datasets: [{
				    	backgroundColor: [	"rgba(255, 99, 132, 0.9)",
				        					"rgba(255, 159, 64, 0.9)",
				        					"rgba(255, 205, 86, 0.9)",
				        					"rgba(75, 192, 192, 0.9)",
				        					"rgba(54, 162, 235, 0.9)",
				        					"rgba(153, 102, 255, 0.9)",
				        					"rgba(201, 203, 207, 0.9)",
				        					"rgba(255, 99, 132, 0.9)",
				        					"rgba(255, 159, 64, 0.9)",
				        					"rgba(255, 205, 86, 0.9)",
				        					"rgba(75, 192, 192, 0.9)",
				        					"rgba(54, 162, 235, 0.9)",
				        					"rgba(153, 102, 255, 0.9)",
				        					"rgba(201, 203, 207, 0.9)"],
				        borderColor: [	"rgb(255, 99, 132)",
				        				"rgb(255, 159, 64)",
				        				"rgb(255, 205, 86)",
				        				"rgb(75, 192, 192)",
				        				"rgb(54, 162, 235)",
				        				"rgb(153, 102, 255)",
				        				"rgb(201, 203, 207)",
				        				"rgb(255, 99, 132)",
				        				"rgb(255, 159, 64)",
				        				"rgb(255, 205, 86)",
				        				"rgb(75, 192, 192)",
				        				"rgb(54, 162, 235)",
				        				"rgb(153, 102, 255)",
				        				"rgb(201, 203, 207)"],
				      data: [4215, 5312],
				    }],
				  },
				  options: {
					  tooltips: {
					        callbacks: {
					          label: function(tooltipItem, data) {
					              var label = data.datasets[tooltipItem.datasetIndex].label || '';
					
					              if (label) {
					                  label += ' : ';
					              }
					              label += Math.round(tooltipItem.yLabel * 100) / 100;
					              label += '개';
					              return label;
					          }
					        }
					      },
				    scales: {
				    	yAxes: [{
					          gridLines: {
					            display: true
					          },
					          stacked: false,
					          ticks: {
					        	beginAtZero:true,
					        	maxTicksLimit: 10
					          }
					        }],
					        xAxes: [{
					          barPercentage: .75,
					          categoryPercentage: .5,
					          stacked: false
					        }]
				    },
				    legend: {
				      display: false
				    }
				  }
				});
				
				postCntChart = new Chart(document.getElementById("postCnt"), {
					  type: 'bar',
					  data: {
					    labels: ["자유게시판", "상담게시판", "후기게시판"],
					    datasets: [{
					    	backgroundColor: [	"rgba(54, 162, 235, 0.9)",
					        					"rgba(153, 102, 255, 0.9)",
					        					"rgba(255, 205, 86, 0.9)",
					        					"rgba(75, 192, 192, 0.9)",
					        					"rgba(54, 162, 235, 0.9)",
					        					"rgba(153, 102, 255, 0.9)",
					        					"rgba(201, 203, 207, 0.9)"],
					        borderColor: [	"rgb(54, 162, 235)",
					        				"rgb(153, 102, 255)",
					        				"rgb(255, 205, 86)",
					        				"rgb(75, 192, 192)",
					        				"rgb(54, 162, 235)",
					        				"rgb(153, 102, 255)",
					        				"rgb(201, 203, 207)"],
					      data: [300, 120, 100],
					    }],
					  },
					  options: {
						  tooltips: {
						        callbacks: {
						          label: function(tooltipItem, data) {
						              var label = data.datasets[tooltipItem.datasetIndex].label || '';
						
						              if (label) {
						                  label += ' : ';
						              }
						              label += Math.round(tooltipItem.yLabel * 100) / 100;
						              label += '개';
						              return label;
						          }
						        }
						      },
					    scales: {
					    	yAxes: [{
						          gridLines: {
						            display: true
						          },
						          stacked: false,
						          ticks: {
						        	beginAtZero: true,
						        	maxTicksLimit: 10
						          }
						        }],
						        xAxes: [{
						          barPercentage: .75,
						          categoryPercentage: .5,
						          stacked: false
						        }]
					    },
					    legend: {
					      display: false
					    }
					  }
					});
			<%
	           		}
	           	}
			%>
			conChart = new Chart(document.getElementById("conChart"), {
				  type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      label: "상담게시글",
					  fill: false,
				      backgroundColor: "rgba(32, 178, 170, 0.9)",
				   	  borderColor: "#20B2AA",
				      data: [10,10,10,10,10,10,10,10,10,10,10,10],
				    },{
					    label: "상담신청자",
						fill: false,
					    backgroundColor: "rgba(25, 25, 112, 0.9)",
					    borderColor: "#191970",
					    data: [15,14,13,16,5,8,8,10,12,11,19,10]
					  }],
				  },
				  options: {
					  tooltips: {
					        callbacks: {
					          label: function(tooltipItem, data) {
					              var label = data.datasets[tooltipItem.datasetIndex].label || '';
					
					              if (label) {
					                  label += ' : ';
					              }
					              label += Math.round(tooltipItem.yLabel * 100) / 100;
					              label += (tooltipItem.datasetIndex==0?'개' : '명');
					              return label;
					          }
					        }
					      },
				    scales: {
				      xAxes: [{
				        gridLines: {
				          display: true
				        },
				        ticks: {
				          maxTicksLimit: 12
				        }
				      }],
				      yAxes: [{
				        ticks: {
						  beginAtZero:true,
				          maxTicksLimit: 5
				        },
				        gridLines: {
				          display: true
				        }
				      }],
				    },
				    legend: {
				      display: true
				    }
				  }
				});
	        
			graChart = new Chart(document.getElementById("graChart"), {
				  type: 'line',
				  data: {
				    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				    datasets: [{
				      label: "평점",
				      lineTension: 0.3,
				      backgroundColor: "rgba(2,117,216,0.2)",
				      borderColor: "rgba(2,117,216,1)",
				      pointRadius: 5,
				      pointBackgroundColor: "rgba(2,117,216,1)",
				      pointBorderColor: "rgba(255,255,255,0.8)",
				      pointHoverRadius: 5,
				      pointHoverBackgroundColor: "rgba(2,117,216,1)",
				      pointHitRadius: 50,
				      pointBorderWidth: 2,
				      data: [3.5, 4, 1.2, 4, 4.5, 5, 4.7, 4.9, 3.9, 4, 4.1, 4],
				    }],
				  },
				  options: {
					  tooltips: {
					        callbacks: {
					          label: function(tooltipItem, data) {
					              var label = data.datasets[tooltipItem.datasetIndex].label || '';
					
					              if (label) {
					                  label += ' : ';
					              }
					              label += Math.round(tooltipItem.yLabel * 100) / 100;
					              label += '점';
					              return label;
					          }
					        }
					      },
				    scales: {
				      xAxes: [{
				        time: {
				          unit: 'date'
				        },
				        gridLines: {
				          display: true
				        }
				      }],
				      yAxes: [{
				        ticks: {
				        	min: 0,
				            max: 5,
				          maxTicksLimit: 10
				        },
				        gridLines: {
				          color: "rgba(0, 0, 0, .125)",
				        }
				      }],
				    },
				    legend: {
				      display: false
				    }
				  }
				});
        });
        	$(document).ready(function(){
        		<%
        		if(mvo != null){
	           		if(mvo.getMauth().equals("3")){
    		%>
    			ajaxGetMemType();
    			ajaxGetAcaStat();
    			ajaxGetPostCnt();
    		<%
	           		}
	           	}
    		%>
    			if($('#acano').val() != null && $('#acano').val() != ""){
    				ajaxGetMonCnt();
    			}
        	});
        		<%
	        		if(mvo != null){
		           		if(mvo.getMauth().equals("3")){
        		%>
        			function ajaxGetMemType(){
        				$.ajax({
        					url : "getMemType.ec",
        					type :"post"
        				}).done(function(result){
        					console.log(result);
        					setData(result.memType, ctx, 1)
        				}).fail(function(result){
        					console.log("fail");
        					console.log(result);
        				})	
        			};
        			function ajaxGetAcaStat(){
        				$.ajax({
        					url : "getAcaStat.ec",
        					type :"post"
        				}).done(function(result){
        					console.log(result);
        					setData(result.acaStat, acaStatChart, 1)
        				}).fail(function(result){
        					console.log("fail");
        					console.log(result);
        				})
        			}
        			function ajaxGetPostCnt(){
        				$.ajax({
        					url : "getPostCnt.ec",
        					type :"post"
        				}).done(function(result){
        					console.log(result);
        					setData(result.getPostCnt, postCntChart, 1)
        				}).fail(function(result){
        					console.log("fail");
        					console.log(result);
        				})
        			}
        		<%
		           		}
		           	}
        		%>
       		function ajaxGetMonCnt(){
   				var ano = $('#acano').val()
   				var cnt = new Date().getMonth();
   				$.ajax({
   					url : "getMonCnt.ec",
   					type :"post",
   					data : {
   						"ano" : ano,
   						"cnt" : cnt
   					},
   					dataType : "json"
   				}).done(function(result){
   					console.log(result);
   					setData(result,conChart, 2);
   					setData(result.monGraCnt,graChart, 2);
   				}).fail(function(result){
   					console.log("fail");
   					console.log(result);
   				})
   			}
        	
        	function setData(value, chart, k){
        		console.log(value);
        		if(k == 1){
	        		chart.config.data.labels =[];
	        		chart.config.data.datasets[0].data = [];
	        		for(var i in value){
	        			for(var j in value[i]){
	        				var key = j;
	        				var val = value[i][j];
	        				
	        				chart.config.data.labels.push(key);
	        				chart.config.data.datasets[0].data.push(val);
	        			}
	        		}   			
        		}else if(k==2){
        			console.log("k==2");
        			if(value.monConCnt != null && value.monResCnt != null){
        				chart.config.data.datasets[0].data = [];
        				chart.config.data.datasets[1].data = [];
        				for(var i in value.monConCnt){
        					chart.config.data.datasets[0].data.push(value.monConCnt[i]);
        					chart.config.data.datasets[1].data.push(value.monResCnt[i]);
        				}
        			}else if(value != null){
        				chart.config.data.datasets[0].data = [];
        				for(var i in value){
        					chart.config.data.datasets[0].data.push(value[i]);
        				}
        			}
        		}
        		chart.update();
        	};
        </script>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/EduCatch/assets/js/manageScripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>