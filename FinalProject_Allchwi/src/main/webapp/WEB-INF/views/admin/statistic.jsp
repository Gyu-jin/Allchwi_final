<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization
				.arrayToDataTable([ [ '월별', '매출액', 'Expenses' ],
						[ '4월', 100, 5000 ], [ '5월', 1170, 460 ],
						[ '6월', 660, 1120 ], [ '7월', 1030, 540 ] ]);

		var options = {
			title : '월별 실적',
			hAxis : {
				title : '월별 ',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}


	
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="#">11</a>
					</li>
					<li class="breadcrumb-item">
						<a href="#">22</a>
					</li>
					<li class="breadcrumb-item active">
						33
					</li>
				</ol>
			</nav>
		</div>
	</div>
</div>	
	
<div id="chart_div" style="width: 800px; height: 500px;"></div>		