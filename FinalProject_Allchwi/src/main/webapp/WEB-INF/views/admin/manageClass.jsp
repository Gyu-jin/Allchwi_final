<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<div class="container-fluid">
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="breadcrumb">
			<h2>수업관리</h2>
			<div style="margin-left: 65%;">
				<form action="${cp }/admin/manageClass" class="form-inline"
					style="display: inline-block">
					<select class="form-control col-2" name="field"
						style="display: inline-block; width: 700px;">
						<option value="ml_num"
							<c:if test="${field == 'ml_num'}">selected</c:if>>회원번호</option>
						<option value="tutor_nickname"
							<c:if test="${field == 'tutor_nickname'}">selected</c:if>>강사이름</option>
						<option value="class_title"
							<c:if test="${field == 'class_title'}">selected</c:if>>수업제목</option>
						<option value="scategory_name"
							<c:if test="${field == 'scategory_name'}">selected</c:if>>카테고리</option>
					</select> <input class="form-control mr-sm-2" type="text" name="keyword" />
					<button class="btn btn-primary my-2 my-sm-0" type="submit">
						검색</button>
				</form>
			</div>
		</div>




		<table class="table table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>수업제목</th>
					<th>수업형태</th>
					<th>카테고리</th>
					<th>수강인원</th>
					<th>상세페이지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.ml_num}</td>
						<td>${vo.tutor_nickname }</td>
						<td>${vo.class_title }</td>
						<c:choose>
							<c:when test="${vo.class_form == 0}">
								<td>오프라인</td>
							</c:when>
							<c:otherwise>
								<td>온라인</td>
							</c:otherwise>
						</c:choose>
						<td>${vo.scategory_name }</td>
						<td>${vo.people}명</td>
						<td><a href="#" style="color:blue" data-toggle="modal" data-target="#myModal" onclick="getModal()">수업
								상세정보</a></td>
					<tr>
				</c:forEach>

			</tbody>
		</table>
		<div>
			<ul class="pagination justify-content-center" style="margin: 20px 0">
				<c:choose>
					<c:when test="${pu.startPageNum>1 }">
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/manageClass?pageNum=${pu.startPageNum-1 }&field=${field}&keyword=${keyword}">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					</c:otherwise>
				</c:choose>



				<c:forEach var="i" begin="${pu.startPageNum}"
					end="${pu.endPageNum }">
					<c:choose>
						<c:when test="${pu.pageNum==i}">
							<li class="page-item active"><a class="page-link"
								href="${cp }/admin/manageClass?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${cp }/admin/manageClass?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>




				<c:choose>
					<c:when test="${pu.totalPageCount>pu.endPageNum }">
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/manageClass?pageNum=${pu.endPageNum+1 }&field=${field}&keyword=${keyword}">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>



		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header" >
						<h4 class="modal-title">수업 상세정보</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" id="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<!-- 
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
					 -->
				</div>
			</div>
		</div>
	
	</div>
</div>	
	
<script type="text/javascript">
	function getModal() {
		$.ajax({
			url:"${cp}/classDetail/detail2?class_num=4",
			dataType:"text",
			success:function(data){
				$("#modal-body").html(data);
			}
		});
		
	}
		
		
		
		
	
</script>


