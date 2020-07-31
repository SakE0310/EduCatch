<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="../../../top.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
<main>
<canvas id="myChart"></canvas>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
	type: 'bar',
    data: {
      labels: ["언어","예체능","보습","평생교육"],
      datasets: [{
        label: "평균학원비",
        fill : false,
        backgroundColor: ["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],
        borderColor: ["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],
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
        intersect: false,
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
        	beginAtZero:true,
            stepSize: 10
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
</script>
<img src="/EduCatch/assets/img/favicon.ico" alt="이미지당" />
</main>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>