<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>	

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>클래스 리스트</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>


<div id="content-wrapper" class="d-flex flex-column"
	style="height: 800px;">
	<div id="content" class="container-fluid">

		<div class="breadcrumb">
			<h2>수업목록</h2>
			<div style="margin-left: 860px;">
				<select class="form-control col-2"
					style="display: inline-block; width: 550px;">
					<option>11</option>
					<option>22</option>
				</select>
				<form class="form-inline" style="display: inline-block">
					<input class="form-control mr-sm-2" type="text" />
					<button class="btn btn-primary my-2 my-sm-0" type="submit">
						Search</button>
				</form>
			</div>
		</div>




		<!-- Begin Page Content -->


		<div class="row" style="width: 565px;" data-toggle="modal" data-target="#myModal" onclick="dataSetting()">
		<script>
			function dataSetting(){
				$.ajax({
					url:"${cp}/admin/category",
					dataType: "text",
					success: function(data){	
						alert(data);
						/*
						$(data).each(function(i,arr){
							var bcategory_num= arr.bcategory_num;
							var bcategory_name= arr.bcategory_name;
							var scategory_name = arr.scategory_name;
							var scategory_num = arr.scategory_num;
							
							if(scategory_num == null || scategory_num ==""){
								scategory_num=0;
							}
							
							$("#tb").append("<tr>");
								$("#tb").append("<td>"+bcategory_num+"</td>");
								$("#tb").append("<td>"+bcategory_name+"</td>");
								if(scategory_name==undefined){
									$("#tb").append("<td> </td>");
								}else{
									$("#tb").append("<td>"+scategory_name+"</td>");
								}
								$("#tb").append("<td><button type='button' class='btn btn-outline-secondary del_btn' onclick='del("+ scategory_num+","+ bcategory_num+")'>삭제</button></td>");
							$("#tb").append("</tr>");
						});	
						
						*/
					},
					error:function(request,status,error){
						alert(request);
					}
				});
			}
		</script>
			<div class="col-md-12">
				<div class="card">
					<h5 class="card-header" style="text-align: center;">
						수업제목
						<button type="button" class="btn btn-danger" style="float: right">삭제</button>
					</h5>

					<div class="card-body" style="height: 140px;">
						<div style="display: inline-block;">
							<img src="${cp }/resources/img/모찌.jpg"
								style="width: 130px; height: 130px; margin-top: -100px;">
						</div>
						<div style="display: inline-block; margin-left: 60px;">
							<p>심사상태</p>

							<p>신청인원:0명 / 위시인원:0명</p>
							<a href="#" class="btn btn-success btn-icon-split"> <span
								class="icon text-white-50"> <i class="fas fa-check"></i>
							</span> <span class="text">심사완료</span>
							</a> <a href="#" class="btn btn-danger btn-icon-split"> <span
								class="icon text-white-50"> <i
									class="fas fa-exclamation-triangle"></i></span> <span class="text">심사반려</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Button to Open the Modal -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#myModal">Open modal</button> -->

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">수업상세페이지</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" id="modal-body">Modal body..
					
					
					
						
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>




</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>


</body>


