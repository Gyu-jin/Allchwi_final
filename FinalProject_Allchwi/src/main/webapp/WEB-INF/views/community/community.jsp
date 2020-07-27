<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
style>.carousel-inner {
	position: relative;
	width: 70%; margin : auto;
	overflow: hidden;
	margin: auto;
}

.carousel {
	position: relative;
	background-color: #A9C8FB;
}
/*a carousel 이미지 크기 */
.carousel-item>img {
	object-fit: fill;
	height: 450px;
}
</style>

<div class="container">
	<!-- jumbotron 패딩 사이즈 0으로 변경 -->
	<div class="jumbotron p-0 p-md-0 text-white rounded bg-light">
		<!-- a 기존 온라인 클래스 틀 
    <div class="col-md-6 px-0">
      <h1 class="display-4 font-italic">Title of a longer featured blog post</h1>
      <p class="lead my-3">Multiple lines of text that form the lede, informing new readers quickly and efficiently about what’s most interesting in this post’s contents.</p>
      <p class="lead mb-0"><a href="#" class="text-white font-weight-bold">Continue reading...</a></p>
    </div>
     -->
		<!-- 메인 배너  -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${cp}/resources/img/배너1.png" class="d-block w-100"
						alt="배너1">
				</div>
				<div class="carousel-item">
					<img src="${cp}/resources/img/배너2.png" class="d-block w-100"
						alt="배너2">
				</div>
				<div class="carousel-item">
					<img src="${cp}/resources/img/배너3.png" class="d-block w-100"
						alt="배너3">
				</div>
			</div>
			<!--a 좌우이동 flex-start, flex-end로 변경  -->
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev" style="justify-content: flex-start">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next" style="justify-content: flex-end">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 메인배너 끝 -->
	</div>

	<div class="row mb-2">
		<div class="col-md-6">
			<div
				class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">Notice</strong>
					<h3 class="mb-0">공지사항</h3>
					<div class="mb-1 text-muted">[이번주 등록된 공지사항]</div>
					<c:choose>
						<c:when test="${noticeCount != 0}">
							<p class="card-text mb-auto">등록된 공지사항이 ${noticeCount}개 있습니다.
							<br>공지를 확인해주시기 바랍니다. &nbsp :)</p>
						</c:when>
						<c:otherwise>
							<p class="card-text mb-auto">이번주 등록된 공지사항이 없습니다.</p>
						</c:otherwise>
					</c:choose>
					<a href="${cp}/community/notice" class="stretched-link">바로가기</a>
				</div>
				<!-- a 이미지 출력 -->
				<div class="col-auto d-none d-lg-block">
					<img class="bd-placeholder-img" width="200" height="250" 
					alt="puppy" src="${cp}/resources/img/puppy.jpg">
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div
				class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-success">Design</strong>
					<h3 class="mb-0">Post title</h3>
					<div class="mb-1 text-muted">Nov 11</div>
					<p class="mb-auto">This is a wider card with supporting text
						below as a natural lead-in to additional content.</p>
					<a href="#" class="stretched-link">Continue reading</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<svg class="bd-placeholder-img" width="200" height="250"
						xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: Thumbnail">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#55595c"></rect>
						<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				</div>
			</div>
		</div>
	</div>
</div>