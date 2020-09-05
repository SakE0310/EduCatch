// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
console.log("111");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [{
      label: "상담게시글",
	  fill: false,
      backgroundColor: "rgba(65, 212, 146, 0.5)",
   	  borderColor: "#41D492",
      data: [10,10,10,10,10,10,10,10,10,10,10,10],
    },{
	    label: "상담신청자",
		fill: false,
	    backgroundColor: "rgba(242, 102, 102, 0.5)",
	    borderColor: "#f26666",
	    data: [15,14,13,16,5,8,8,10,12,11,19,10]
	  }],
  },
  options: {
    scales: {
      xAxes: [{
        gridLines: {
          display: false
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
