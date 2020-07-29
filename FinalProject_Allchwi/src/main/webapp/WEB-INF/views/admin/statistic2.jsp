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
							점유율 </a></li>
				</ol>
			</nav>


		</div>
	</div>
</div>

<div id="top_x_div" style="width: 1146px; height: 500px;"></div>


<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawStuff);

	function drawStuff() {
		$.getJSON({
			url : "${cp}/admin/statisticAjax2",
			success : function(data) {
				var array = new Array();
				array[0] = [ '수업명', '위시 수' ];
				$(data).each(function(i, arr) {
					var subArray = [arr.title,arr.cnt ];
					
					
					
					array[++i] = subArray;
				});
				
				
				var data2 = new google.visualization.arrayToDataTable(array);

				var options = {
					title : 'Chess opening moves',
					width : 900,
					legend : {
						position : 'none'
					},
					chart : {
						title : 'Chess opening moves',
						subtitle : 'popularity by percentage'
					},
					bars : 'horizontal', // Required for Material Bar Charts.
					axes : {
						x : {
							0 : {
								side : 'top',
								label : 'Percentage'
							}
						// Top x-axis.
						}
					},
					bar : {
						groupWidth : "90%"
					}
				};

				var chart = new google.charts.Bar(document
						.getElementById('top_x_div'));
				chart.draw(data2, options);
			}
		});
	}
</script>




