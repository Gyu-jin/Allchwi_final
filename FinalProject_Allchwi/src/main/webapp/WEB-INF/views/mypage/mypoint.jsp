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
					<div class="contents">홍길동 [test111@naver.com]</div>
		</div>
		<div class="inner-cont" style="padding-top: 0">	
					<div class="label-title">현재포인트</div>
					<div class="contents"><b>1000</b>point</div>
		</div>
		<div class="inner-cont">
			<div>
				<button class="btn btn-outline-secondary">전체 내역</button>
				<button class="btn btn-outline-secondary">사용 내역</button>
				<button class="btn btn-outline-secondary">적립 내역</button>
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
					</tbody>
				</table>
			</div>
		</div>
		<div class="inner-cont" style="text-align: center;">
			페이징
		</div>
		<div style="padding-top: 400px"></div>
	</div>
</div>
<script type="text/javascript">
window.onload = function(){
	
}
</script>