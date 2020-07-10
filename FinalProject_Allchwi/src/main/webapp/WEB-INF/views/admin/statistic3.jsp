<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
				[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

		var options = {
			title : 'My Daily Activities',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><a
						href="${cp }/admin/statistic1">월별 매출액</a></li>
					<li class="breadcrumb-item"><a href="${cp }/admin/statistic2">막대바
							그래프</a></li>
					<li class="breadcrumb-item"><a href="${cp }/admin/statistic3">기타
							그래프</a></li>
				</ol>
			</nav>


		</div>
	</div>
</div>

<div id="donutchart" style="width: 900px; height: 500px;"></div>
