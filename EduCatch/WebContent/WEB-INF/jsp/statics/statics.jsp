<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</head>
<body>
<main>
<div class="container" style="height: 390px;">
<canvas id="myChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
var chart;
document.addEventListener("DOMContentLoaded", function(event) {
	chart = new Chart(document.getElementById("myChart"), {
		type: 'bar',
	    data: {
	      labels: ["언어","예체능","보습","평생교육"],
	      datasets: [{
	        label: "평균학원비",
	        fill : false,
	        backgroundColor: [	"rgba(255, 0, 0, 0.9)",
	        					"rgba(255, 69, 0, 0.9)",
	        					"rgba(255, 255, 0, 0.9)",
	        					"rgba(0, 128, 0, 0.9)",
	        					"rgba(54, 162, 235, 0.9)",
	        					"rgba(153, 102, 255, 0.9)",
	        					"rgba(210, 105, 30, 0.9)",
	        					"rgba(255, 99, 132, 0.9)",
	        					"rgba(255, 159, 64, 0.9)",
	        					"rgba(255, 205, 86, 0.9)",
	        					"rgba(75, 192, 192, 0.9)",
	        					"rgba(54, 162, 235, 0.9)",
	        					"rgba(153, 102, 255, 0.9)",
	        					"rgba(210, 105, 30, 0.9)"],
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
	        borderwidth : 1,
	        data: ['50', '60', '55', '70']
	      }]
	    },
	    options: {
	      maintainAspectRatio: false,
	      legend: {
	        display: false
	      },
	      tooltips: {
	        callbacks: {
	          label: function(tooltipItem, data) {
	              var label = data.datasets[tooltipItem.datasetIndex].label || '';
	
	              if (label) {
	                  label += ' : ';
	              }
	              label += Math.round(tooltipItem.yLabel * 100) / 100;
	              label += '만원';
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
	        	beginAtZero:false,
	            stepSize: 5
	          }
	        }],
	        xAxes: [{
	          barPercentage: .75,
	          categoryPercentage: .5,
	          stacked: false
	        }]
	      }
	    }
	});
});
$(document).ready(function(){
	ajaxGetAvgPrice();
});

function ajaxGetAvgPrice(){
	$.ajax({
		url : "getAvgPrice.ec",
		type :"post"
	}).done(function(result){
		console.log(result);
		setData(result.avgList)
	}).fail(function(result){
		console.log("fail");
		console.log(result);
	})
}
function setData(value){
	console.log(value);
	chart.config.data.labels =[];
	chart.config.data.datasets[0].data = [];
	for(var i in value){
		var data = value[i].CMAJOR;
		var price = value[i].AVG;
		
		chart.config.data.labels.push(data);
		chart.config.data.datasets[0].data.push(price);
	}
	
	chart.update();
}
</script>
</main>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>