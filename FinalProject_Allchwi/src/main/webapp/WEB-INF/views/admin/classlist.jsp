<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#classcontent {
	position: relative;
	left: 225px;
	bottom: 197px;
}
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
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">수업목록</h1>
				</div>


				<!-- ///////탑바/////// -->
				<div class="row bg-info">
					 <select name="cat" class="form-control col-1">
					
					  </select>
					<!-- 검색창  -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<!-- /////// 탑바  끝   /////// -->
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div class="row">
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">드롭다운 카드</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">드롭다운 Header:</div>
											<a class="dropdown-item" href="#">액션1</a> <a
												class="dropdown-item" href="#">액션2</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">무언가</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div>
										<img src="${cp }/resources/img/모찌.jpg">
										<div id="classcontent">
											심사대기 <br> 수강인원:0명 / 위시인원:0명
										</div>
									</div>


									<div>
										<a href="#" class="btn btn-success btn-icon-split"> <span
											class="icon text-white-50"> <i class="fas fa-check"></i>
										</span> <span class="text">심사완료</span>
										</a> <a href="#" class="btn btn-danger btn-icon-split"> <span
											class="icon text-white-50"> <i
												class="fas fa-exclamation-triangle"></i>
										</span> <span class="text">심사반려</span>
										</a>


									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->



		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


</body>


