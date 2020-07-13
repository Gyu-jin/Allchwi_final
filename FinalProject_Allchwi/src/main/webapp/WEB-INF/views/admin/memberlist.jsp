<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<!-- Custom fonts for this template -->
<link href="${cp }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${cp }/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${cp }/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>



<!-- Page Wrapper -->
<div id="wrapper">
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">회원관리</h1>


				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">회원리스트</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>회원코드</th>
										<th>이름</th>
										<th>아이디</th>
										<th>등록일</th>
										<th>추방</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list }">
										<tr>
											<td>${vo.mb_num}</td>
											<td>${vo.mb_name}</td>
											<td>${vo.id}</td>
											<td>${vo.mb_regdate}</td>
											<td>
												<button type="button" class="btn btn-danger"
													onclick="getModal('${vo.id}')" data-toggle="modal"
													data-target="#myModal">추방</button>
											</td>


										</tr>
									</c:forEach>
								</tbody>
							</table>
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




<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원 추방</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body" id="modal-body">
			
			
			</div>

			<!-- Modal footer -->
			
			<div class="modal-footer">
				<!-- 
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				 -->
			</div>

		</div>
	</div>
</div>


<script type="text/javascript">
		function getModal(id){
			$("div [class='modal-footer']").empty();
			$("#modal-body").text( id + "님 을 추방하시겠습니까?");
			$("div [class='modal-footer']")
			.append("<button type='button' class='btn btn-success' data-dismiss='modal' onclick=del('"+id+"')>네</button>");	
			
			$("div [class='modal-footer']")
			.append("<button type='button' class='btn btn-danger' data-dismiss='modal'>아니오</button>")	
		}
		
		function del(id){
			location.href="${cp}/admin/memberlist/delete?id="+id;
		}
		

</script>




</body>
</html>






