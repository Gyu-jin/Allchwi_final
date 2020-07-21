<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.5.1.js"></script>	
	
<div class="container-fluid">
	<div id="content-wrapper" class="d-flex flex-column">
	<div class="breadcrumb">
		<h2>송금승인신청</h2>
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

	<table class="table table-hover table-bordered">
		<thead class="thead-dark">
			<tr>
				<th>회원번호</th>
				<th>강사이름</th>
				<th>수업제목</th>
				<th>신청금액</th>
				<th>은행명/계좌번호</th>
				<th>신청일</th>
				<th>신청상태</th>
				<th>송금 승인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
				
					<td>${vo.ml_num}</td>
					<td>${vo.tutor_nickname}</td>
					<td>${vo.class_title}</td>
					<td>${vo.rem_pay}</td>
					<td>${vo.rem_bank} / ${vo.rem_account }</td>
					<td>${vo.rem_regdate}</td>
					<td>${vo.rem_status}</td>
				 	<td><button type="button" class="btn btn-success" onclick="accept()">승인</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div>
		<ul class="pagination justify-content-center" style="margin: 20px 0">
			<c:choose>
				<c:when test="${pu.startPageNum>1 }">
					<li class="page-item"><a class="page-link"
						href="${cp }/admin/remit?pageNum=${pu.startPageNum-1 }&field=${field}&keyword=${keyword}">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
				</c:otherwise>
			</c:choose>



			<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum==i}">
						<li class="page-item active"><a class="page-link"
							href="${cp }/admin/remit?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${cp }/admin/remit?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>




			<c:choose>
				<c:when test="${pu.totalPageCount>pu.endPageNum }">
					<li class="page-item"><a class="page-link"
						href="${cp }/admin/remit?pageNum=${pu.endPageNum+1 }&field=${field}&keyword=${keyword}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	
	</div>
</div>

<script>
	function accept(){
		confirm();
		
	}



</script>