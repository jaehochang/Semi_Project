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
		<div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
			<div class="card-header">
				<a href="member.ao?" class='cha'>Member</a>
			</div>
			<div class="card-body">
				<h5 class="card-title"></h5>
				<p class="card-text"></p>
			</div>
		</div>
		<div class="card text-white bg-success mb-3" style="max-width: 20rem;">
			<div class="card-header">
				<a href="group.ao" class='cha'>Group</a>
			</div>
			<div class="card-body">
				<h5 class="card-title"></h5>
				<p class="card-text"></p>
			</div>
		</div>
		<div class="card text-white bg-warning mb-3" style="max-width: 20rem;">
			<div class="card-header">
				<a href="meetup.ao" class='cha'>Meet Now</a>
			</div>
			<div class="card-body">
				<h5 class="card-title"></h5>
				<p class="card-text"></p>
			</div>
		</div>
		<div class="card text-white bg-danger mb-3" style="max-width: 20rem;">
			<div class="card-header">
				<a href="meetup.ao" class='cha'>Report</a>
			</div>
			<div class="card-body">
				<h5 class="card-title"></h5>
				<p class="card-text"></p>
			</div>
		</div>
	</div>
</div>



	<!-- 
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
</script> -->
	</body>
	</html>