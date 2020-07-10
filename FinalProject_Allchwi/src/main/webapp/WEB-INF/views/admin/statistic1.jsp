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
	
	
	 google.charts.load('current', {'packages':['bar']});
     google.charts.setOnLoadCallback(drawStuff);

     function drawStuff() {
       var data = new google.visualization.arrayToDataTable([
         ['Opening Move', 'Percentage'],
         ["King's pawn (e4)", 44],
         ["Queen's pawn (d4)", 31],
         ["Knight to King 3 (Nf3)", 12],
         ["Queen's bishop pawn (c4)", 10],
         ['Other', 3]
       ]);

       var options = {
         title: 'Chess opening moves',
         width: 900,
         legend: { position: 'none' },
         chart: { title: 'Chess opening moves',
                  subtitle: 'popularity by percentage' },
         bars: 'horizontal', // Required for Material Bar Charts.
         axes: {
           x: {
             0: { side: 'top', label: 'Percentage'} // Top x-axis.
           }
         },
         bar: { groupWidth: "90%" }
       };

       var chart = new google.charts.Bar(document.getElementById('top_x_div'));
       chart.draw(data, options);
     };
    
	
</script>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item active"><a href="${cp }/admin/statistic1">월별 매출액</a></li>
					<li class="breadcrumb-item"><a href="${cp }/admin/statistic2">막대바 그래프</a></li>
					<li class="breadcrumb-item"><a href="${cp }/admin/statistic3">기타 그래프</a></li>
				</ol>
			</nav>
		
		<div id="chart_div" style="width: 800px; height: 500px;"></div>
		</div>
	</div>
</div>


