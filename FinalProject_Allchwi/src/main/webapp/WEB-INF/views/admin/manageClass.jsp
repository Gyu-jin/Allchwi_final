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
				<form action="${cp }/admin/manageClass">
					<select name="field">
						<option value="num">번호</option>
						<option value="name">이름</option>
						<option value="pwd">비밀번호</option>
					</select> 
					<input type="text" name="search"> <input type="submit"value="검색">
				</form>
			</div>







		</div>
	</div>
</div>