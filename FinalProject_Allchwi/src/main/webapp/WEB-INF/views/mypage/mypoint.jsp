<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${cp}/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="/allchwi/resources/css/mypage/mypointForm.css">
<div class="container">
	<!--point head-->
	<div class="pointHead">
		<h1>내 포인트</h1>
	</div>
	<!--point body-->
	<div class="container">
		<div class="inner-cont" style="padding-top: 0">
			<div class="label-title">이름 [ID]</div>
			<div class="contents">${list[0].mb_name} [ ${list[0].id} ]</div>
		</div>
		<div class="inner-cont" style="padding-top: 0">
			<div class="label-title">현재 보유 포인트</div>
			<div class="contents">
				<b>${total}</b> point
			</div>
		</div>
		<div class="inner-cont">
			<div>
				<!-- 버튼클릭시 ajax 처리 -->
				<button class="btn btn-outline-secondary" name='sortBtn'>전체 내역</button>
				<button class="btn btn-outline-secondary" name='sortBtn' value="u">사용 내역</button>
				<button class="btn btn-outline-secondary" name='sortBtn' value="s">적립 내역</button>
			</div>
		</div>
		<div class="inner-cont">
			<div id="table">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">일자</th>
							<th scope="col">포인트 적립/사용 내역</th>
							<th scope="col">포인트</th>
						</tr>
					</thead>
					<tbody id="tb">
						<!-- 회원의 포인트 적립 사용리스트 foreach로 출력 -->
						<!-- test="${vo.point_type eq 'u'.charAt(0)}" char형식 비교 s: 적립포인트 / u: 사용포인트-->
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.point_regdate }</td>
								<td>${vo.point_name }</td>
								<c:choose>
									<c:when test="${vo.point_type eq 'u'.charAt(0)}">
										<td style="color: red">-${vo.point }</td>
									</c:when>
									<c:otherwise>
										<td style="color: blue">+${vo.point }</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="inner-cont" style="text-align: center;">
			<ul class="pagination justify-content-center" style="margin: 20px 0">
			<!-- 이전페이지로 이동 버튼 생성 / 넘어갈수 없을 경우 disabled 처리 -->
			<c:choose>
				<c:when test="${pu.startPageNum > 1 }">
					<li class="page-item">
						<a class="page-link" href="${cp }/mypage/pointForm?pageNum=${pu.startPageNum -1}">이전</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link">이전</a>
					</li>
				</c:otherwise>
			</c:choose>
			<!-- 페이징 처리 -->
			<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
				<c:choose>
					<c:when test="${pu.pageNum==i}">
						<li class="page-item active">
						<a class="page-link" href="${cp }/mypage/pointForm?pageNum=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
						<a class="page-link" href="${cp }/mypage/pointForm?pageNum=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음페이지로 이동 버튼 생성 / 넘어갈 수 없을 경우 disabled 처리 -->
			<c:choose>
				<c:when test="${pu.endPageNum < pu.totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="${cp }/mypage/pointForm?pageNum=${pu.endPageNum +1}">다음</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link">다음</a>
					</li>
				</c:otherwise>
			</c:choose>
			</ul>
		</div>
		<div style="padding-top: 400px"></div>
	</div>
</div>
<script type="text/javascript">
	//버튼 클릭시 정렬
	$("button[name='sortBtn']").on('click',function(){
		alert($(this).val());
	});
</script>