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
      labels: ["언어", "예체능", "보습"],
      datasets: [{
        label: "올해 평균학원비",
        backgroundColor: "#41d492",
        borderColor: "#41d492",
        hoverBackgroundColor: "#41d492",
        hoverBorderColor: "#41d492",
        data: ['50', '60', '70']
      }, {
        label: "작년 평균학원비",
        backgroundColor: "#7b7b7b70",
        borderColor: "#7b7b7b70",
        hoverBackgroundColor: "#7b7b7b70",
        hoverBorderColor: "#7b7b7b70",
        data: ['45', '55', '65']
      }]
    },
    options: {
      maintainAspectRatio: false,
      legend: {
        display: true
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
            display: false
          },
          stacked: false,
          ticks: {
            stepSize: 500
          }
        }],
        xAxes: [{
          barPercentage: .75,
          categoryPercentage: .5,
          stacked: false,
          gridLines: {
            color: "transparent"
          }
        }]
      }
    }
});
</script>
</main>
<jsp:include page="../../../footer.jsp" flush="true">
<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>