<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>
<title>Admin Main</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>

<!-- include/top.jsp 에서 nav 삽입 -->

<div id="wrapper">
	<div class="cards">
		<div class="card text-white bg-primary mb-3">
			<div class="card-header">
				<a href="member.ao" class='cha'>New Member</a>
			</div>
			<div class="card-body">
				<h5 class="card-title">새로운 멤버신청 알림입니다.</h5>
				<p class="card-text"></p>
			</div>
		</div>
		<div class="card text-white bg-success mb-3">
			<div class="card-header">
				<a href="group.ao" class='cha'>New Group</a>
			</div>
			<div class="card-body">
				<h5 class="card-title">새로운 그룹 신청알림입니다.</h5>
				<p class="card-text"></p>
			</div>
		</div>
		<div class="card text-white bg-warning mb-3">
			<div class="card-header">
				<a href="meetup.ao" class='cha'>New Meet Now</a>
			</div>
			<div class="card-body">
				<h5 class="card-title">새로운 Meet Now 알림입니다.</h5>
				<p class="card-text"></p>
			</div>
		</div>
		<div class="card text-white bg-danger mb-3">
			<div class="card-header">
				<a href="report.ao" class='cha'>Report</a>
			</div>
			<div class="card-body">
				<h5 class="card-title">신고 알림입니다.</h5>
				<p class="card-text"></p>
			</div>
		</div>
	</div>
</div>

<canvas id="myChart" style="max-width: 500px;"></canvas>

<script>
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ "06.22", "06.23", "06.24", "06.25", "06.26", "06.27" ],
			datasets : [ {
				label : '# of Votes',
				data : [ 15, 19, 3, 5, 2, 3 ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ],
				borderWidth : 1,
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
</script>

<div id="piechart"></div>

<script type="text/javascript">
	// Load google charts
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	// Draw the chart and set the chart values
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ '10대', 2 ], [ '20대', 3 ],
				[ '30대', 3 ], [ '40대', 2 ], [ '50대', 1 ] ]);

		// Optional; add a title and set the width and height of the chart
		var options = {
			'title' : 'My Average Day',
			'width' : 550,
			'height' : 400
		};

		// Display the chart inside the <div> element with id="piechart"
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));
		chart.draw(data, options);
	}
</script>
</body>
</html>