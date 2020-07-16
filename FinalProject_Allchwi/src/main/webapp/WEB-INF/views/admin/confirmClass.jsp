<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div style="float: center;">
			<c:forEach var="vo" items="${list }">
				<div class="row"
					style="width: 565px; display: inline-block; float: left; margin-left: 40px; margin-bottom: 20px;">
					<div class="col-md-12">
						<div class="card">
							<h5 class="card-header" style="text-align: center;">
								${vo.class_title }
								<button type="button" class="btn btn-danger"
									style="float: right">삭제</button>
							</h5>

							<div class="card-body" style="height: 188px;">
								<div style="display: inline-block;">
									<img src="${cp }/resources/img/모찌.jpg"
										style="width: 160px; height: 173px; margin-top: -130px;">
								</div>
								<div style="display: inline-block; margin-left: 60px;">
									<p>강사명: ${vo.tutor_nickname }</p>
									<p>장소: ${vo.class_address }</p>
									<p>신청인원: ${vo.people }명 / 위시인원: ${vo.wish_count }명</p>  
									<a href="#" class="btn btn-success btn-icon-split"  onclick="getModal('${vo.class_num}')" data-toggle="modal" data-target="#myModal"> <span
										class="icon text-white-50"> <i class="fas fa-check"></i>
									</span> 
									<span class="text">심사완료</span>
									</a> <a href="#" class="btn btn-danger btn-icon-split" data-toggle="modal" data-target="#myModal2"
										onclick="getModal2('${vo.class_num}')"> <span
										class="icon text-white-50"> <i
											class="fas fa-exclamation-triangle"></i></span> <span class="text">심사반려</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div>

	<div>
		<ul class="pagination justify-content-center" style="margin: 20px 0">
			<c:choose>
				<c:when test="${pu.startPageNum>1 }">
					<li class="page-item"><a class="page-link"
						href="${cp }/admin/confirmClass?pageNum=${pu.startPageNum-1 }&field=${field}&keyword=${keyword}">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				</c:otherwise>
			</c:choose>



			<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum==i}">
						<li class="page-item active"><a class="page-link"
							href="${cp }/admin/confirmClass?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/confirmClass?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>




			<c:choose>
				<c:when test="${pu.totalPageCount>pu.endPageNum }">
					<li class="page-item"><a class="page-link"
						href="${cp }/admin/confirmClass?pageNum=${pu.endPageNum+1 }&field=${field}&keyword=${keyword}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>


</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modal-body">
      		
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- 수업 거절 모달-->
<div class="modal" id="myModal2">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modal-body">
   			
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
	function getModal(class_num){
		$("div [class='modal-footer']").empty();
		$("div[class='modal-body']").text(class_num + "승인");

		$("div [class='modal-footer']")
				.append(
						"<button type='button' class='btn btn-success' data-dismiss='modal' onclick=accept('"+class_num+"')>네</button>");

		$("div [class='modal-footer']")
				.append(
						"<button type='button' class='btn btn-danger' data-dismiss='modal'>아니오</button>")
		
	}
	function accept(class_num) {
		location.href = "${cp}/admin/acceptClass?class_num="+class_num;
	}
	
	
	function getModal2(class_num){
		$("div [class='modal-footer']").empty();
		
		$("div [class='modal-body']").append("<form action='${cp}/admin/denyClass'>");
		$("div [class='modal-body']").append("<textarea rows='5' cols='10' name='msg'></textarea>");
		$("div [class='modal-body']").append("<input type='submit' value='등록'>");
		
		$("div [class='modal-body']").append("</form>");
		
		
		$("div [class='modal-footer']")
				.append(
						"<button type='button' class='btn btn-success' data-dismiss='modal' onclick=deny('"+class_num+"')>네</button>");

		$("div [class='modal-footer']")
				.append(
						"<button type='button' class='btn btn-danger' data-dismiss='modal'>아니오</button>")
		
	}
	function deny(class_num) {
		location.href = "${cp}/admin/denyClass?class_num="+class_num;
	}
	
	

</script>

</body>


