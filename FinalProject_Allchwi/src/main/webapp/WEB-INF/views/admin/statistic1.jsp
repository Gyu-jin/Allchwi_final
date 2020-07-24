<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>




<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">

			<!-- 
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
			 -->



			<!-- 현재년도 -->
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="sysYear">
				<fmt:formatDate value="${now}" pattern="yyyy" />
			</c:set>

			<button type="button" id="twoyearsago"
				class="btn btn-outline-secondary">
				<c:out value="${sysYear-2}" />년
			</button>
			<button type="button" id="lastyear" class="btn btn-outline-secondary">
				<c:out value="${sysYear-1}" />년
			</button>
			<button type="button " id="thisyear" class="btn btn-outline-secondary active" >
				<c:out value="${sysYear}" />년
			</button>

			<div id="chart_div" style="width: 1000px; height: 500px;"></div>
		</div>
	</div>
</div>



<!-- 어레이 한개 만들어놓고 어래이에 푸쉬로 -->
<script type="text/javascript">
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var year = $("#thisyear").html();
		var thisyear = parseInt(year);
		var nextyear = thisyear + 1;

		$.getJSON({
			url : "${cp}/admin/statisticAjax1",
			data : {
				thisyear : thisyear,
				nextyear : nextyear
			},
			success : function(data) {
				getData(data);
			}
		});
	}
	
	$("#lastyear").click(function(){
	
		google.charts.load('current', {'packages' : [ 'corechart' ]});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var year = $("#lastyear").html();
			var thisyear = parseInt(year);
			var nextyear = thisyear + 1;

			$.getJSON({
				url : "${cp}/admin/statisticAjax1",
				data : {
					thisyear : thisyear,
					nextyear : nextyear
				},
				success : function(data) {
					$("#chart_div").empty();
					getData(data);
				}
			});
		}
		
		
		
	});
	
	
	$("#twoyearsago").click(function(){
	
	
		google.charts.load('current', {'packages' : [ 'corechart' ]});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var year = $("#twoyearsago").html();
			var thisyear = parseInt(year);
			var nextyear = thisyear + 1;

			$.getJSON({
				url : "${cp}/admin/statisticAjax1",
				data : {
					thisyear : thisyear,
					nextyear : nextyear
				},
				success : function(data) {
					$("#chart_div").empty();
					getData(data);
				}
			});
		}
	});
	
	
	
	$("#thisyear").click(function(){
		google.charts.load('current', {'packages' : [ 'corechart' ]});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var year = $("#thisyear").html();
			var thisyear = parseInt(year);
			var nextyear = thisyear + 1;

			$.getJSON({
				url : "${cp}/admin/statisticAjax1",
				data : {
					thisyear : thisyear,
					nextyear : nextyear
				},
				success : function(data) {
					$("#chart_div").empty();
					getData(data);
				}
			});
		}
	});
	
	
	
	function getData(data){
		var array = new Array();
		array[0] = [ '월별', '매출액' ];

		$(data).each(function(i, arr) {
			var subArray = [ arr.month+"월", arr.monthlySum ];
			array[++i] = subArray;
		});

		var data2 = google.visualization.arrayToDataTable(array);

		var options = {
			title : '월별 실적  [단위:원]',
			hAxis : {
				title : '월별',
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

		chart.draw(data2, options);
	}
	

	
</script>



