<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><a
						href="${cp }/admin/statistic1">월별 매출액</a></li>
					<li class="breadcrumb-item"><a href="${cp }/admin/statistic2">막대바
							그래프</a></li>
					<li class="breadcrumb-item"><a href="${cp }/admin/statistic3">카테고리
							점유율</a></li>
				</ol>
			</nav>


		</div>
	</div>
</div>

<div id="donutchart" style="width: 900px; height: 500px;"></div>




<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		$.getJSON({
			url : "${cp}/admin/statisticAjax3",
			success : function(data) {
				var array = new Array();
				array[0] = [ 123, 33 ];
				
				$(data).each(function(i, arr) {
					var subArray = [ arr.cate_count, arr.bcategory_name ];
					array[++i] = subArray;
				});
				
				var data2 = google.visualization.arrayToDataTable(array);

				var options = {
					title : '카테고리별 비중',
					pieHole : 0.4,
				};

				var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
				chart.draw(data2, options);

			}
		});
	}
</script>
