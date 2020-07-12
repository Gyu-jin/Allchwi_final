<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
</style>

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


<body id="page-top">
	<!-- Page Wrapper -->
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column"
		style="height: 800px;">

		<!-- Main Content -->
		<div id="content">

			<!-- ///////탑바/////// -->

			<!-- Page Heading -->
			
			<div class="breadcrumb">
				<h2>수업목록</h2>
				<div style="margin-left: 631px;">
				<select class="form-control col-2" style="display: inline-block; width: 550px;">
					<option>11</option>
					<option>22</option>
				</select>
				<form class="form-inline" style="display: inline-block">
					<input class="form-control mr-sm-2" type="text" />
					<button class="btn btn-primary my-2 my-sm-0" type="submit">
						Search</button>
				</form>
				</div >
			</div>




			<!-- Begin Page Content -->


			<div class="row" style="width: 565px;">
				<div class="col-md-12">
					<div class="card">
						<h5 class="card-header" style="text-align: center;">수업제목 <button type="button" class="btn btn-danger" style="float:right">삭제</button></h5>
						
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






			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->




	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


</body>


