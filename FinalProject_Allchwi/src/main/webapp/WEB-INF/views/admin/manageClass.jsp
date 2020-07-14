<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="breadcrumb">
			<h2>수업관리</h2>
			<div style="margin-left: 860px;">
				<form action="${cp }/admin/manageClass" class="form-inline"
					style="display: inline-block">
					<select class="form-control col-2" name="field"
						style="display: inline-block; width: 550px;">
						<option value="num">번호</option>
						<option value="name">이름</option>
						<option value="pwd">비밀번호</option>
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
					<th>클래스넘버</th>
					<th>수강인원	</th>
				</tr>
			</thead>
			<tbody>			
				<c:forEach var="vo" items="${list }" varStatus="i">
					<tr>
						<td>${vo.ml_num}</td>
						<td>${vo.tutor_nickname }</td>
						<td>${vo.class_title }</td>
						<td>${vo.class_form }</td>
						<td>${vo.scategory_name }</td>
						<td>${vo.class_num }</td>
						<td>${list2[i.index]}</td>
					<tr>
				</c:forEach>

			</tbody>
		</table>
		<div>
			<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:choose>
					<c:when test="${pu.startPageNum>1 }">
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/manageClass?pageNum=${pu.startPageNum-1 }&field=${field}&keyword=${keyword}">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled" ><a class="page-link" href="#">이전</a></li>
					</c:otherwise>
				</c:choose>


		
				<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
					<li class="page-item"><a class="page-link" href="${cp }/admin/manageClass?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
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

	


	</div>
</div>