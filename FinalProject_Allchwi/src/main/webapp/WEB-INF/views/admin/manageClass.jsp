<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h1>수업관리</h1>

			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Product</th>
						<th>Payment Taken</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>1</td>
							<td>${vo.num}</td>
							<td>${vo.name }</td>
							<td>${vo.pwd }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<div>
				<c:if test="${pu.startPageNum>1 }">
					<a href="${cp }/admin/manageClass?pageNum=${pu.startPageNum-1 }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
					<a href="${cp }/admin/manageClass?pageNum=${i }">${i }</a>
				</c:forEach>
				<c:if test="${pu.totalPageCount>pu.endPageNum }">
					<a href="${cp }/admin/manageClass?pageNum=${pu.endPageNum+1 }">[다음]</a>
				</c:if>
			</div>






			<div>
				<form method="post" action="/test/board/list">
					<select name="field">
						<option value="title"
							<c:if test="${field =='title'}">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${field=='content'}">selected="selected"</c:if>>내용</option>
						<option value="sum"
							<c:if test="${field=='sum'}">selected="selected"</c:if>>제목+내용</option>
					</select> <input type="text" name="search"> <input type="submit"
						value="검색">
				</form>
			</div>







		</div>
	</div>
</div>