<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>

<div id="content-wrapper" class="d-flex flex-column">
<div class="container-fluid">
	<div class="breadcrumb">
			<h2>
				<a href="${cp }/admin/payment">회원결제내역</a>
			</h2>
			<div style="margin-left: 65%;">
				<form action="${cp }/admin/payment" class="form-inline"
					style="display: inline-block">
					<select class="form-control col-2" name="field"
						style="display: inline-block; width: 700px;">
						<option value="num"
							<c:if test="${field == 'num'}">selected</c:if>>번호</option>
						<option value="name"
							<c:if test="${field == 'name'}">selected</c:if>>이름</option>
						<option value="pwd"
							<c:if test="${field == 'pwd'}">selected</c:if>>비밀번호</option>
					</select> <input class="form-control mr-sm-2" type="text" name="keyword" />
					<button class="btn btn-primary my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
		</div>

	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>비밀번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.num }</td>
					<td>${vo.name }</td>
					<td>${vo.pwd }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	
	<div>
		<ul class="pagination justify-content-center" style="margin: 20px 0">
			<c:choose>
				<c:when test="${pu.startPageNum>1 }">
					<li class="page-item"><a class="page-link"
						href="${cp }/admin/payment?pageNum=${pu.startPageNum-1 }&field=${field}&keyword=${keyword}">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				</c:otherwise>
			</c:choose>



			<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum==i}">
						<li class="page-item active"><a class="page-link"
							href="${cp }/admin/payment?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/payment?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>




			<c:choose>
				<c:when test="${pu.totalPageCount>pu.endPageNum }">
					<li class="page-item"><a class="page-link"
						href="${cp }/admin/payment?pageNum=${pu.endPageNum+1 }&field=${field}&keyword=${keyword}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
 	
</div>
</div>

